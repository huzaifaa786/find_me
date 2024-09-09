// ignore_for_file: prefer_const_constructors

import 'package:find_me/app/notifications_permissions/notifications_permissions_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/components/buttons/text_switch_button.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class NotificationsPermissionsView extends StatefulWidget {
  const NotificationsPermissionsView({super.key});

  @override
  State<NotificationsPermissionsView> createState() =>
      _NotificationsPermissionsViewState();
}

class _NotificationsPermissionsViewState
    extends State<NotificationsPermissionsView> {
      bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationsPermissionsController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                scrolledUnderElevation: 0,
                title: topBar(name: "Notifications".tr, showBackIcon: true),
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 34.w),
                    child: Column(
                      children: [
                        Gap(35),
                        TextSwitchButton(
                          title: "Emoji notifications".tr,
                          size: 13.sp,
                          FontWeight: FontWeight.w500,
                          value: controller.emojiNotifications,
                          ontoggle: (value) {
                            controller.toggleEmojiNotifications(value);
                          },
                        ),
                        Gap(9.h),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: AppText(
                            title:
                                "When emoji notifications are off then you won’t be \n  notified if you have received an emoji.".tr,
                            size: 10,
                            fontWeight: FontWeight.w400,
                            color: AppColors.hintGrey,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Gap(29),
                        Divider(
                          thickness: 1,
                          color: AppColors.black.withOpacity(0.08),
                        ),
                        Gap(24),
                        TextSwitchButton(
                          title: "Requests for profile".tr,
                          size: 13.sp,
                          FontWeight: FontWeight.w500,
                          value: controller.profileNotifications,
                          ontoggle: (value) {
                            controller.toggleProfileNotifications(value);
                          },
                        ),
                        Gap(9.h),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: AppText(
                            title:
                                "When requests for profiles are off you won’t receive  \n requests when someone wants to view your profile.".tr,
                            size: 10,
                            fontWeight: FontWeight.w400,
                            color: AppColors.hintGrey,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Gap(25),
                        Divider(
                          thickness: 1,
                          color: AppColors.black.withOpacity(0.08),
                        ),
                        Gap(23),
                        TextSwitchButton(
                          title:
                              "Requests for social media and  \n business cards".tr,
                          size: 13.sp,
                          FontWeight: FontWeight.w500,
                          value: controller.socialNotifications,
                          ontoggle: (value) {
                            controller.toggleSocialNotifications(value);
                          },
                        ),
                        Gap(15.h),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: AppText(
                            title:
                                "When requests for social media and business cards \n  are off you won’t be notified if someone is trying \n  to access your profile.".tr,
                            size: 10,
                            fontWeight: FontWeight.w400,
                            color: AppColors.hintGrey,
                            textAlign: TextAlign.left,
                          ),
                        ),
                       
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
