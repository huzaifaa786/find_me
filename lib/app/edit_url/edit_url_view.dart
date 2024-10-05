import 'package:find_me/app/edit_url/edit_url_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/components/appbars/url_topbar.dart';
import 'package:find_me/components/textfields/app_textfields.dart';
import 'package:find_me/components/textfields/url_textfields.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          title: urlTopBar(
              showBackIcon: true,
              name: "Edit URLs".tr,
              onTap: () {
                FocusScope.of(context).unfocus();
                controller.updateUrls();
              }),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 44.w),
              child: Column(
                children: [
                  Gap(41),
                  buildStackedUrlField(controller, "assets/icons/snapchat.svg",
                      "Snapchat url", controller.snapchatController, ""),
                  Gap(24),
                  buildStackedUrlField(
                      controller,
                      "assets/icons/instagram_black.svg",
                      " https://www.instagram.com/username",
                      controller.instagramController,
                      "https://www.instagram.com/"),
                  Gap(24),
                  buildStackedUrlField(
                      controller,
                      "assets/icons/twitter-x 1.svg",
                      " https://www.x.com/@username",
                      controller.xController,
                      "https://x.com/"),
                  Gap(24),
                  buildStackedUrlField(
                      controller,
                      "assets/icons/telegram-plane.svg",
                      "Telegram url",
                      controller.telegramController,
                      ""),
                  Gap(24),
                  buildStackedUrlField(
                      controller,
                      "assets/icons/whatsapp1.svg",
                      "https://wa.me/+(Country Code - Mobile number)",
                      controller.whatsappController,
                      "https://wa.me/+"),
                  Gap(24),
                  buildStackedUrlField(
                      controller,
                      "assets/icons/tiktok_black.svg",
                      "https://www.TikTok.com/@username",
                      controller.tiktokController,
                      "https://www.tiktok.com/"),
                  Gap(24),
                  buildStackedUrlField(controller, "assets/icons/linkedin.svg",
                      "LinkedIn url", controller.linkedinController, ""),
                  Gap(24),
                  buildStackedUrlField(controller, "assets/icons/gmail.svg",
                      "mail:abc@abc.com", controller.emailController, "mail:"),
                  Gap(24),
                  buildStackedUrlField(controller, "assets/icons/web.svg",
                      "Website url", controller.websiteController, ""),
                  Gap(24),
                  buildStackedUrlField(controller, "assets/icons/youtube.svg",
                      "YouTube url", controller.youtubeController, ""),
                  Gap(24),
                  buildStackedUrlField(
                      controller,
                      "assets/icons/facebook_black.svg",
                      "Facebook url",
                      controller.facebookController,
                      ""),
                  Gap(47),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildStackedUrlField(
      EditUrlController controller,
      String icon,
      String hintText,
      TextEditingController fieldController,
      String defaultText) {
    return UrlTextFields(
      defaultText: defaultText,
      icon: icon,
      hintText: hintText.tr,
      controller: fieldController,
      onEditingComplete: () {
        FocusScope.of(context).unfocus();
        controller.updateUrls();
      },
      onSuffixTap: () {
        UiUtilites.accountAlert(context,
            text: "Are you sure you want to remove URL", onTapNo: () {
          Get.back();
        }, onTapYes: () {
          fieldController.clear();
          FocusScope.of(context).unfocus();
          controller.updateUrls(isRemove: true,);
        });
      },
    );
  }
}
