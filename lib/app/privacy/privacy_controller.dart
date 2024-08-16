import 'package:find_me/api/auth_api/user_api.dart';
import 'package:find_me/api/privacy_api/privacy_api.dart';
import 'package:find_me/models/user_model.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:get/get.dart';

class PrivacyController extends GetxController {
  static PrivacyController instance = Get.find();

  UserModel? userModel;
  Map<String, bool> profileGrantAccess = {};
  Map<String, bool> socialGrantAccess = {};

  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  Future getUser() async {
    var response = await UserApi.getUser();
    if (response.isNotEmpty) {
      userModel = UserModel.fromJson(response['user']);
      userModel?.profiles?.forEach((profile) {
        profileGrantAccess[profile.id.toString()] =
            profile.isProfilePublic ? true : false;
        socialGrantAccess[profile.id.toString()] =
            profile.isSocialPublic ? true : false;
      });
    }
    update();
  }

  void toggleProfileGrantAccess(String profileId, bool value) {
    profileGrantAccess[profileId] = value;
    update();
  }

  void toggleSocialGrantAccess(String profileId, bool value) {
    socialGrantAccess[profileId] = value;
    update();
  }

  Future profilePrivacy(String profileId) async {
    var response = await PrivacyApi.profilePrivacy(
      publicProfile: profileGrantAccess[profileId],
      publicSocial: socialGrantAccess[profileId],
      profileId: profileId,
    );

    if (response.isNotEmpty) {
      print("Profile ID: $profileId updated");
    } else {
      UiUtilites.errorSnackbar("Privacy Error".tr, "error".tr);
    }

    update();
  }
}
