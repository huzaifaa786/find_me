// ignore_for_file: prefer_const_constructors

import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'languages_controller.dart';

class LanguagesView extends StatefulWidget {
  const LanguagesView({super.key});

  @override
  _LanguagesViewState createState() => _LanguagesViewState();
}

enum translateMethod { English, Arabic }

class _LanguagesViewState extends State<LanguagesView> {
  // Initialize the controller
  final LanguagesController controller = Get.put(LanguagesController());
  // final english_value = 0;
  // final arbic_value2 = 1;
  final isSelected = false;

  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
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
            return Directionality(
              textDirection: box.read('locale') == 'ar'
                  ? TextDirection.rtl
                  : TextDirection.ltr,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 34.w),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await controller.toggleplan(translateMethod.English);
                        Get.updateLocale(const Locale('en', 'US'));
                        GetStorage box = GetStorage();
                        await box.write('locale', 'en');
                        setState(() {});
                        controller.site = translateMethod.English;
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                title: 'English (United States)',
                                size: 14,
                                fontWeight: FontWeight.w400,
                                color:
                                    controller.site == translateMethod.English
                                        ? AppColors.primary_color
                                        : AppColors.black,
                              ),
                              Gap(5.h),
                              AppText(
                                title: 'Default',
                                size: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.hintGrey,
                              ),
                            ],
                          ),
                          Radio(
                            value: translateMethod.English,
                            groupValue: controller.site,
                            activeColor: AppColors.primary_color,
                            fillColor: MaterialStateProperty.all(
                                AppColors.primary_color),
                            onChanged: (value) async {
                              await controller.toggleplan(value!);
                              Get.updateLocale(const Locale('en', 'US'));
                              GetStorage box = GetStorage();
                              await box.write('locale', 'en');
                              setState(() {});
                              controller.site = value;
                            },
                          ),
                        ],
                      ),
                    ),
                    Gap(22.h),
                    GestureDetector(
                      onTap: () async {
                        await controller.toggleplan(translateMethod.Arabic);
                        Get.updateLocale(const Locale('ar', 'AE'));
                        GetStorage box = GetStorage();
                        await box.write('locale', 'ar');
                        print('Language changed to Arabic');
                        print('Stored locale: ${box.read('locale')}');
                        print('Current locale: ${Get.locale}');
                        controller.site = translateMethod.Arabic;
                        setState(() {});
                      },
                      child: SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  title: 'العربية',
                                  size: 14,
                                  fontWeight: FontWeight.w400,
                                  color:
                                      controller.site == translateMethod.Arabic
                                          ? AppColors.primary_color
                                          : AppColors.black,
                                ),
                                Gap(5.h),
                                AppText(
                                  title: 'Arabic',
                                  size: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.hintGrey,
                                ),
                              ],
                            ),
                            Radio(
                              value: translateMethod.Arabic,
                              groupValue: controller.site,
                              fillColor: MaterialStateProperty.all(
                                  AppColors.primary_color),
                              activeColor: AppColors.primary_color,
                              onChanged: (value) async {
                                await controller.toggleplan(value!);
                                Get.updateLocale(const Locale('ar', 'AE'));
                                GetStorage box = GetStorage();
                                await box.write('locale', 'ar');
                                print('Stored locale: ${box.read('locale')}');
                                print('Current locale: ${Get.locale}');
                                controller.site = value;
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}