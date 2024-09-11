import 'dart:io';

import 'package:find_me/app/report/report_controller.dart';
import 'package:find_me/app/report_profile/report_profile_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/components/buttons/app_button.dart';
import 'package:find_me/components/textfields/report_textfield.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/images/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ReportProfileView extends StatelessWidget {
  const ReportProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReportProfileController>(
      autoRemove: false,
      builder: (controller) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 83.h,
          automaticallyImplyLeading: false,
          forceMaterialTransparency: true,
          title: topBar(name: 'Report Profile'.tr),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      'Please select a reason for reporting this profile:'.tr,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: Get.height * 0.4,
                    width: Get.width * 0.9,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: controller.reportOptions.length,
                      itemBuilder: (context, index) {
                        return RadioListTile<String>(
                          title: Text(controller.reportOptions[index]),
                          value: controller.reportOptions[index],
                          groupValue: controller.selectedOption,
                          onChanged: (String? value) {
                            controller.selectedOption = value;
                            controller.update();
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: AppButton(
                      title: 'Report'.tr,
                      height: 50.0.h,
                      width: 304.0.w,
                      onTap: () {
                        controller.reportProblem();
                      },
                    ),
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
