// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:find_me/app/auth/forgetpassword/forgetpassword_controller.dart';
import 'package:find_me/app/auth/forgetpassword/toggle_view/email_view.dart';
import 'package:find_me/app/auth/forgetpassword/toggle_view/phone_number%20view.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/components/buttons/app_button.dart';
import 'package:find_me/components/textfields/app_textfields.dart';
import 'package:find_me/components/textfields/phone_inputfield.dart';
import 'package:find_me/routes/app_routes.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:find_me/utils/images/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  int _currentIndex = 0;
  void onToggle1(int? index) {
    setState(() {
      _currentIndex = index ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPasswordController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                scrolledUnderElevation: 0,
                title: topBar(name: ''),
              ),
              body: SafeArea(
                  child: Container(
                width: 390.w,
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: Column(
                  children: [
                    Gap(3.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          title: 'Forgot password!',
                          fontWeight: FontWeight.w500,
                          size: 20.sp,
                        )
                      ],
                    ),
                    Gap(10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          title: 'Choose email or phone number to continue!',
                          fontWeight: FontWeight.w400,
                          size: 10.sp,
                          color: AppColors.borderGrey,
                        )
                      ],
                    ),
                    Gap(31.h),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(112),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              spreadRadius: 1,
                              offset: Offset(0, 4),
                            ),
                          ]),
                      child: ToggleSwitch(
                        minHeight: 53.0.h,
                        minWidth: 297.0.w,
                        cornerRadius: 112.0.r,
                        activeBgColors: [
                          [
                            AppColors.primary_color,
                          ],
                          [
                            AppColors.primary_color,
                          ]
                        ],
                        activeFgColor: Colors.white,
                        inactiveBgColor: Colors.white,
                        inactiveFgColor: Colors.black,
                        initialLabelIndex: _currentIndex,
                        totalSwitches: 2,
                        labels: ['Email', 'Phone Number'],
                        radiusStyle: true,
                        onToggle: onToggle1,
                      ),
                    ),
                    Visibility(visible: _currentIndex == 0, child: EmailView()),
                    Visibility(
                        visible: _currentIndex == 1, child: PhoneNumberView()),
                  ],
                ),
              )),
            ));
  }
}
