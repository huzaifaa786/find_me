import 'package:find_me/api/profile_api/profile_api.dart';
import 'package:find_me/models/user_profile_model.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditUrlController extends GetxController {
  static EditUrlController instance = Get.find();
  TextEditingController whatsappController = TextEditingController();
  TextEditingController linkedinController = TextEditingController();
  TextEditingController instagramController = TextEditingController();
  TextEditingController tiktokController = TextEditingController();
  TextEditingController xController = TextEditingController();
  TextEditingController telegramController = TextEditingController();
  TextEditingController snapchatController = TextEditingController();
  TextEditingController facebookController = TextEditingController();
  TextEditingController youtubeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  UserProfileModel? profileModel;

  @override
  void onInit() {
    profileModel ??= Get.arguments;
    updateInputs();
    super.onInit();
  }

  void updateInputs() {
    if (profileModel!.urls != null) {
      whatsappController.text = profileModel!.urls!.whatsapp ?? '';
      instagramController.text = profileModel!.urls!.instagram ?? '';
      tiktokController.text = profileModel!.urls!.tiktok ?? '';
      xController.text = profileModel!.urls!.x ?? '';
      telegramController.text = profileModel!.urls!.telegram ?? '';
      snapchatController.text = profileModel!.urls!.snapchat ?? '';
      facebookController.text = profileModel!.urls!.facebook ?? '';
      youtubeController.text = profileModel!.urls!.youtube ?? '';
      emailController.text = profileModel!.urls!.email ?? '';
      linkedinController.text = profileModel!.urls!.linkedin ?? '';
      websiteController.text = profileModel!.urls!.website ?? '';
    }
  }

  void disposeControllers() {
    whatsappController.dispose();
    instagramController.dispose();
    tiktokController.dispose();
    xController.dispose();
    telegramController.dispose();
    snapchatController.dispose();
    facebookController.dispose();
    youtubeController.dispose();
    emailController.dispose();
    linkedinController.dispose();
    websiteController.dispose();
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  Future<void> updateUrls({
    isRemove = false,
  }) async {
    try {
      var response = await ProfileApi.updateProfileUrls(
        userProfileId: profileModel?.id,
        whatsapp: whatsappController.text,
        instagram: instagramController.text,
        tiktok: tiktokController.text,
        x: xController.text,
        telegram: telegramController.text,
        snapchat: snapchatController.text,
        facebook: facebookController.text,
        youtube: youtubeController.text,
        email: emailController.text,
        linkedin: linkedinController.text,
        website: websiteController.text,
      );

      if (response.isNotEmpty) {
        if (isRemove) {
          Get.back();
          UiUtilites.successSnackbar("Url removed successfully".tr, "");
        } else {
          update();
          UiUtilites.successCustomSnackbar("Updated successfully".tr,
              position: 10);
        }
      } else {
        UiUtilites.errorSnackbar('Error'.tr, 'Failed to update URLs'.tr);
      }
    } catch (e) {
      UiUtilites.errorSnackbar('Error'.tr, 'Failed to update URLs: $e'.tr);
    }
  }
}
