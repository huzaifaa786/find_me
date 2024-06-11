// ignore_for_file: prefer_const_constructors

import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'languages_controller.dart';

class LanguagesView extends StatefulWidget {
  const LanguagesView({super.key});

  @override
  _LanguagesViewState createState() => _LanguagesViewState();
}

class _LanguagesViewState extends State<LanguagesView> {
  // Initialize the controller
  final LanguagesController controller = Get.put(LanguagesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: topBar(name: 'Languages'),
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        child: GetBuilder<LanguagesController>(
          builder: (controller) {
            return Column(
              children: [
                Gap(63.h),
                GestureDetector(
                  onTap: () {
                    controller.changeLanguage(0);
                  },
                  child: Row(
                    children: [
                      Gap(60.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                title: 'English (United States)',
                                size: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primary_color,
                              ),
                              Gap(108.w),
                              Radio(
                                value: 0,
                                groupValue: controller.selectedLanguage,
                                activeColor: AppColors.primary_color,
                                onChanged: (value) {
                                  controller.changeLanguage(value as int);
                                },
                              ),
                            ],
                          ),
                          AppText(
                            title: 'Default',
                            size: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.hintGrey,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Gap(22.h),
                GestureDetector(
                  onTap: () {
                    controller.changeLanguage(1);
                  },
                  child: SizedBox(
                    child: Row(
                      children: [
                        Gap(60.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText(
                                  title: 'العربية',
                                  size: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.primary_color,
                                ),
                                Gap(224.w),
                                Radio(
                                  value: 1,
                                  groupValue: controller.selectedLanguage,
                                  activeColor: AppColors.primary_color,
                                  onChanged: (value) {
                                    controller.changeLanguage(value as int);
                                  },
                                ),
                              ],
                            ),
                            AppText(
                              title: 'Arabic',
                              size: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.hintGrey,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
