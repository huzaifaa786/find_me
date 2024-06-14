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
                          controller.toggleDefault1(!controller.isDefault1);
                        },
                        child: ProfileContainer(
                          isSelected: controller.isSelected1,
                          isDefault: controller.isDefault1,
                          avatarUrl: controller.selectedItem.avatarUrl,
                          title: 'Abdulllaaaaaaaaaaaaaahhhhhhhhhhhhhhhhhh',
                          verified: false,
                        
                          onToggle: (value) {
                            controller.toggleDefault1(value);
                          },
                        )),
                    
                  ],
                ),
                Gap(16.w),
                Row(
                  children: [
                    Gap(36.w),
                    GestureDetector(
                        onTap: () {
                          controller.toggleDefault2(!controller.isDefault2);
                        },
                        child: ProfileContainer(
                          isSelected: controller.isSelected2,
                          isDefault: controller.isDefault2,
                          avatarUrl: controller.selectedItem.avatarUrl,
                          title: controller.selectedItem.text,
                          verified: true,
                          onToggle: (value) {
                            controller.toggleDefault2(value);
                          },
                        )),
                    
                  ],
                ),
                Gap(16.w),
                Row(
                  children: [
                    Gap(36.w),
                    GestureDetector(
                        onTap: () {
                          controller.toggleDefault3(!controller.isDefault3);
                        },
                        child: ProfileContainer(
                          isSelected: controller.isSelected3,
                          isDefault: controller.isDefault3,
                          avatarUrl: controller.selectedItem.avatarUrl,
                          title: controller.selectedItem.text,
                          verified: false,
                          onToggle: (value) {
                            controller.toggleDefault3(value);
                          },
                        )),
                   
                  ],
                ),
                Gap(16.w),
                Row(
                  children: [
                    Gap(36.w),
                    GestureDetector(
                        onTap: () {
                          controller.toggleDefault4(!controller.isDefault4);
                        },
                        child: ProfileContainer(
                          isSelected: controller.isSelected4,
                          isDefault: controller.isDefault4,
                          avatarUrl: controller.selectedItem.avatarUrl,
                          title: controller.selectedItem.text,
                          verified: true,
                          onToggle: (value) {
                            controller.toggleDefault4(value);
                          },
                        )),
                   
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
