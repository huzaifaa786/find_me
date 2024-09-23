import 'package:find_me/app/auth/components/auth_appbar.dart';
import 'package:find_me/app/auth/components/auth_rich_text.dart';

import 'package:find_me/app/auth/signin/signin_controller.dart';
import 'package:find_me/components/buttons/app_button.dart';

import 'package:find_me/components/textfields/app_textfields.dart';
import 'package:find_me/components/textfields/password_textfield.dart';

import 'package:find_me/helpers/validator.dart';

import 'package:find_me/routes/app_routes.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  bool isSwitched = false;

  GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(
      builder: (controller) => Scaffold(
        appBar: authAppBar(name: 'Sign In'.tr),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              width: 390.w,
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              child: Column(
                children: [
                  Gap(100.h),
                  AppTextFields(
                    hintText: 'USER NAME , EMAIL , OR PHONE NUMBER'.tr,
                    controller: controller.emailController,
                    fieldValidator: (value) =>
                        Validators.emptyStringValidator("This".tr, value),
                  ),
                  Gap(14.h),
                  PasswordTextFields(
                      hintText: 'PASSWORD'.tr,
                      obscure: controller.obscureTextPassword,
                      controller: controller.passwordController,
                      toggle: controller.toggle,
                      fieldValidator: (value) {
                        if (value!.isEmpty) {
                          return "Password can't be empty".tr;
                        } else {
                          return null;
                        }
                      }),
                  Gap(16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.forgetpassword);
                        },
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(AppRoutes.forgetpassword);
                          },
                          child: AppText(
                            title: 'Forgot password?'.tr,
                            color: AppColors.primary_color,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  ),
                  Gap(35.h),
                  AppButton(
                    title: 'Sign In'.tr,
                    height: 50.0.h,
                    width: 304.0.w,
                    onTap: () {
                      controller.loginUser();
                    },
                  ),
               
                  Gap(50.h),
                  AuthRichText(
                    title: 'Don’t have an account?'.tr,
                    description: 'Sign Up'.tr,
                    titlesize: 14.sp,
                    titlefontweight: FontWeight.w400,
                    descriptionfontweight: FontWeight.w600,
                    descriptiosize: 14.sp,
                    descriptionColor: AppColors.primary_color,
                    onTap: () {
                      Get.toNamed(AppRoutes.signup);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
