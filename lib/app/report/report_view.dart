import 'dart:io';

import 'package:find_me/app/report/report_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/components/buttons/app_button.dart';
import 'package:find_me/components/textfields/report_textfield.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/images/images.dart';
import 'package:find_me/utils/ui_utils.dart';
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
                title: topBar(name: 'Report a problem'),
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
                            'Briefly explain what happened\n or what’s not working .',
                        fontWeight: FontWeight.w500,
                        size: 14.sp,
                      ),
                      Gap(30.h),
                      ReportTextFields(
                        hintText: 'Type here',
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
                              title: ' Upload photo',
                              color: Colors.blue,
                            ),
                          ],
                        ),
                      ),
                      controller.selectedImagePath.isNotEmpty ?
                      
                      
                      // Gap(10.h),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     AppText(
                      //       title: ' Uploaded  successfully!',
                      //       color: Colors.green,
                      //     ),
                      //   ],
                      // ),
                      Gap(151.h),
                      AppButton(
                        title: 'Send',
                        height: 50.0.h,
                        width: 304.0.w,
                        onTap: () {
                          controller.reportProblem();
                        },
                      ),
                    ],
                  ),
                ),
              )),
            ));
  }
}
