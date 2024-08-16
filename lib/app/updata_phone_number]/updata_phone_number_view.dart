// ignore_for_file: prefer_const_constructors

import 'package:find_me/app/auth/forgetpassword/forgetpassword_controller.dart';
import 'package:find_me/app/updata_phone_number%5D/updata_phone_number_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/components/buttons/app_button.dart';
import 'package:find_me/components/textfields/app_textfields.dart';
import 'package:find_me/helpers/validator.dart';
import 'package:find_me/routes/app_routes.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:find_me/utils/images/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class UpdataPhoneNumberView extends StatelessWidget {
  const UpdataPhoneNumberView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdataPhoneNumberController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                scrolledUnderElevation: 0,
                title: topBar(name: 'New Password'.tr),
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
                          title: 'Enter New Phone Number'.tr,
                          fontWeight: FontWeight.w500,
                          size: 12.sp,
                          color: AppColors.hintGrey,
                        )
                      ],
                    ),
                    Gap(10.h),
                    Gap(50.h),
                    AppTextFields(
                      hintText: 'Phone Number',
                      controller: controller.phoneNumberController,
                    ),
                    Gap(40.h),
                    AppButton(
                      title: 'Confirm',
                      height: 50.0.h,
                      width: 304.0.w,
                      onTap: () {
                        Get.toNamed(AppRoutes.mainview);
                      },
                    ),
                  ],
                ),
              )),
            ));
  }
}
