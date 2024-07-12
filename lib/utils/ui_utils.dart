// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:find_me/components/buttons/app_button.dart';
import 'package:find_me/components/buttons/prefix_icon_button.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:find_me/utils/images/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class UiUtilites {
  static errorSnackbar(String title, String message) {
    Get.snackbar(
      title.tr,
      message.tr,
      colorText: AppColors.white,
      backgroundColor: AppColors.red,
      duration: const Duration(seconds: 2),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static successSnackbar(String message, String title) {
    Get.snackbar(
      title.tr,
      message.tr,
      backgroundColor: AppColors.green,
      colorText: AppColors.white,
      duration: const Duration(seconds: 2),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static registerSuccessAlert(context, title) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        // Future.delayed(Duration(seconds: 2), () {
        //   Get.back();
        // });

        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: AlertDialog(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            shape: RoundedRectangleBorder(
                side: BorderSide(
                  //color: Colors.transparent, style: BorderStyle.solid
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            // contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Gap(10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(ImagesConst.tickicon),
                      AppText(
                        title: 'Thank You!',
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  Gap(30),
                  AppText(
                    title:
                        'Your feedback helps make the app\n better for everyone. ',
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w400,
                    size: 10.sp,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static logoutSuccessAlert(context, ontap, ontapno) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          surfaceTintColor: AppColors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(13))),
          content: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Gap(10),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: AppText(
                      title: 'Are You Sure, you want to logout!'.tr,
                      textAlign: TextAlign.center,
                      size: 17),
                ),
                Gap(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: ontap,
                      child: Container(
                        height: 35,
                        width: 55,
                        decoration: BoxDecoration(
                            color: AppColors.light_blue,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            'Yes'.tr,
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: ontapno,
                      child: Container(
                        height: 35,
                        width: 50,
                        decoration: BoxDecoration(
                            color: AppColors.light_blue,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            'No'.tr,
                            style: TextStyle(
                              fontSize: 20.0,
                              // color: AppColors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  static showBusinessCardDialog({
    BuildContext? context,
    String? name,
    String? email,
    String? image,
    String? instagram,
    String? twitter,
    String? facebook,
    String? tiktok,
    String? notification,
    String? smartphoneNumber,
  }) {
    return showDialog(
      context: context!,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: AlertDialog(
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(13))),
            content: Container(
                //  width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    //  color: Colors.white,
                    // borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                child: Card(
                  color: Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(19.r),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 22),
                          // width: 312,
                          // height: 130,
                          width: MediaQuery.of(context).size.width * 0.9.w,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(19.r))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Wiliam Smith',
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Gap(5.h),
                                  Text(
                                    'Ui Designer',
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Gap(8.h),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/home_img.svg',
                                      ),
                                      Gap(5.w),
                                      Text(name!,
                                          style: TextStyle(
                                              color: AppColors.white,
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                  Gap(8.h),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/mail.svg',
                                      ),
                                      Gap(5.w),
                                      Text(email!,
                                          style: TextStyle(
                                              color: AppColors.white,
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w400)),
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'logo',
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Gap(13.h),
                                  Image.asset(image!),
                                  // 'assets/images/person.png'
                                  //
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              top: 15, bottom: 20, left: 36, right: 32),
                          // width: 312,
                          // height: 60,
                          width: MediaQuery.of(context).size.width * 0.9.w,
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(19.r))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/instagram_black.svg',
                                          //color: Colors.black,
                                        ),
                                        Gap(5.w),
                                        Expanded(
                                          child: Text(instagram!,
                                              //'@wiliamX2'
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 7.sp,
                                                fontWeight: FontWeight.w400,
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                  Gap(20.w),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/twitter_black.svg',
                                        ),
                                        Gap(5.w),
                                        Expanded(
                                          child: Text(twitter!,
                                              //'@wiliamX2'
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 7.sp,
                                                fontWeight: FontWeight.w400,
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                  Gap(5.w),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/facebook_black.svg',
                                        ),
                                        Gap(5.w),
                                        Expanded(
                                          child: Text(facebook!,
                                              //'@wiliamX2'
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 7.sp,
                                                fontWeight: FontWeight.w400,
                                              )),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Gap(7.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/tiktok_black.svg',
                                          color: Colors.black,
                                        ),
                                        Gap(5.w),
                                        Expanded(
                                          child: Text(tiktok!,
                                              //'@wiliamX2'
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 7.sp,
                                                fontWeight: FontWeight.w400,
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                  Gap(31.w),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/notification.svg',
                                      ),
                                      Gap(5.w),
                                      Text(notification!,
                                          //'@wiliamX2'
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 7.sp,
                                            fontWeight: FontWeight.w400,
                                          ))
                                    ],
                                  ),
                                  Gap(31.w),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/smartphone.svg',
                                      ),
                                      Gap(5.w),
                                      Text(smartphoneNumber!,
                                          //'@+971 8876 5467'
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 7.sp,
                                            fontWeight: FontWeight.w400,
                                          ))
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 50.0),
                          child: PrefixIconButton(
                            title: 'Download',
                            height: 53.0.h,
                            width: 320.0.w,
                            color: AppColors.primary_color,
                            textColors: AppColors.white,
                            image: ImagesConst.download,
                            onTap: () {
                              // Handle the button tap
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ),
        );
      },
    );
  }

  static coinsAlert(context, title) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        // Future.delayed(Duration(seconds: 2), () {
        //   Get.back();
        // });

        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: AlertDialog(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            shape: RoundedRectangleBorder(
                side: BorderSide(
                  //color: Colors.transparent, style: BorderStyle.solid
                  color: AppColors.primary_color,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            // contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              height: 190,
              width: 20,
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Gap(5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Image.asset('assets/images/cross.png'),

                        // SvgPicture.asset(
                        //   'assets/images/cross.svg',
                        // ),
                      ),
                    ],
                  ),
                  Gap(10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                          title: 'Done!',
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w500,
                          size: 14,
                          color: AppColors.primary_color),
                    ],
                  ),
                  Gap(5),
                  AppText(
                    title: 'You have ',
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w400,
                    size: 10.sp,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/coin_icon.png'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '5000 coins',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Gap(10),
                  AppButton(
                    height: 50.0.h,
                    width: 50.0.w,
                    title: 'Back to home',
                    onTap: () {
                      Get.back();
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
