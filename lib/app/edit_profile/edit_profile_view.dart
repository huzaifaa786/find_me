// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unused_local_variable
import 'package:find_me/app/edit_profile/components/profilecontainer.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'edit_profile_controller.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        toolbarHeight: 83.h,
        title: topBar(name: 'My profiles', showBackIcon: false),
      ),
      body: SafeArea(
        child: GetBuilder<EditProfileController>(
          autoRemove: false,
          builder: (controller) {
            return Column(
              children: [
                Gap(53.h),
                Row(
                  children: [
                    Gap(49.h),
                    AppText(
                      title: 'Mark as default',
                      size: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                Gap(10.w),
                Row(
                  children: [
                    Gap(36.w),
                    GestureDetector(
                      onTap: () {
                        controller.toggleDefault(1, !controller.isDefault1);
                      },
                      child: ProfileContainer(
                        isSelected: controller.isSelected1,
                        isDefault: controller.isDefault1,
                        avatarUrl: controller.selectedItem.avatarUrl,
                        verified: false,
                        onToggle: (value) {
                          controller.toggleDefault(1, value);
                        },
                        textController: controller.controller1,
                      ),
                    ),
                  ],
                ),
                Gap(10.w),
                Row(
                  children: [
                    Gap(36.w),
                    GestureDetector(
                      onTap: () {
                        controller.toggleDefault(2, !controller.isDefault2);
                      },
                      child: ProfileContainer(
                        isSelected: controller.isSelected2,
                        isDefault: controller.isDefault2,
                        avatarUrl: controller.selectedItem.avatarUrl,
                        verified: false,
                        onToggle: (value) {
                          controller.toggleDefault(2, value);
                        },
                        textController: controller.controller2,
                      ),
                    ),
                  ],
                ),
                Gap(10.w),
                Row(
                  children: [
                    Gap(36.w),
                    GestureDetector(
                      onTap: () {
                        controller.toggleDefault(3, !controller.isDefault3);
                      },
                      child: ProfileContainer(
                        isSelected: controller.isSelected3,
                        isDefault: controller.isDefault3,
                        avatarUrl: controller.selectedItem.avatarUrl,
                        verified: false,
                        onToggle: (value) {
                          controller.toggleDefault(3, value);
                        },
                        textController: controller.controller3,
                      ),
                    ),
                  ],
                ),
                Gap(10.w),
                Row(
                  children: [
                    Gap(36.w),
                    GestureDetector(
                      onTap: () {
                        controller.toggleDefault(4, !controller.isDefault4);
                      },
                      child: ProfileContainer(
                        isSelected: controller.isSelected4,
                        isDefault: controller.isDefault4,
                        avatarUrl: controller.selectedItem.avatarUrl,
                        verified: false,
                        onToggle: (value) {
                          controller.toggleDefault(4, value);
                        },
                        textController: controller.controller4,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
