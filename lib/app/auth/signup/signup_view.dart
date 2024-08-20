import 'package:find_me/api/auth_api/google_signup_api.dart';
import 'package:find_me/app/auth/components/auth_appbar.dart';
import 'package:find_me/app/auth/components/auth_rich_text.dart';
import 'package:find_me/app/auth/components/dob_textfield.dart';
import 'package:find_me/app/auth/signup/signup_controller.dart';
import 'package:find_me/components/buttons/app_button.dart';
import 'package:find_me/components/buttons/prefix_icon_button.dart';
import 'package:find_me/components/radio/gender_radio_button.dart';
import 'package:find_me/components/textfields/app_textfields.dart';
import 'package:find_me/components/textfields/password_textfield.dart';
import 'package:find_me/components/textfields/phone_inputfield.dart';
import 'package:find_me/helpers/validator.dart';
import 'package:find_me/models/user_model.dart';
import 'package:find_me/routes/app_routes.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:find_me/utils/images/images.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  GetStorage box = GetStorage();
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
                    hintText: 'First name',
                    controller: controller.firstNameController,
                    fieldValidator: (value) =>
                        Validators.alphabeticValidator("First name", value),
                  ),
                  Gap(16.h),
                  AppTextFields(
                    hintText: 'Last name',
                    controller: controller.lastNameController,
                    fieldValidator: (value) =>
                        Validators.alphabeticValidator("Last name", value),
                  ),
                  Gap(16.h),
                  AppTextFields(
                    hintText: 'User name',
                    controller: controller.nameController,
                    fieldValidator: (value) =>
                        Validators.usernameValidator("User name", value),
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
                    initialCode: controller.selectedCountry!.code,
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
                      Expanded(
                        child: buildDateInputField(
                            controller.dateController, context, controller),
                      ),
                    ],
                  ),
                  Gap(16.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        AppText(
                          title: 'Gender',
                          size: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                  GenderRadioButtons(
                    onGenderSelected: controller.handleGenderSelected,
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
