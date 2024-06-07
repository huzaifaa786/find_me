import 'package:find_me/app/auth/components/auth_appbar.dart';
import 'package:find_me/app/auth/components/auth_rich_text.dart';
import 'package:find_me/app/auth/components/dob_textfield.dart';
import 'package:find_me/app/auth/signin/signin_controller.dart';
import 'package:find_me/components/buttons/app_button.dart';
import 'package:find_me/components/buttons/prefix_icon_button.dart';
import 'package:find_me/components/textfields/app_textfields.dart';
import 'package:find_me/components/textfields/password_textfield.dart';
import 'package:find_me/components/textfields/phone_inputfield.dart';
import 'package:find_me/routes/app_routes.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:find_me/utils/images/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(
      builder: (controller) => Scaffold(
        appBar: authAppBar(name: 'Sign In'),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              width: 390.w,
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              child: Column(
                children: [
                  Gap(40.h),
                  AppTextFields(
                    hintText: 'Email',
                    controller: controller.emailController,
                  ),
                  Gap(14.h),
                  PasswordTextFields(
                    hintText: 'Password',
                    obscure: controller.obscureTextPassword,
                    controller: controller.passwordController,
                    toggle: controller.toggle,
                  ),
                  Gap(16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.forgetpassword);
                        },
                        child: AppText(
                          title: 'Forget password ?',
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  Gap(35.h),
                  AppButton(
                    title: 'Sign In',
                    height: 50.0.h,
                    width: 304.0.w,
                    onTap: () {},
                  ),
                  Gap(20.h),
                  const AppText(
                    title: 'Or',
                    size: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  Gap(20.h),
                  PrefixIconButton(
                    title: 'Sign In with Apple',
                    height: 50.0.h,
                    width: 304.0.w,
                    borderColor: AppColors.black,
                    color: AppColors.black,
                    textColors: AppColors.white,
                    image: ImagesConst.appleIcon,
                  ),
                  Gap(12.h),
                  PrefixIconButton(
                    title: 'Sign In with Google',
                    height: 50.0.h,
                    width: 304.0.w,
                    borderColor: AppColors.borderGrey,
                  ),
                  Gap(30.h),
                  AuthRichText(
                    title: 'Don’t have an account ? ',
                    description: 'Sign Up',
                     titlesize: 14.sp,
                      titlefontweight: FontWeight.w400,
                      descriptionfontweight: FontWeight.w600,
                      descriptiosize: 14.sp,
                      descriptionColor: AppColors.primary_color,
                    onTap: () {Get.toNamed(AppRoutes.signup);},
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
