// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:find_me/app/auth/components/dob_textfield.dart';
import 'package:find_me/app/auth/components/dob_textfield_editaccountinformation.dart';
import 'package:find_me/app/edit_account/edit_account_information_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/components/buttons/app_button.dart';
import 'package:find_me/components/radio/gender_radio_button.dart';
import 'package:find_me/components/textfields/app_textfields.dart';
import 'package:find_me/helpers/validator.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class EditAccountInformationView extends StatefulWidget {
  const EditAccountInformationView({super.key});

  @override
  State<EditAccountInformationView> createState() =>
      _EditAccountInformationViewState();
}

class _EditAccountInformationViewState
    extends State<EditAccountInformationView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditAccountInformationController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                toolbarHeight: 83.h,
                title: topBar(name: 'Change Information'),
                scrolledUnderElevation: 0,
                automaticallyImplyLeading: false,
              ),
              body: SafeArea(
                  child: SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 34.w),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Gap(10),
                          AppText(
                            title: 'Your name',
                            size: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          Gap(10.h),
                          AppTextFields(
                            hintText: controller.firstname,
                            controller: controller.firstNameController,
                            fieldValidator: (value) =>
                                Validators.emptyStringValidator(
                                    "First name", value),
                          ),
                          Gap(16.h),
                          AppTextFields(
                            hintText: controller.lastname,
                            controller: controller.lastNameController,
                            fieldValidator: (value) =>
                                Validators.emptyStringValidator(
                                    "Last name", value),
                          ),
                          Gap(25.h),
                          AppText(
                            title: 'Your Date of Birth',
                            size: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          Gap(25),
                          Row(
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  AppText(
                                    title: 'DD',
                                    color: Colors.grey,
                                    size: 12.sp,
                                  ),
                                  Gap(5.h),
                                  SizedBox(
                                    width: 85.w,
                                    child: buildTextFieldEditAccountInformation(
                                        controller.dayController,
                                        'dd',
                                        context,
                                        controller),
                                  ),
                                ],
                              ),
                              Gap(10.w),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  AppText(
                                    title: 'MM',
                                    color: Colors.grey,
                                    size: 12.sp,
                                  ),
                                  Gap(5.h),
                                  SizedBox(
                                    width: 85.w,
                                    child: buildTextFieldEditAccountInformation(
                                        controller.monthController,
                                        'mm',
                                        context,
                                        controller),
                                  ),
                                ],
                              ),
                              Gap(10.w),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  AppText(
                                    title: 'YYYY',
                                    color: Colors.grey,
                                    size: 12.sp,
                                  ),
                                  Gap(5.h),
                                  SizedBox(
                                    width: 85.w,
                                    child: buildTextFieldEditAccountInformation(
                                        controller.yearController,
                                        'yyyy',
                                        context,
                                        controller),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Gap(50.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              children: [
                                AppText(
                                  title: 'Gender',
                                  size: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ),
                          GenderRadioButtons(
                            onGenderSelected: controller.handleGenderSelected,
                          ),
                          Gap(40.h),
                          AppButton(
                            title: 'Save',
                            height: 60.0.h,
                            width: 304.0.w,
                            onTap: () {
                              controller.changeInformation();
                            },
                          ),
                        ])),
              )),
            ));
  }
}
