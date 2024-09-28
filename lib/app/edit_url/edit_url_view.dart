import 'package:find_me/app/edit_url/edit_url_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/components/textfields/app_textfields.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:find_me/components/buttons/app_button.dart';

class EditUrlView extends StatefulWidget {
  const EditUrlView({super.key});

  @override
  State<EditUrlView> createState() => _EditUrlViewState();
}

class _EditUrlViewState extends State<EditUrlView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditUrlController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          title: topBar(showBackIcon: true, name: "Edit URLs".tr),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 44.w),
              child: Column(
                children: [
                  Gap(41),
                  buildStackedUrlField(controller, "assets/icons/snapchat.svg",
                      "Snapchat URL", controller.snapchatController),
                  Gap(24),
                  buildStackedUrlField(
                      controller,
                      "assets/icons/instagram_black.svg",
                      "Instagram URL",
                      controller.instagramController),
                  Gap(24),
                  buildStackedUrlField(
                      controller,
                      "assets/icons/twitter-x 1.svg",
                      "X URL",
                      controller.xController),
                  Gap(24),
                  buildStackedUrlField(
                      controller,
                      "assets/icons/telegram-plane.svg",
                      "Telegram URL",
                      controller.telegramController),
                  Gap(24),
                  buildStackedUrlField(controller, "assets/icons/whatsapp1.svg",
                      "Whatsapp URL", controller.whatsappController),
                  Gap(24),
                  buildStackedUrlField(
                      controller,
                      "assets/icons/tiktok_black.svg",
                      "TikTok URL",
                      controller.tiktokController),
                  Gap(24),
                  buildStackedUrlField(controller, "assets/icons/linkedin.svg",
                      "Linkedin URL", controller.linkedinController),
                  Gap(24),
                  buildStackedUrlField(controller, "assets/icons/gmail.svg",
                      "Email URL", controller.emailController),
                  Gap(24),
                  buildStackedUrlField(controller, "assets/icons/web.svg",
                      "Website url", controller.websiteController),
                  Gap(24),
                  buildStackedUrlField(controller, "assets/icons/youtube.svg",
                      "YouTube URL", controller.youtubeController),
                  Gap(24),
                  buildStackedUrlField(
                      controller,
                      "assets/icons/facebook_black.svg",
                      "Facebook URL",
                      controller.facebookController),
                  Gap(47),
                  AppButton(
                    onTap: () {
                      controller.updateUrls();
                    },
                    height: 46.h,
                    width: 280.w,
                    title: "Update".tr,
                  ),
                  Gap(104),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildStackedUrlField(EditUrlController controller, String icon,
      String hintText, TextEditingController fieldController) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        AppTextFields(
          icon: icon,
          hintText: hintText.tr,
          controller: fieldController,
          width: 25.w,
          height: 25.h,
        ),
        if (fieldController.text.isNotEmpty)
          Positioned(
            right: 0,
            child: IconButton(
              icon: Icon(Icons.cancel, color: Colors.red),
              onPressed: () {
                UiUtilites.accountAlert(context,
                    text: "Are you sure you want to remove URL", onTapNo: () {
                  Get.back();
                }, onTapYes: () {
                  fieldController.clear();
                  controller.updateUrls(isRemove: true);
                  controller.update();
                });
              },
            ),
          ),
      ],
    );
  }
}
