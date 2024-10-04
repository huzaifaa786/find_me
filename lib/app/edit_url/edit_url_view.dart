import 'package:find_me/app/edit_url/edit_url_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/components/appbars/url_topbar.dart';
import 'package:find_me/components/textfields/app_textfields.dart';
import 'package:find_me/components/textfields/url_textfields.dart';
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
                  buildStackedUrlField(
                      controller,
                      "assets/icons/snapchat.svg",
                      controller.snapchatController,
                      "https://www.snapchat.com/add/"),
                  Gap(24),
                  buildStackedUrlField(
                      controller,
                      "assets/icons/instagram_black.svg",
                      controller.instagramController,
                      "https://www.instagram.com/"),
                  Gap(24),
                  buildStackedUrlField(
                      controller,
                      "assets/icons/twitter-x 1.svg",
                      controller.xController,
                      "https://www.x.com/@"),
                  Gap(24),
                  buildStackedUrlField(
                      controller,
                      "assets/icons/telegram-plane.svg",
                      controller.telegramController,
                      "https://t.me/"),
                  Gap(24),
                  buildStackedUrlField(controller, "assets/icons/whatsapp1.svg",
                      controller.whatsappController, "https://wa.me/+"),
                  Gap(24),
                  buildStackedUrlField(
                      controller,
                      "assets/icons/tiktok_black.svg",
                      controller.tiktokController,
                      "https://www.tiktok.com/@"),
                  Gap(24),
                  buildStackedUrlField(
                      controller,
                      "assets/icons/linkedin.svg",
                      controller.linkedinController,
                      "https://www.linkedin.com/in/"),
                  Gap(24),
                  buildStackedUrlField(controller, "assets/icons/gmail.svg",
                      controller.emailController, "mailto:"),
                  Gap(24),
                  buildStackedUrlField(controller, "assets/icons/web.svg",
                      controller.websiteController, "https://"),
                  Gap(24),
                  buildStackedUrlField(
                      controller,
                      "assets/icons/youtube.svg",
                      controller.youtubeController,
                      "https://www.youtube.com/channel/"),
                  Gap(24),
                  buildStackedUrlField(
                      controller,
                      "assets/icons/facebook_black.svg",
                      controller.facebookController,
                      "https://www.facebook.com/"),

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
      TextEditingController fieldController,
      String prefixText) {
    return UrlTextFields(
      icon: icon,
      controller: fieldController,
      prefixText: prefixText, // Add prefixText for non-editable URL
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
          controller.updateUrls(isRemove: true);
          controller.update();
        });
      },
    );
  }

}
