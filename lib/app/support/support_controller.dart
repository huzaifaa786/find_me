import 'package:find_me/api/auth_api.dart/user_api.dart';
import 'package:find_me/models/user_model.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportController extends GetxController {
  static SupportController get instance => Get.find();
  UserModel? userModel;
  String emailAddress = '';
  String subject = 'Hello from my Flutter app!';
  String body = 'This is the body of the email.';
  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  Future getUser() async {
    var response = await UserApi.getUser();
    if (response.isNotEmpty) {
      userModel = UserModel.fromJson(response['user']);
      emailAddress = userModel!.currentProfile!.businessCard!.email!;
    }
    update();
  }

  sendEmail() async {
    String url = 'mailto:$emailAddress?subject=$subject&body=$body';
    launchUrl(Uri.parse(url));
  }
}
