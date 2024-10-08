// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:find_me/app/account/change_phonenumber/change_phonenumber_controller.dart';
import 'package:find_me/app/auth/components/auth_appbar.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/components/buttons/app_button.dart';
import 'package:find_me/components/textfields/phone_inputfield.dart';
import 'package:find_me/routes/app_routes.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ChangePhoneNumberView extends StatelessWidget {
  const ChangePhoneNumberView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangePhoneNumberController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          forceMaterialTransparency: true,
          title: topBar(name: 'Change Phone Number'.tr, fontSize: 16),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(109.h),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: AppText(
                    title: 'Enter your new phone number'.tr,
                    size: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black.withOpacity(0.43),
                  ),
                ),
                Gap(15),
                PhoneInputField(
                  onCountryChanged: controller.onCountryChanged,
                  errorText: controller.invalidNumberMessage,
                  onChanged: controller.phoneValidation,
                  controller: controller.pcontroller,
                  initialCode: controller.selectedCountry!.code,
                  
                ),
                Gap(173.h),
                AppButton(
                  title: 'Confirm'.tr,
                  height: 50.0.h,
                  width: 304.0.w,
                  onTap: () {
                    controller.updatePhone();
                  },
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
