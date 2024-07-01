// ignore_for_file: prefer_const_constructors

import 'package:find_me/app/notifications_permissions/notifications_permissions_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/components/buttons/text_switch_button.dart';
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
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationsPermissionsController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                scrolledUnderElevation: 0,
                title: topBar(name: "Notifications", showBackIcon: true),
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 34.w),
                    child: Column(
                      children: [
                        Gap(35),
                        TextSwitchButton(
                          title: "Emoji notifications",
                          size: 13.sp,
                          FontWeight: FontWeight.w500,
                          value: controller.emojiNotifications,
                          ontoggle: (value) {
                            controller.toggleEmojiNotifications(value);
                          },
                        ),
                        Gap(29),
                        Divider(
                          thickness: 1,
                          color: AppColors.black.withOpacity(0.08),
                        ),
                        Gap(24),
                        TextSwitchButton(
                          title: "Photos Notifications",
                          size: 13.sp,
                          FontWeight: FontWeight.w500,
                          value: controller.photosNotifications,
                          ontoggle: (value) {
                            controller.togglePhotosNotifications(value);
                          },
                        ),
                        Gap(25),
                        Divider(
                          thickness: 1,
                          color: AppColors.black.withOpacity(0.08),
                        ),
                        Gap(23),
                        TextSwitchButton(
                          title: "File Notifications",
                          size: 13.sp,
                          FontWeight: FontWeight.w500,
                          value: controller.fileNotifications,
                          ontoggle: (value) {
                            controller.toggleFileNotifications(value);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
