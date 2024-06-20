import 'package:find_me/app/auth/components/auth_appbar.dart';
import 'package:find_me/app/auth/components/auth_rich_text.dart';
import 'package:find_me/app/auth/components/dob_textfield.dart';
import 'package:find_me/app/auth/signup/signup_controller.dart';
import 'package:find_me/components/buttons/app_button.dart';
import 'package:find_me/components/buttons/prefix_icon_button.dart';
import 'package:find_me/components/textfields/app_textfields.dart';
import 'package:find_me/components/textfields/password_textfield.dart';
import 'package:find_me/components/textfields/phone_inputfield.dart';
import 'package:find_me/helpers/validator.dart';
import 'package:find_me/routes/app_routes.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:find_me/utils/images/images.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (controller) => Scaffold(
        appBar: authAppBar(name: 'Sign Up'),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              width: 390.w,
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              child: Column(
                children: [
                  Gap(40.h),
                  AppTextFields(
                    hintText: 'User name',
                    controller: controller.nameController,
                  ),
                  Gap(16.h),
                  AppTextFields(
                    hintText: 'Email',
                    controller: controller.emailController,
                    fieldValidator: (value) => Validators.emailValidator(value),
                  ),
                  Gap(16.h),
                  PasswordTextFields(
                    hintText: 'Password',
                    obscure: controller.obscureTextPassword,
                    controller: controller.passwordController,
                    toggle: controller.toggle,
                    fieldValidator: (value) =>
                        Validators.passwordValidator(value),
                  ),
                  Gap(16.h),
                  PasswordTextFields(
                    hintText: 'Confirm Password',
                    obscure: controller.obscureTextCPassword,
                    controller: controller.confirmPasswordController,
                    toggle: controller.ctoggle,
                    fieldValidator: (value) =>
                        Validators.confrimPasswordValidator(
                            controller.passwordController.text, value),
                  ),
                  Gap(16.h),
                  PhoneInputField(
                    onCountryChanged: controller.onCountryChanged,
                    errorText: controller.invalidNumberMessage,
                    onChanged: controller.phoneValidation,
                    controller: controller.pcontroller,
                  ),
                  Gap(14.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        AppText(
                          title: 'Date of birth',
                          size: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                  Gap(8.h),
                  Row(
                    children: [
                      buildTextField(
                          controller.dayController, 'dd', context, controller),
                      Gap(10.w),
                      buildTextField(controller.monthController, 'mm', context,
                          controller),
                      Gap(10.w),
                      buildTextField(controller.yearController, 'yyyy', context,
                          controller),
                    ],
                  ),
                  Gap(30.h),
                  AppButton(
                    title: 'Sign Up',
                    height: 50.0.h,
                    width: 304.0.w,
                    onTap: () {
                      controller.registerUser();
                    },
                  ),
                  Gap(12.h),
                  const AppText(
                    title: 'Or',
                    size: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  Gap(12.h),
                  PrefixIconButton(
                    title: 'Sign up with Apple',
                    height: 50.0.h,
                    width: 304.0.w,
                    borderColor: AppColors.black,
                    color: AppColors.black,
                    textColors: AppColors.white,
                    image: ImagesConst.appleIcon,
                  ),
                  Gap(12.h),
                  PrefixIconButton(
                    title: 'Sign up with Google',
                    height: 50.0.h,
                    width: 304.0.w,
                    borderColor: AppColors.borderGrey,
                    onTap: () async {
                      // var response = await GoogleSignUpApi().signUpWithGoogle();
                      // GoogleSignIn().disconnect();
                      // if (response[0].isNotEmpty) {
                      //   var responce = await controller.loginGoogleUser(
                      //       response[0], response[1]);
                      //   if (!responce['error']) {
                      //     controller.user =
                      //         UserModel.fromJson(responce['user']);
                      //     if (controller.user!.login_type == 'GOOGLE') {
                      //       print(controller.user!.api_token);
                      //       await box.write(
                      //           'api_token', controller.user!.api_token);
                      //       UiUtilites.successSnackbar(
                      //           'Signin Successfully.'.tr, 'Success!'.tr);
                      //       Get.toNamed(AppRoutes.mainview);
                      //     } else {
                      //       UiUtilites.errorSnackbar('ERROR!'.tr,
                      //           'Email register for some other user'.tr);
                      //     }
                      //   }
                      // }
                    },
                  ),
                  Gap(30.h),
                  AuthRichText(
                    title: 'Already have an account ? ',
                    description: 'Sign in',
                    titlesize: 14.sp,
                    titlefontweight: FontWeight.w400,
                    descriptionfontweight: FontWeight.w600,
                    descriptiosize: 14.sp,
                    descriptionColor: AppColors.primary_color,
                    onTap: () {
                      Get.toNamed(AppRoutes.signin);
                    },
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
