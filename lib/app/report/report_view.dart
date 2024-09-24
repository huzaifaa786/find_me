import 'dart:io';

import 'package:find_me/app/report/report_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/components/buttons/app_button.dart';
import 'package:find_me/components/textfields/report_textfield.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:find_me/utils/images/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ReportView extends StatelessWidget {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReportController>(
      autoRemove: false,
      builder: (controller) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 83.h,
          automaticallyImplyLeading: false,
          forceMaterialTransparency: true,
          title: topBar(name: 'Report a problem'.tr),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              width: 390.w,
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(40.h),
                  AppText(
                    title:
                        'Briefly explain what happened\n or what’s not working.'
                            .tr,
                    fontWeight: FontWeight.w500,
                    size: 14.sp,
                  ),
                  Gap(30.h),
                  // Dropdown to select report option
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: AppColors.borderGrey),borderRadius: BorderRadius.circular(13.r)),
                    padding: EdgeInsets.all(3),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: controller.selectedOption,
                        hint: AppText(title: controller.selectedOption ?? "",),
                        items: controller.reportOptions.map((String option) {
                          return DropdownMenuItem<String>(
                            value: option,
                            child: AppText(title: option,size: 14,),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          controller.selectedOption = newValue!;
                          controller.update();
                        },
                      ),
                    ),
                  ),
                  Gap(30.h),
                  ReportTextFields(
                    hintText: 'Type here'.tr,
                    controller: controller.descriptionController,
                  ),
                  Gap(27.h),
                  GestureDetector(
                    onTap: () {
                      controller.pickImage();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(ImagesConst.imageicon),
                        AppText(
                          title: 'Upload photo'.tr,
                          color: AppColors.primary_color,
                        ),
                      ],
                    ),
                  ),
                  if (controller.selectedImagePath.isNotEmpty)
                    Column(
                      children: [
                        Gap(30.h),
                        Center(
                          child: Image.file(
                            File(controller.selectedImagePath),
                            height: 140.h,
                            width: 140.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  Gap(30.h),
                  AppButton(
                    title: 'Send'.tr,
                    height: 50.0.h,
                    width: 304.0.w,
                    onTap: () {
                      controller.reportProblem();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
