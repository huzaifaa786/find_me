import 'package:find_me/api/auth_api/user_api.dart';
import 'package:find_me/api/emoji_api/emoji_api.dart';
import 'package:find_me/api/profile_api/profile_api.dart';
import 'package:find_me/models/profile_business_card_model.dart';
import 'package:find_me/models/profile_url_model.dart';
import 'package:find_me/models/user_model.dart';
import 'package:find_me/models/user_profile_model.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController instance = Get.find();
  TextEditingController bioController = TextEditingController();
  UserModel? userModel;
  UserProfileModel? profile;
  ProfileBusinessCardModel? businessCardModel;
  ProfileUrlModel? profileUrlModel;
  late FocusNode focusNode;

  var i = 0;

  fggf() {
    i = 12;
    update();
  }

  bool isEditSelected = false;

  @override
  void onInit() {
    profile ??= Get.arguments;
    focusNode = FocusNode();
    focusNode.addListener(() {
      if (!focusNode.hasFocus && isEditSelected) {
        isEditSelected = false;
      }
    });

    getUser();
    super.onInit();
  }

  getUser() async {
    var response = await UserApi.getUser();
    if (response.isNotEmpty) {
      userModel = UserModel.fromJson(response['user']);

      for (var element in userModel!.profiles!) {
        if (element.id == profile?.id) {
          // print("AAAAAAAAAAaEEEE${element.emojis?.length}");
          profile = element;
        }
      }
      businessCardModel = profile!.businessCard;
      bioController.text = profile!.bio!;
      if (profile!.urls != null) {
        profileUrlModel = profile!.urls;
      } else {
        profileUrlModel = ProfileUrlModel(id: 1, userProfileId: profile!.id);
      }

      update();
    }
  }

  void updateProfileBio() async {
    var response = await ProfileApi.updateProfileBio(
        userProfileId: profile?.id, bio: bioController.text);
    if (response.isNotEmpty) {
      profile = UserProfileModel.fromJson(response['profile']);

      update();
      UiUtilites.successSnackbar("Updated successfully".tr,"");
    }
  }

  giftEmoji(emojiId) async {
    var response =
        await EmojiApi.giftEmoji(emojiId: emojiId, receiverId: profile!.id);
    if (response.isNotEmpty) {
      print(response);
      if (response['balance'] == "low") {
        UiUtilites.noCoinsEnoughAlert(Get.context);
      } else if (response['profile'] != null) {
        profile = UserProfileModel.fromJson(response['profile']);
        update();
        UiUtilites.successSnackbar("Emoji Gifted Successfully".tr, "");
      }
    }
  }
}
