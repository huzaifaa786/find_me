// ignore_for_file: prefer_const_constructors

import 'package:find_me/app/auth/forgetpassword/forgetpassword_controller.dart';
import 'package:find_me/components/buttons/app_button.dart';
import 'package:find_me/components/textfields/app_textfields.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/images/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPaswordController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                leading: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: SvgPicture.asset(
                    ImagesConst.backIcon,
                    height: 28.h,
                    width: 28.w,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              body: SafeArea(
                  child: Container(
                width: 390.w,
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: Column(
                  children: [
                    Gap(60.h),
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
                          title: 'Enter your registered email!',
                          fontWeight: FontWeight.w500,
                          size: 13.sp,
                        )
                      ],
                    ),
                    Gap(50.h),
                    AppTextFields(
                      hintText: 'Email',
                      controller: controller.emailController,
                    ),
                    Gap(40.h),
                       AppButton(
                    title: 'Confirm',
                    height: 50.0.h,
                    width: 304.0.w,
                    onTap: () {},
                  ),
                  ],
                ),
              )),
            ));
  }
}