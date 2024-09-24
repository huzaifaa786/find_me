// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:find_me/app/auth/otp/otp_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/routes/app_routes.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtpController>(
      builder: (controller) => Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            scrolledUnderElevation: 0,
            title: topBar(
              name: '',
              showBackIcon: true,
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: Column(children: [
                Gap(30),
                AppText(
                  title: 'Confirm Your Number'.tr,
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  size: 20,
                  textAlign: TextAlign.center,
                ),
                Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: SizedBox(
                        height: 35.h,
                        width: 270.w,
                        child: AppText(
                          title:
                              'We have sent you an OTP code to your phone number, please enter it to continue'
                                  .tr
                                  .tr,
                          color: AppColors.hintGrey,
                          fontWeight: FontWeight.w400,
                          size: 12,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(50),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: OtpTextField(
                    borderRadius: BorderRadius.circular(6.0),
                    numberOfFields: 6,
                    fieldHeight: 51.h,
                    fieldWidth: 45.h,
                    keyboardType: TextInputType.number,
                    focusedBorderColor: AppColors.primary_color,
                    showFieldAsBox: true,
                    cursorColor: AppColors.primary_color,
                    borderWidth: 2.0,
                    textStyle: TextStyle(
                        color: AppColors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                    onCodeChanged: (String code) {
                      controller.setOtpCode(code);
                    },
                    onSubmit: (String verificationCode) {
                      controller.setOtpCode(verificationCode);
                      if (controller.areFieldsFilled) {
                        controller.verifyOtp();
                      }
                    },
                  ),
                ),
                Gap(30),
                GestureDetector(
                  onTap: () {
                    controller.resendOtp();
                  },
                  child: AppText(
                    title: 'Re-send code'.tr,
                    size: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary_color,
                    textAlign: TextAlign.center,
                  ),
                ),
              ]),
            ),
          )),
    );
  }
}
