

import 'package:find_me/app/auth/changepassword/changepassword_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/components/buttons/app_button.dart';
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
                title: topBar(name: 'Change password'.tr,fontSize: 16),
              ),
              body: SafeArea(
                  child: Container(
                width: 390.w,
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Column(
                  children: [
                    Gap(70.h),
                    PasswordTextFields(
                      hintText: 'Current password'.tr,
                      obscure: controller.obscureTextOldPassword,
                      controller: controller.oldpasswordController,
                      toggle: controller.oldtoggle,
                    ),
                    Gap(16.h),
                    PasswordTextFields(
                      hintText: 'New password',
                      obscure: controller.obscureTextPassword,
                      controller: controller.passwordController,
                      toggle: controller.toggle,
                    ),
                    Gap(16.h),
                    PasswordTextFields(
                      hintText: 'Confirm new password'.tr,
                      obscure: controller.obscureTextCPassword,
                      controller: controller.confirmPasswordController,
                      toggle: controller.ctoggle,
                    ),
                    Gap(30.h),
                    
                    
                    Gap(80.h),
                    AppButton(
                      title: 'Confirm'.tr,
                      height: 50.0.h,
                      width: 304.0.w,
                      onTap: () {
                        controller.changepassword();
                      },
                    ),
                  ],
                ),
              )),
            ));
  }
}
