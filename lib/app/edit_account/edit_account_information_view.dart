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
                title: topBar(name: 'Change My Information'.tr, fontSize: 16),
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
                          Gap(30),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: AppText(
                              title: 'Your name'.tr,
                              size: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Gap(20.h),
                          AppTextFields(
                            hintText: controller.firstname,
                            controller: controller.firstNameController,
                            fieldValidator: (value) =>
                                Validators.emptyStringValidator(
                                    "First name".tr, value),
                          ),
                          Gap(16.h),
                          AppTextFields(
                            hintText: controller.lastname,
                            controller: controller.lastNameController,
                            fieldValidator: (value) =>
                                Validators.emptyStringValidator(
                                    "Last name".tr, value),
                          ),
                          Gap(35.h),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: AppText(
                              title: 'Birthday'.tr,
                              size: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Gap(20.h),
                          Row(
                            children: [
                              Expanded(
                                child: buildDateInputField(
                                    controller.dateController,
                                    context,
                                    controller),
                              ),
                            ],
                          ),
                          Gap(35.h),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: AppText(
                              title: 'Gender'.tr,
                              size: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Gap(15),
                          GenderRadioButtons(
                            onGenderSelected: controller.handleGenderSelected,
                          ),
                          Gap(80.h),
                          AppButton(
                            title: 'Save changes'.tr,
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
