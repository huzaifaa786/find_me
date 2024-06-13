// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'edit_profile_controller.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EditProfileController controller = Get.put(EditProfileController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        toolbarHeight: 83.h,
        title: topBar(name: 'My profiles'),
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
                      child: Container(
                        height: 68.h,
                        width: 290.w,
                        decoration: BoxDecoration(
                          color: AppColors.border_grey,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Row(
                          children: [
                            Checkbox(
                              shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(1)),
                              side: BorderSide(
                                color: AppColors.primary_color,
                                // width: 1,
                              ),
                              value: controller.isDefault1,
                              onChanged: (value) {
                                controller.toggleDefault1(value ?? false);
                              },
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                // color: Colors.blue,
                                borderRadius: BorderRadius.circular(80.r),
                                border: Border.all(
                                  color:
                                      AppColors.primary_color, // Border color
                                  width: 1, // Border width
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.shadow_black
                                        .withOpacity(0.25),
                                    spreadRadius: 1,
                                    blurRadius: 10.7,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                    controller.selectedItem.avatarUrl,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Gap(10.h),
                            AppText(
                              title: 'Almarwan general trd',
                              size: 10,
                              fontWeight: FontWeight.w500,
                            ),
                            Gap(10.h),
                            SvgPicture.asset('assets/icons/verified.svg'),
                          ],
                        ),
                      ),
                    ),
                    Gap(8.w),
                    AppText(
                      title: 'Edit',
                      size: 11,
                      color: AppColors.primary_color,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                Gap(16.w),
                Row(
                  children: [
                    Gap(36.w),
                    GestureDetector(
                      onTap: () {
                        controller.toggleDefault3(!controller.isDefault2);
                      },
                      child: Container(
                        height: 68.h,
                        width: 290.w,
                        decoration: BoxDecoration(
                          color: AppColors.border_grey,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Row(
                          children: [
                            Checkbox(
                              shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(1)),
                              side: BorderSide(
                                color: AppColors.primary_color,
                                // width: 1,
                              ),
                              value: controller.isDefault2,
                              onChanged: (value) {
                                controller.toggleDefault2(value ?? false);
                              },
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                // color: Colors.blue,
                                borderRadius: BorderRadius.circular(80.r),
                                border: Border.all(
                                  color:
                                      AppColors.primary_color, // Border color
                                  width: 1, // Border width
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.shadow_black
                                        .withOpacity(0.25),
                                    spreadRadius: 1,
                                    blurRadius: 10.7,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                    controller.selectedItem.avatarUrl,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Gap(10.h),
                            AppText(
                              title: 'Almarwan general trd',
                              size: 10,
                              fontWeight: FontWeight.w500,
                            ),
                            Gap(10.h),
                            // SvgPicture.asset('assets/icons/verified.svg'),
                          ],
                        ),
                      ),
                    ),
                    Gap(8.w),
                    AppText(
                      title: 'Edit',
                      size: 11,
                      color: AppColors.primary_color,
                      fontWeight: FontWeight.w500,
                    ),
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
                      child: Container(
                        height: 68.h,
                        width: 290.w,
                        decoration: BoxDecoration(
                          color: AppColors.border_grey,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Row(
                          children: [
                            Checkbox(
                              shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(1)),
                              side: BorderSide(
                                color: AppColors.primary_color,
                                // width: 1,
                              ),
                              value: controller.isDefault3,
                              onChanged: (value) {
                                controller.toggleDefault3(value ?? false);
                              },
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                // color: Colors.blue,
                                borderRadius: BorderRadius.circular(80.r),
                                border: Border.all(
                                  color:
                                      AppColors.primary_color, // Border color
                                  width: 1, // Border width
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.shadow_black
                                        .withOpacity(0.25),
                                    spreadRadius: 1,
                                    blurRadius: 10.7,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                    controller.selectedItem.avatarUrl,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Gap(10.h),
                            AppText(
                              title: 'Almarwan general regss',
                              size: 10,
                              fontWeight: FontWeight.w500,
                            ),
                            Gap(10.h),
                            SvgPicture.asset('assets/icons/verified.svg'),
                          ],
                        ),
                      ),
                    ),
                    Gap(8.w),
                    AppText(
                      title: 'Edit',
                      size: 11,
                      color: AppColors.primary_color,
                      fontWeight: FontWeight.w500,
                    ),
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
                      child: Container(
                        height: 68.h,
                        width: 290.w,
                        decoration: BoxDecoration(
                          color: AppColors.border_grey,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Row(
                          children: [
                            Checkbox(
                              shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(1)),
                              side: BorderSide(
                                color: AppColors.primary_color,
                                // width: 1,
                              ),
                              value: controller.isDefault4,
                              onChanged: (value) {
                                controller.toggleDefault4(value ?? false);
                              },
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                // color: Colors.blue,
                                borderRadius: BorderRadius.circular(80.r),
                                border: Border.all(
                                  color:
                                      AppColors.primary_color, // Border color
                                  width: 1, // Border width
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.shadow_black
                                        .withOpacity(0.25),
                                    spreadRadius: 1,
                                    blurRadius: 10.7,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                    controller.selectedItem.avatarUrl,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Gap(10.h),
                            AppText(
                              title: 'Almarwan general regss',
                              size: 10,
                              fontWeight: FontWeight.w500,
                            ),
                            Gap(10.h),
                            // SvgPicture.asset('assets/icons/verified.svg'),
                          ],
                        ),
                      ),
                    ),
                    Gap(8.w),
                    AppText(
                      title: 'Edit',
                      size: 11,
                      color: AppColors.primary_color,
                      fontWeight: FontWeight.w500,
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
