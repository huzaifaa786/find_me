// ignore_for_file: prefer_const_constructors

import 'package:find_me/app/auth/forgetpassword/forgetpassword_controller.dart';
import 'package:find_me/app/change_email/change_email_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/components/buttons/app_button.dart';
import 'package:find_me/components/textfields/app_textfields.dart';
import 'package:find_me/routes/app_routes.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:find_me/utils/images/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ChangeEmailView extends StatelessWidget {
  const ChangeEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangeEmailController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                scrolledUnderElevation: 0,
                title: topBar(name: 'Change email'),
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
                          title: 'Enter new email',
                          fontWeight: FontWeight.w500,
                          size: 12.sp,
                          color: AppColors.hintGrey,
                        )
                      ],
                    ),
                    Gap(10.h),
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
                      onTap: () {
                        Get.toNamed(AppRoutes.otp);
                      },
                    ),
                  ],
                ),
              )),
            ));
  }
}
