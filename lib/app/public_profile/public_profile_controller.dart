import 'package:find_me/api/auth_api/user_api.dart';
import 'package:find_me/api/block_report_api/block_report_api.dart';
import 'package:find_me/api/emoji_api/emoji_api.dart';
import 'package:find_me/api/request_api/request_api.dart';
import 'package:find_me/models/profile_business_card_model.dart';
import 'package:find_me/models/profile_url_model.dart';
import 'package:find_me/models/user_model.dart';
import 'package:find_me/models/user_profile_model.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class PublicProfileController extends GetxController {
  static PublicProfileController instance = Get.find();
  TextEditingController commentController = TextEditingController();
  UserModel? userModel;
  UserProfileModel? profile;
  ProfileBusinessCardModel? businessCardModel;
  ProfileUrlModel? profileUrlModel;
  bool hasSocialAccess = false;
  late FocusNode focusNode;

  bool isEditSelected = false;

  @override
  void onInit() {
    profile ??= Get.arguments;
    getUser();
    super.onInit();
  }

  getUser() async {
    FirebaseAnalytics.instance.logEvent(
      name: 'visit_user_profile',
    );
    var response = await UserApi.userDetail(profile!.userId);

    if (response.isNotEmpty) {
      userModel = UserModel.fromJson(response['user']);
      for (var currentprofile in userModel!.profiles!) {
        if (profile?.id == currentprofile.id) {
          profile = currentprofile;
        }
      }
      businessCardModel = profile!.businessCard;

      if (profile!.urls != null) {
        profileUrlModel = profile!.urls;
      } else {
        profileUrlModel = ProfileUrlModel(id: 1, userProfileId: profile!.id);
      }
      update();
      if (!profile!.isSocialPublic) {
        checkRequest(userModel!);
      } else {
        hasSocialAccess = true;
        update();
      }
    }
  }

  checkRequest(UserModel user) async {
    var response =
        await RequestApi.checkRequest(user: user, requestType: "socialandcard");

    if (response.isNotEmpty) {
      if (response['Request'] == "Access") {
        hasSocialAccess = true;
        update();
      }
    }
  }

  launchSocialUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      UiUtilites.errorSnackbar("", "Invalid Url");
      // UiUtilites. Exception('Could not launch $_url');
    }
  }

  sendRequest(UserModel user) async {
    var response =
        await RequestApi.sendRequest(user: user, requestType: "socialandcard");

    if (response.isNotEmpty) {
      if (response['Request'] == "Sent") {
        FirebaseAnalytics.instance.logEvent(
          name: 'send_social_request',
        );
        UiUtilites.successSnackbar(
            "Request to access Social media accounts and business card has been sent",
            "Access Social Request");
      } else if (response['Request'] == "Access") {
        hasSocialAccess = true;
        update();
      }
    }
  }

  blockProfile() async {
    var response = await BlockReportApi.blockProfile(profile?.id);

    if (response.isNotEmpty) {
      Get.back();
      UiUtilites.successSnackbar(response['message'], "");
    }
  }

  updateData() {
    hasSocialAccess = true;
    update();
  }

  giftEmoji(emojiId) async {
    var response = await EmojiApi.giftEmoji(
        emojiId: emojiId,
        receiverId: profile!.id,
        comment: commentController.text);
    if (response.isNotEmpty) {
      if (response['error'] == true) {
        UiUtilites.errorSnackbar("Emoji Error", response['error_data']);
      } else {
        if (response['balance'] == "low") {
          UiUtilites.noCoinsEnoughAlert(Get.context);
        } else if (response['profile'] != null) {
          commentController.text = '';
          profile = UserProfileModel.fromJson(response['profile']);
          update();
          FirebaseAnalytics.instance.logEvent(
            name: 'gifted_emoji',
          );
          UiUtilites.successGreenAlert(Get.context,
              text: "Message has been sent \n successfully.", onTapDone: () {
            Get.back();
          });
        }
      }
    }
  }
}
