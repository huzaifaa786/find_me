import 'package:find_me/app/auth/components/auth_rich_text.dart';
import 'package:find_me/app/intro/intro_controller.dart';
import 'package:find_me/components/buttons/app_button.dart';
import 'package:find_me/components/buttons/gif_button.dart';
import 'package:find_me/routes/app_routes.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class IntroView extends StatelessWidget {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IntroController>(
      builder: (controller) => Scaffold(
        body: SizedBox(
          width: 390.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(133.h),
              AppText(
                title: 'Find Me!',
                fontWeight: FontWeight.w600,
                size: 40.sp,
              ),
              Gap(28.h),
              AppText(
                title: 'easy away to share files !',
                size: 16.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.black.withOpacity(0.81),
              ),
              Gap(138.h),
              GifButton(onTap: () {}, showOpacity: true),
              Gap(94.h),
              AppButton(
                title: 'Sign Up',
                height: 60.0.h,
                width: 304.0.w,
                color: AppColors.black,
                borderColor: AppColors.black,
                onTap: () {
                  Get.toNamed(AppRoutes.signup);
                },
              ),
              Gap(30.h),
              AuthRichText(
                title: 'Already have an account ? ',
                description: 'Sign in',
                onTap: () {
                  Get.toNamed(AppRoutes.signin);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
