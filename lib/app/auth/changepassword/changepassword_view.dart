import 'package:find_me/app/auth/changepassword/changepassword_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/components/textfields/password_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangePaswordController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                centerTitle: true,
                automaticallyImplyLeading: false,
                forceMaterialTransparency: true,
                title: topBar(name: 'Change password'),
              ),
              body: SafeArea(
                  child: Container(
                width: 390.w,
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: Column(
                  children: [
                    Gap(30.h),
                    PasswordTextFields(
                      hintText: 'Old Password',
                      obscure: controller.obscureTextOldPassword,
                      controller: controller.oldpasswordController,
                      toggle: controller.oldtoggle,
                    ),
                    Gap(16.h),
                    PasswordTextFields(
                      hintText: 'Password',
                      obscure: controller.obscureTextPassword,
                      controller: controller.passwordController,
                      toggle: controller.toggle,
                    ),
                    Gap(16.h),
                    PasswordTextFields(
                      hintText: 'Confirm Password',
                      obscure: controller.obscureTextCPassword,
                      controller: controller.confirmPasswordController,
                      toggle: controller.ctoggle,
                    ),
                  ],
                ),
              )),
            ));
  }
}