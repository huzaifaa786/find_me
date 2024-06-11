// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_me/app/account/profile/profile_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/components/textfields/app_textfields.dart';
import 'package:find_me/components/textfields/phone_inputfield.dart';
import 'package:find_me/routes/app_routes.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        autoRemove: false,
        builder: (controller) => Scaffold(
              appBar: AppBar(
                scrolledUnderElevation: 0,
                automaticallyImplyLeading: false,
                title: topBar(name: 'Account'),
              ),
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 44.w),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Gap(35.h),
                        Row(
                          children: [
                            Container(
                              height: 77,
                              width: 77,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(
                                          0x66000000), // #00000040 with 40 being the alpha value in hexadecimal
                                      blurRadius: 1.2,
                                      spreadRadius: 0,
                                      offset: Offset(0, 0),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(40.r),
                                  image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                          'https://th.bing.com/th/id/OIP.DmAJheE6apJ9IX7pxIRDjgHaFN?pid=ImgDet&w=474&h=333&rs=1'),
                                      fit: BoxFit.cover)),
                            ),
                            Gap(15.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    AppText(
                                      title: 'Almarwan General trd',
                                      size: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    Gap(15),
                                    SvgPicture.asset(
                                        'assets/icons/verified.svg')
                                  ],
                                ),
                                Gap(13),
                                AppText(
                                    title: '@almarwan3',
                                    size: 11.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.hintGrey)
                              ],
                            ),
                          ],
                        ),
                        Gap(23),
                        Row(
                          children: [
                            Gap(20.h),
                            AppText(
                              title: 'My information',
                              size: 14.sp,
                              fontWeight: FontWeight.w600,
                            )
                          ],
                        ),
                        Gap(19.h),
                        Row(
                          children: [
                            Gap(20.h),
                            AppText(
                              title: 'Username',
                              color: AppColors.hintGrey,
                              size: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                        Gap(6.h),
                        AppTextFields(
                          hintText: 'User name',
                          controller: controller.usernameController,
                        ),
                        Gap(16.h),
                        Row(
                          children: [
                            Gap(20.h),
                            AppText(
                              title: 'Email',
                              color: AppColors.hintGrey,
                              size: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                        Gap(6.h),
                        AppTextFields(
                          hintText: 'Email',
                          controller: controller.useremailController,
                        ),
                        Gap(16.h),
                        Row(
                          children: [
                            Gap(20.h),
                            AppText(
                              title: 'Phone number',
                              color: AppColors.hintGrey,
                              size: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                        Gap(6.h),
                        PhoneInputField(
                          onCountryChanged: controller.onCountryChanged,
                          errorText: controller.invalidNumberMessage,
                          onChanged: controller.phoneValidation,
                          controller: controller.phonecontroller,
                        ),
                        Gap(33.w),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.change_email);
                          },
                          child: Row(
                            children: [
                              Gap(17.w),
                              SvgPicture.asset('assets/icons/edit-3.svg'),
                              Gap(10.w),
                              AppText(
                                title: 'Change Email',
                                color: AppColors.primary_color,
                                size: 12,
                                fontWeight: FontWeight.w400,
                              )
                            ],
                          ),
                        ),
                        Gap(12.w),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.change_phone);
                            
                          },
                          child: Row(
                            children: [
                              Gap(17.w),
                              SvgPicture.asset('assets/icons/edit-3.svg'),
                              Gap(10.w),
                              AppText(
                                title: 'Change Phone number',
                                color: AppColors.primary_color,
                                size: 12,
                                fontWeight: FontWeight.w400,
                              )
                            ],
                          ),
                        ),
                        Gap(12.w),
                        InkWell(
                          onTap: () {
                            Get.toNamed(AppRoutes.changepassword);
                          },
                          child: Row(
                            children: [
                              Gap(17.w),
                              SvgPicture.asset(
                                'assets/icons/lock (1).svg',
                                color: AppColors.primary_color,
                              ),
                              Gap(10.w),
                              AppText(
                                title: 'Change password',
                                color: AppColors.primary_color,
                                size: 12,
                                fontWeight: FontWeight.w400,
                              )
                            ],
                          ),
                        ),
                        Gap(30.w),
                        Row(
                          children: [
                            Gap(17.w),
                            SvgPicture.asset(
                              'assets/icons/log-out.svg',
                              color: AppColors.red,
                            ),
                            Gap(10.w),
                            AppText(
                              title: 'Log out',
                              color: AppColors.red,
                              size: 12,
                              fontWeight: FontWeight.w500,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
