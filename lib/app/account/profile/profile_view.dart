// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_me/app/account/components/social_media_icon.dart';
import 'package:find_me/app/account/profile/profile_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/components/buttons/app_button.dart';
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
                title: topBar(name: 'Account',showBackIcon: true),
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 44.w),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
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
                        ),
                        Gap(8),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppText(
                                  title: 'Almarwan General trd',
                                  size: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                Gap(15),
                                SvgPicture.asset('assets/icons/verified.svg')
                              ],
                            ),
                            Gap(7.h),
                            AppText(
                                title: '@almarwan3',
                                size: 11.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.hintGrey),
                            Gap(17),
                            AppText(
                                title:
                                    'Hello, i am almarwan and this is my profile',
                                size: 11.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.hintGrey),
                            Gap(25),
                            GestureDetector(
                              onTap: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppText(
                                      title: 'Edit bio',
                                      size: 11.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.primary_color),
                                  SvgPicture.asset("assets/icons/edit.svg"),
                                ],
                              ),
                            ),
                            Gap(21.h),
                            Divider(
                              thickness: 1,
                              color: AppColors.black.withOpacity(0.08),
                              height: 1,
                            ),
                            Gap(21.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Find me on:",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(AppRoutes.editurl);
                                  },
                                  child: Row(
                                    children: [
                                      AppText(
                                          title: 'Edit',
                                          size: 11.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.primary_color),
                                      SvgPicture.asset("assets/icons/edit.svg"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Gap(27.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SocialMediaIcon(
                                  socialMediaIcon:
                                      "assets/icons/tiktok_black.svg",
                                ),
                                SocialMediaIcon(
                                  socialMediaIcon: "assets/icons/xtwitter.svg",
                                ),
                                SocialMediaIcon(
                                  socialMediaIcon:
                                      "assets/icons/instagram_black.svg",
                                ),
                                SocialMediaIcon(
                                  socialMediaIcon: "assets/icons/snapchat.svg",
                                ),
                                SocialMediaIcon(
                                  socialMediaIcon:
                                      "assets/icons/facebook_black.svg",
                                ),
                                SocialMediaIcon(
                                  socialMediaIcon: "assets/icons/youtube.svg",
                                ),
                              ],
                            ),
                            Gap(15.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SocialMediaIcon(
                                  socialMediaIcon: "assets/icons/whatsapp1.svg",
                                ),
                                SocialMediaIcon(
                                  socialMediaIcon: "assets/icons/gmail.svg",
                                ),
                                SocialMediaIcon(
                                  socialMediaIcon:
                                      "assets/icons/telegram-plane.svg",
                                ),
                              ],
                            ),
                            Gap(20.h),
                            Divider(
                              thickness: 1,
                              color: AppColors.black.withOpacity(0.08),
                  
                            ),
                            Gap(20.h),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "My business card",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Gap(22),
                            Container(
                              height: 192.8.h,
                              width: 312.w,
                              child: Column(
                                children: [
                                  Gap(31.h),
                                  SizedBox(
                                      height: 78.h,
                                      width: 78.w,
                                      child: SvgPicture.asset(
                                        "assets/icons/card_profile_picture.svg",
                                        height: 65.h,
                                        width: 65.w,
                                      )),
                                  Gap(9.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        height: 72.h,
                                        width: 299.8.w,
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.toNamed(AppRoutes.createcard);
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                  "assets/icons/business_card.svg"),
                                              Text(
                                                "Create business card",
                                                style: TextStyle(
                                                    color:
                                                        AppColors.primary_color,
                                                    fontSize: 10.sp,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            color: AppColors.light_white,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(18),
                                                bottomRight:
                                                    Radius.circular(16))),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(19),
                                border:
                                    Border.all(color: AppColors.lightSkyBlue),
                              ),
                            ),
                          ],
                        ),
                        Gap(32.h),
                        Divider(
                          thickness: 1,
                          color: AppColors.black.withOpacity(0.08),
                          height: 1,
                        ),
                        Gap(27.h),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Favorites ",
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Gap(21),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset("assets/images/smiling_emoji.png"),
                            Image.asset("assets/images/angry_emoji.png"),
                            Image.asset("assets/images/heart_emoji.png"),
                            Image.asset("assets/images/cold_emoji.png"),
                            Image.asset("assets/images/happy_emoji.png"),
                            Image.asset("assets/images/cold_angry_emoji.png"),
                          ],
                        ),
                        Gap(3),
                        Row(
                          children: [
                            Gap(12),
                            Image.asset("assets/images/coins.png"),
                            Text("10"),
                            Gap(12),
                            Image.asset("assets/images/coins.png"),
                            Text("10"),
                          ],
                        ),
                        Gap(28.h),
                        // Divider(
                        //   thickness: 1,
                        //   color: AppColors.black.withOpacity(0.08),
                        //   height: 1,
                        // ),
                        // Gap(40.h),
                        // Align(
                        //   alignment: Alignment.centerLeft,
                        //   child: Text(
                        //     "My Information",
                        //     style: TextStyle(
                        //         fontSize: 14.sp, fontWeight: FontWeight.w500),
                        //   ),
                        // ),
                        // Gap(27.h),
                        // Row(
                        //   children: [
                        //     Gap(20.h),
                        //     AppText(
                        //       title: 'Username',
                        //       color: AppColors.hintGrey,
                        //       size: 10,
                        //       fontWeight: FontWeight.w400,
                        //     ),
                        //   ],
                        // ),
                        // Gap(6.h),
                        // AppTextFields(
                        //   hintText: 'User name',
                        //   controller: controller.usernameController,
                        // ),
                        // Gap(19.h),
                        // Row(
                        //   children: [
                        //     Gap(20.h),
                        //     AppText(
                        //       title: 'Email',
                        //       color: AppColors.hintGrey,
                        //       size: 10,
                        //       fontWeight: FontWeight.w400,
                        //     ),
                        //   ],
                        // ),
                        // Gap(6.h),
                        // AppTextFields(
                        //   hintText: 'Email',
                        //   controller: controller.useremailController,
                        // ),
                        // Gap(20.h),
                        // Row(
                        //   children: [
                        //     Gap(20.h),
                        //     AppText(
                        //       title: 'Phone number',
                        //       color: AppColors.hintGrey,
                        //       size: 10,
                        //       fontWeight: FontWeight.w400,
                        //     ),
                        //   ],
                        // ),
                        // Gap(6.h),
                        // PhoneInputField(
                        //   onCountryChanged: controller.onCountryChanged,
                        //   errorText: controller.invalidNumberMessage,
                        //   onChanged: controller.phoneValidation,
                        //   controller: controller.phonecontroller,
                        // ),
                        // Gap(77.w),
                        // AppButton(height: 46.h, width: 280.w, title: "Update"),
                        // Gap(56.h),
                        // GestureDetector(
                        //   onTap: () {
                        //     Get.toNamed(AppRoutes.change_email);
                        //   },
                        //   child: Row(
                        //     children: [
                        //       Gap(17.w),
                        //       SvgPicture.asset('assets/icons/edit-3.svg'),
                        //       Gap(10.w),
                        //       AppText(
                        //         title: 'Change Email',
                        //         color: AppColors.primary_color,
                        //         size: 12,
                        //         fontWeight: FontWeight.w400,
                        //       )
                        //     ],
                        //   ),
                        // ),
                        // Gap(22.h),
                        // GestureDetector(
                        //   onTap: () {
                        //     Get.toNamed(AppRoutes.change_phone);
                        //   },
                        //   child: Row(
                        //     children: [
                        //       Gap(17.w),
                        //       SvgPicture.asset('assets/icons/edit-3.svg'),
                        //       Gap(10.w),
                        //       AppText(
                        //         title: 'Change Phone number',
                        //         color: AppColors.primary_color,
                        //         size: 12,
                        //         fontWeight: FontWeight.w400,
                        //       )
                        //     ],
                        //   ),
                        // ),
                        // Gap(22.h),
                        // InkWell(
                        //   onTap: () {
                        //     Get.toNamed(AppRoutes.changepassword);
                        //   },
                        //   child: Row(
                        //     children: [
                        //       Gap(17.w),
                        //       SvgPicture.asset(
                        //         'assets/icons/lock (1).svg',
                        //         color: AppColors.primary_color,
                        //       ),
                        //       Gap(10.w),
                        //       AppText(
                        //         title: 'Change password',
                        //         color: AppColors.primary_color,
                        //         size: 12,
                        //         fontWeight: FontWeight.w400,
                        //       )
                        //     ],
                        //   ),
                        // ),
                        // Gap(51.w),
                        // Row(
                        //   children: [
                        //     Gap(17.w),
                        //     SvgPicture.asset(
                        //       'assets/icons/log-out.svg',
                        //       color: AppColors.red,
                        //     ),
                        //     Gap(10.w),
                        //     AppText(
                        //       title: 'Log out',
                        //       color: AppColors.red,
                        //       size: 12,
                        //       fontWeight: FontWeight.w500,
                        //     )
                        //   ],
                        // ),
                        // Gap(20.w),
                        // InkWell(
                        //   onTap: () {
                        //     Get.toNamed(AppRoutes.beaconBroadcaster);
                        //   },
                        //   child: Row(
                        //     children: [
                        //       Gap(17.w),
                        //       SvgPicture.asset(
                        //         'assets/icons/lock (1).svg',
                        //         color: AppColors.primary_color,
                        //       ),
                        //       Gap(10.w),
                        //       AppText(
                        //         title: 'BroadCast',
                        //         color: AppColors.primary_color,
                        //         size: 12,
                        //         fontWeight: FontWeight.w400,
                        //       )
                        //     ],
                        //   ),
                        // ),
                        // Gap(12.w),
                        // InkWell(
                        //   onTap: () {
                        //     Get.toNamed(AppRoutes.beaconScanner);
                        //   },
                        //   child: Row(
                        //     children: [
                        //       Gap(17.w),
                        //       SvgPicture.asset(
                        //         'assets/icons/lock (1).svg',
                        //         color: AppColors.primary_color,
                        //       ),
                        //       Gap(10.w),
                        //       AppText(
                        //         title: 'Scanner',
                        //         color: AppColors.primary_color,
                        //         size: 12,
                        //         fontWeight: FontWeight.w400,
                        //       )
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
