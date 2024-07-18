// ignore_for_file: prefer_const_constructors

import 'package:find_me/app/auth/new_password/new_password_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/components/buttons/app_button.dart';
import 'package:find_me/components/textfields/password_textfield.dart';
import 'package:find_me/helpers/validator.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/images/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class NewPasswordView extends StatefulWidget {
  const NewPasswordView({super.key});

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewPasswordController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          title: topBar(showBackIcon: true, name: "New Password"),
        ),
        body: SafeArea(
            child: Container(
          width: 390.w,
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Column(
            children: [
              Gap(70.h),
              PasswordTextFields(
                hintText: ' New Password',
                obscure: controller.obscureTextPassword,
                controller: controller.passwordController,
                toggle: controller.newtoggle,
                fieldValidator: (value) => Validators.passwordValidator(value),
              ),
              Gap(16.h),
              PasswordTextFields(
                hintText: 'Confirm Password',
                obscure: controller.obscureTextCPassword,
                controller: controller.confirmPasswordController,
                toggle: controller.confirmtoggle,
                fieldValidator: (value) => Validators.confrimPasswordValidator(
                    controller.passwordController.text, value),
              ),
              Gap(30.h),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     AppText(
              //       title: 'Password changed successfully',
              //       color: Colors.green,
              //     ),
              //     Image.asset(
              //       ImagesConst.tickicon,
              //       color: Colors.green,
              //     ),
              //   ],
              // ),
              // Gap(30.h),
              AppButton(
                title: 'Submit',
                height: 50.0.h,
                width: 304.0.w,
                onTap: () {
                  controller.updatepassword();
                },
              ),
            ],
          ),
        )),
      ),
    );
  }
}
