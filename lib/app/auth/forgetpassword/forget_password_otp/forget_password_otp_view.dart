import 'package:find_me/app/auth/forgetpassword/forget_password_otp/forget_password_otp_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ForgetPasswordOtpView extends StatefulWidget {
  const ForgetPasswordOtpView({super.key});

  @override
  State<ForgetPasswordOtpView> createState() => _ForgetPasswordOtpViewState();
}

class _ForgetPasswordOtpViewState extends State<ForgetPasswordOtpView> {
  final String? type = Get.arguments['type'];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPasswordOtpController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: topBar(
            name: '',
            showBackIcon: true,
          ),
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: Column(
              children: [
                Gap(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 48.h,
                      width: 230.w,
                      child: AppText(
                        title: type == 'email'
                            ? "Verify your Email"
                            : " Verify your Phone Number",
                        color: AppColors.black,
                        fontWeight: FontWeight.w600,
                        size: 20,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: SizedBox(
                        height: 30.h,
                        width: 270.w,
                        child: AppText(
                          title: type == "email"
                              ? 'We have sent you an OTP code to your new Email, please enter it to continue'
                              : 'We have sent you an OTP code to your new phone number, please enter it to continue',
                          color: AppColors.hintGrey,
                          fontWeight: FontWeight.w500,
                          size: 12,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(40),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: OtpTextField(
                    borderRadius: BorderRadius.circular(6.0),
                    numberOfFields: 6,
                    fieldHeight: 51.h,
                    fieldWidth: 45.h,
                    keyboardType: TextInputType.number,
                    focusedBorderColor: AppColors.primary_color,
                    fillColor: AppColors.primary_color,
                    showFieldAsBox: true,
                    borderWidth: 2.0,
                    textStyle: TextStyle(
                      color: AppColors.primary_color,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
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
                    type == "email"
                        ? controller.resendOtpEmail()
                        : controller.resendOtpPhone();
                  },
                  child: AppText(
                    title: 'Resend'.tr,
                    size: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary_color,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
