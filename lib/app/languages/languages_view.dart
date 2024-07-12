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
  final english_value = 0;
  final arbic_value2 = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 83.h,
        title: topBar(name: 'Languages'),
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        child: GetBuilder<LanguagesController>(
          builder: (controller) {
            return Column(
              children: [
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
                                color: english_value == 0
                                    ? AppColors.primary_color
                                    : AppColors.black,
                              ),
                              Gap(108.w),
                              Radio(
                                value: english_value,
                                groupValue: controller.selectedLanguage,
                                activeColor: AppColors.primary_color,
                                fillColor: MaterialStateProperty.all(
                                    AppColors.primary_color),
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
                                    color: arbic_value2 == 1
                                        ? AppColors.primary_color
                                        : AppColors.black),
                                Gap(224.w),
                                Radio(
                                  value: arbic_value2,
                                  groupValue: controller.selectedLanguage,
                                  fillColor: MaterialStateProperty.all(
                                      AppColors.primary_color),
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
