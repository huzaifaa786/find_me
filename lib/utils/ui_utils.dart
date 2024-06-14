import 'dart:ui';

import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:find_me/utils/images/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class UiUtilites {
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
  static errorSnackbar(String title, String message) {
    Get.snackbar(
      title.tr,
      message.tr,
      colorText: AppColors.white,
      backgroundColor: Colors.red,
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
                            color: AppColors.primary_color,
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
                            color: AppColors.primary_color,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            'No'.tr,
                            style: TextStyle(fontSize: 20.0),
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

  static showBusinessCardDialog(
      BuildContext context, String name, String email) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          //backgroundColor: AppColors.white,
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
                color: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(19.0),
                ),
                child: SingleChildScrollView(
                
                  child: Column(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 22),
                        // width: 312,
                        // height: 130,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(19.0))),
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
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                                Gap(5.h),
                                Text(
                                  'Ui Designer',
                                  style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500),
                                ),
                                Gap(8.h),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/home_img.svg',
                                    ),
                                    Gap(5),
                                    Text(name,
                                        style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 8,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                                Gap(8.h),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/mail.svg',
                                    ),
                                    Gap(5),
                                    Text(email,
                                        style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 10,
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
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                Gap(13.h),
                                Image.asset('assets/images/person.png'),
                                //
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 35, vertical: 11),
                        // width: 312,
                        // height: 60,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(19.0))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/instagram_black.svg',
                                      //color: Colors.black,
                                    ),
                                    Gap(5.w),
                                    Text('@wiliamX2',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 7,
                                          fontWeight: FontWeight.w400,
                                        ))
                                  ],
                                ),
                                Gap(31.w),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/twitter_black.svg',
                                      //color: Colors.black,
                                    ),
                                    Gap(5.w),
                                    Text('@wiliamX2',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 7,
                                          fontWeight: FontWeight.w400,
                                        ))
                                  ],
                                ),
                                Gap(31.w),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/facebook_black.svg',
                                      // color: Colors.black,
                                    ),
                                    Gap(5.w),
                                    Text('@wiliamX2',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 7,
                                          fontWeight: FontWeight.w400,
                                        ))
                                  ],
                                )
                              ],
                            ),
                            Gap(7.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/tiktok_black.svg',
                                      color: Colors.black,
                                    ),
                                    Gap(5.w),
                                    Text('@wiliamX2',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 7,
                                          fontWeight: FontWeight.w400,
                                        ))
                                  ],
                                ),
                                Gap(31.w),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/notification.svg',
                                      //color: Colors.black,
                                    ),
                                    Gap(5.w),
                                    Text('@wiliamX2',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 7,
                                          fontWeight: FontWeight.w400,
                                        ))
                                  ],
                                ),
                                Gap(31.w),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/smartphone.svg',
                                      // color: Colors.black,
                                    ),
                                    Gap(5.w),
                                    Text('@+971 8876 5467',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 7,
                                          fontWeight: FontWeight.w400,
                                        ))
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
              
        );
      },
    );
  }
}
