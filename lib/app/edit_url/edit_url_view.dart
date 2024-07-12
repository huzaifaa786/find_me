// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:find_me/app/edit_url/edit_url_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/components/textfields/app_textfields.dart';
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
                title: topBar(showBackIcon: true, name: "Edit URL’s"),
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 44.w),
                    child: Column(
                      children: [
                        Gap(71),
                        AppTextFields(
                          icon: "assets/icons/whatsapp1.svg",
                          hintText: "Whatsapp Url",
                          controller: controller.whatsappController,
                          width: 40.w,
                          height: 40.h,
                        ),
                        Gap(24),
                        AppTextFields(
                          icon: "assets/icons/instagram_black.svg",
                          hintText: "Instagram Url",
                          controller: controller.instagramController,
                          width: 30.w,
                          height: 30.h,
                        ),
                        Gap(24),
                        AppTextFields(
                          icon: "assets/icons/tiktok_black.svg",
                          hintText: "TikTok Url",
                          controller: controller.tiktokController,
                          width: 30.w,
                          height: 30.h,
                        ),
                        Gap(24),
                        AppTextFields(
                          icon: "assets/icons/twitter-x 1.svg",
                          hintText: "X Url",
                          controller: controller.xController,
                          width: 30.w,
                          height: 30.h,
                        ),
                        Gap(24),
                        AppTextFields(
                          icon: "assets/icons/telegram-plane.svg",
                          hintText: "Telegram Url",
                          controller: controller.telegramController,
                          width: 30.w,
                          height: 30.h,
                        ),
                        Gap(24),
                        AppTextFields(
                          icon: "assets/icons/snapchat.svg",
                          hintText: "SnapChat Url",
                          controller: controller.snapchatController,
                          width: 30.w,
                          height: 30.h,
                        ),
                        Gap(24),
                        AppTextFields(
                          icon: "assets/icons/facebook_black.svg",
                          hintText: "facebook Url",
                          controller: controller.facebookController,
                          width: 25.w,
                          height: 25.h,
                        ),
                        Gap(24),
                        AppTextFields(
                          icon: "assets/icons/youtube.svg",
                          hintText: "YouTube Url",
                          controller: controller.youtubeController,
                          width: 35.w,
                          height: 35.h,
                        ),
                        Gap(24),
                        AppTextFields(
                          icon: "assets/icons/gmail.svg",
                          hintText: "Email Url",
                          controller: controller.emailController,
                          width: 30.w,
                          height: 30.h,
                        ),
                        Gap(47),
                        AppButton(
                            onTap: () {
                              controller.updateUrls();
                            },
                            height: 46.h,
                            width: 280.w,
                            title: "Update"),
                        Gap(104),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
