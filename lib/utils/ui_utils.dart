// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_me/app/home/home_controller.dart';
import 'package:find_me/app/main_view/main_controller.dart';
import 'package:find_me/components/buttons/app_button.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:find_me/components/buttons/prefix_icon_button.dart';
import 'package:find_me/components/textfields/app_textfields.dart';
import 'package:find_me/routes/app_routes.dart';
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
import 'package:shimmer/shimmer.dart';

class UiUtilites {
  static errorSnackbar(String title, String message) {
    AnimatedSnackBar(
      mobileSnackBarPosition: MobileSnackBarPosition.bottom,
      mobilePositionSettings: const MobilePositionSettings(
        bottomOnAppearance: 20,
      ),
      duration: Duration(milliseconds: 5000),
      builder: ((context) {
        return MaterialAnimatedSnackBar(
          titleText: title.isNotEmpty ? title : null,
          messageText: message,
          type: AnimatedSnackBarType.error,
        );
      }),
    ).show(Get.context!);
  }

  static successSnackbar(String message, String title) {
    AnimatedSnackBar(
      mobileSnackBarPosition: MobileSnackBarPosition.bottom,
      mobilePositionSettings: const MobilePositionSettings(
        bottomOnAppearance: 20,
      ),
      duration: Duration(milliseconds: 5000),
      builder: ((context) {
        return MaterialAnimatedSnackBar(
          titleText: title.isNotEmpty ? title : null,
          messageText: message,
          type: AnimatedSnackBarType.success,
        );
      }),
    ).show(Get.context!);
  }

  static successCustomSnackbar(String message, {double position = 50}) {
    AnimatedSnackBar(
      mobileSnackBarPosition: MobileSnackBarPosition.bottom,
      mobilePositionSettings: MobilePositionSettings(
        bottomOnAppearance: position,
      ),
      duration: Duration(milliseconds: 5000),
      builder: ((context) {
        return Container(
          width: Get.width * 0.7,
          decoration: BoxDecoration(
              color: AppColors.lowGreen.withOpacity(0.29),
              borderRadius: BorderRadius.circular(3)),
          padding: EdgeInsets.only(left: 22, bottom: 7, right: 22, top: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: AppText(
                    title: message,
                    size: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.green),
              ),
              Gap(6),
              SvgPicture.asset("assets/icons/Check.svg"),
            ],
          ),
        );
        // return MaterialAnimatedSnackBar(
        //   titleText: title.isNotEmpty ? title : null,
        //   messageText: message,
        //   type: AnimatedSnackBarType.success,
        //   messageTextStyle: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: AppColors.green),
        //   backgroundColor: AppColors.lowGreen.withOpacity(0.29),
        //   foregroundColor: AppColors.green,
        // );
      }),
    ).show(Get.context!);
  }

  static registerSuccessAlert(
    context,
    message,
  ) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: AlertDialog(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: Colors.transparent, style: BorderStyle.solid
                    // color: AppColors.primary_color,
                    ),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            // contentPadding: EdgeInsets.only(top: 10.0),
            content: Wrap(
              children: [
                Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    // Gap(10.h),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.asset("assets/icons/x-circle.svg"),
                        ],
                      ),
                    ),
                    Image.asset(
                      ImagesConst.registreted_successfully_gif,
                      height: 121,
                      width: 112,
                      fit: BoxFit.cover,
                    ),
                    // Gap(20),

                    AppText(
                      title: message.toString(),
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w400,
                      size: 14.sp,
                    ),
                  ],
                ),
              ],
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
                                    'Wiliam Smith'.tr,
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Gap(5.h),
                                  Text(
                                    'Ui Designer'.tr,
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
                                    'logo'.tr,
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
                            title: 'Download'.tr,
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

  static coinsAlert(context, coins) {
    return showDialog(
      context: context,
      barrierDismissible: false,
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
              // padding: EdgeInsets.only(left: 20, right: 20),
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
                        child: SvgPicture.asset(
                          'assets/icons/cross.svg',
                          height: 30.h,
                          width: 30.w,
                        ),
                      ),
                    ],
                  ),
                  Gap(10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                          title: 'Done!'.tr,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w500,
                          size: 18,
                          color: AppColors.primary_color),
                    ],
                  ),
                  Gap(5),
                  AppText(
                    title: 'You have'.tr,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w400,
                    size: 14.sp,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/coin_icon_big.png',
                        height: 70.h,
                        width: 70.w,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${coins} coins'.tr,
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Gap(10),
                  AppButton(
                    height: 50.0.h,
                    width: 50.0.w,
                    title: 'Back to home'.tr,
                    onTap: () {
                      Get.back();
                      Get.offAndToNamed(AppRoutes.mainview);
                      Get.find<MainController>().onChange(0);
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

  static emojisappear(
    context,
    image,
    onTap,
  ) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: AlertDialog(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.r),
              ),
              content: Container(
                height: 240.h,
                width: 150.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CachedNetworkImage(
                      imageUrl: image,
                      height: 100.h,
                      width: 100.w,
                    ),
                    // AppText(
                    //   title: "Done!".tr,
                    //   fontWeight: FontWeight.w600,
                    //   size: 14.sp,
                    // ),
                    Gap(10),
                    AppText(
                      title: "The emoji will appear in\n “My Emojis & Picks”",
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w400,
                      size: 12.sp,
                      color: AppColors.black.withOpacity(0.69),
                    ),
                    Gap(10),
                    GestureDetector(
                      onTap: onTap,
                      child: Container(
                        height: 50.h,
                        width: 200.w,
                        decoration: BoxDecoration(
                          color: AppColors.primary_color,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: AppText(
                            title: "Confirm".tr,
                            textAlign: TextAlign.center,
                            color: AppColors.white,
                            fontWeight: FontWeight.w500,
                            size: 12.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  static noCoinsEnoughAlert(
    context,
  ) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(19))),
          // contentPadding: EdgeInsets.only(top: 10.0),
          content: Container(
            // padding: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(19.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // Gap(2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: SvgPicture.asset(
                        'assets/icons/cross.svg',
                        height: 20.h,
                        width: 20.w,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/smiles.svg",
                      height: 50.h,
                      width: 50.w,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
                Gap(20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      title: 'Not enough coins.'.tr,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w500,
                      size: 13,
                      // color: AppColors.primary_color
                    ),
                  ],
                ),
                Gap(10),
                AppText(
                  title: 'purchase more to gift.'.tr,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w400,
                  size: 11.sp,
                  color: AppColors.hintGrey,
                ),
                Gap(20.h),
                AppButton(
                  height: 50.0.h,
                  width: 50.0.w,
                  title: 'Purchase'.tr,
                  onTap: () {
                    Get.back();
                    Get.toNamed(AppRoutes.mainview);
                    Get.find<MainController>().onChange(1);
                  },
                )
              ],
            ),
          ),
        );
        //  );
      },
    );
  }

  static warningAlert(context, {showRemeber = false, required String text}) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          shape: RoundedRectangleBorder(
              side: BorderSide(
                //color: Colors.transparent, style: BorderStyle.solid
                color: AppColors.primary_color,
              ),
              borderRadius: BorderRadius.all(Radius.circular(19))),
          // contentPadding: EdgeInsets.only(top: 10.0),
          content: Container(
            // padding: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(19.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // Gap(2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: SvgPicture.asset(
                        'assets/icons/cross.svg',
                        height: 30.h,
                        width: 30.w,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/warning.png',
                      height: 45.h,
                      width: 45.w,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),

                showRemeber
                    ? Column(
                        children: [
                          Gap(10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppText(
                                title: 'Remember!'.tr,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.w600,
                                size: 12,
                                // color: AppColors.primary_color
                              ),
                            ],
                          ),
                        ],
                      )
                    : SizedBox(),
                Gap(10),
                Center(
                  child: AppText(
                    title: text.tr,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w400,
                    size: 12.sp,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ),
        );
        //  );
      },
    );
  }

  static accountAlert(context,
      {showRemeber = false,
      required String text,
      required onTapYes,
      required onTapNo}) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          shape: RoundedRectangleBorder(
              side: BorderSide(
                //color: Colors.transparent, style: BorderStyle.solid
                color: AppColors.primary_color,
              ),
              borderRadius: BorderRadius.all(Radius.circular(19))),
          // contentPadding: EdgeInsets.only(top: 10.0),
          content: Container(
            // padding: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(19.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // Gap(2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: SvgPicture.asset(
                        'assets/icons/cross.svg',
                        height: 30.h,
                        width: 30.w,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/warning.png',
                      height: 45.h,
                      width: 45.w,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),

                showRemeber
                    ? Column(
                        children: [
                          Gap(10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppText(
                                title: 'Remember!'.tr,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.w600,
                                size: 12,
                                // color: AppColors.primary_color
                              ),
                            ],
                          ),
                        ],
                      )
                    : SizedBox(),
                Gap(10),
                Center(
                  child: AppText(
                    title: text.tr,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w400,
                    size: 12.sp,
                    color: AppColors.black,
                  ),
                ),
                Gap(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: onTapYes,
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
                      onTap: onTapNo,
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
        //  );
      },
    );
  }

  static accountUpgradeAlert(context, HomeController controller) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: Icon(
            Icons.warning,
            size: 48,
          ),
          iconColor: AppColors.red,
          title: AppText(
            title: "Premium Account Required".tr,
            size: 16,
            fontWeight: FontWeight.w700,
          ),
          content: AppText(
            title:
                "Free users can only view 6 profiles. Please upgrade to Premium to view all."
                    .tr,
            size: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.black.withOpacity(0.45),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            AppButton(
                onTap: () {
                  Get.back();
                  Get.toNamed(AppRoutes.subscriptions)!.then((value) {
                    controller.getUser();
                  });
                },
                height: 50.h,
                width: 100.w,
                title: "Upgrade".tr),
            AppButton(
                onTap: () {
                  Get.back();
                },
                color: AppColors.white,
                textColors: AppColors.red,
                borderColor: AppColors.red,
                height: 50.h,
                width: 100.w,
                title: "Cancel".tr),
          ],
        );
      },
    );
  }

  static Widget dialogContent(
      {required String imageUrl,
      required Function() onTap,
      required TextEditingController controller}) {
    return Container(
      margin: EdgeInsets.only(top: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(19.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: SvgPicture.asset(
                      'assets/icons/cross.svg',
                      height: 30.h,
                      width: 30.w,
                    ),
                  ),
                ],
              ),
              Center(
                  child: CachedNetworkImage(
                imageUrl: imageUrl,
                height: 80.h,
                width: 80.w,
              )),
              SizedBox(height: 24.0),
              AppTextFields(
                hintText: "Type a comment".tr,
                controller: controller,
              ),
              SizedBox(height: 16.0),
              AppButton(
                height: 50.h,
                width: 250.w,
                title: "Send".tr,
                onTap: onTap,
              )
            ],
          ),
        ),
      ),
    );
  }

  static Widget biodialog(
      {
      required Function() onTap,
      required TextEditingController controller}) {
    return Container(
      margin: EdgeInsets.only(top: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(19.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: SvgPicture.asset(
                      'assets/icons/cross.svg',
                      height: 30.h,
                      width: 30.w,
                    ),
                  ),
                ],
              ),
              AppText(
                title: "Edit Bio".tr,
                size: 14,
                fontWeight: FontWeight.w600,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    AppText(
                      title: 'Bio'.tr,
                      size: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black.withOpacity(0.40),
                    ),
                  ],
                ),
              ),
              AppTextFields(
                hintText: "Type bio".tr,
                controller: controller,
              ),
              SizedBox(height: 16.0),
              AppButton(
                height: 50.h,
                width: 250.w,
                title: "Update".tr,
                onTap: onTap,
              )
            ],
          ),
        ),
      ),
    );
  }

  static successGreenAlert(
    context, {
    required String text,
    required onTapDone,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(19))),
          content: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(19.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      title: "",
                      textAlign: TextAlign.center,
                      size: 12.sp,
                      color: AppColors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AppText(
                        title: "Successfully".tr,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w600,
                        size: 18.sp,
                        color: AppColors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 18.0),
                        child: SvgPicture.asset(
                          'assets/icons/cross.svg',
                          height: 25.h,
                          width: 25.w,
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(10),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: Image.asset(
                    'assets/images/green_tick.png',
                    height: 81.h,
                    width: 73.w,
                    fit: BoxFit.contain,
                  ),
                ),
                Gap(10),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: AppText(
                    title: text.tr,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w400,
                    size: 12.sp,
                    color: AppColors.black.withOpacity(0.78),
                  ),
                ),
                Gap(20),
                AppButton(
                  height: 50.h,
                  width: 250.w,
                  title: "Done".tr,
                  color: AppColors.lightGreen,
                  borderColor: AppColors.lightGreen,
                  onTap: onTapDone,
                )
              ],
            ),
          ),
        );
        //  );
      },
    );
  }

  static feedBackAlert(
    context, {
    required String text,
    required onTapDone,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(19))),
          content: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(19.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      title: "",
                      textAlign: TextAlign.center,
                      size: 12.sp,
                      color: AppColors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AppText(
                        title: "Thank you!".tr,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w600,
                        size: 18.sp,
                        color: AppColors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 18.0),
                        child: SvgPicture.asset(
                          'assets/icons/cross.svg',
                          height: 25.h,
                          width: 25.w,
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(10),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: Image.asset(
                    'assets/images/blue_tick.png',
                    height: 81.h,
                    width: 73.w,
                    fit: BoxFit.contain,
                  ),
                ),
                Gap(10),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: AppText(
                    title: text.tr,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w400,
                    size: 12.sp,
                    color: AppColors.black.withOpacity(0.78),
                  ),
                ),
                Gap(20),
                AppButton(
                  height: 50.h,
                  width: 250.w,
                  title: "Done".tr,
                  color: AppColors.primary_color,
                  borderColor: AppColors.primary_color,
                  onTap: onTapDone,
                )
              ],
            ),
          ),
        );
        //  );
      },
    );
  }

  static EmojiGiftPopUp(
    context, {
    required String text,
    required String? imageUrl,
    required String? senderImage,
    required String? senderName,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(19))),
          content: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(19.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     GestureDetector(
                //       onTap: () {
                //         Get.back();
                //       },
                //       child: Padding(
                //         padding: const EdgeInsets.only(bottom: 2.0),
                //         child: SvgPicture.asset(
                //           'assets/icons/cross.svg',
                //           height: 25.h,
                //           width: 25.w,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                Gap(2),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 36.r,
                      child: ClipOval(
                        child: senderImage != null
                            ? CachedNetworkImage(
                                imageUrl: senderImage,
                                fit: BoxFit.cover,
                                width: 56.w,
                                height: 56.h,
                              )
                            : SvgPicture.asset("assets/images/User.svg"),
                      ),
                    ),
                    Gap(10.w),
                    Text(
                      senderName ?? "",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Gap(3.w),
                  ],
                ),
                Gap(10),
                Padding(
                  padding: const EdgeInsets.only(right: 0.0),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl ?? "",
                    height: 91.h,
                    width: 83.w,
                    fit: BoxFit.contain,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(19)),
                        height: 81.h,
                        width: 73.w,
                      ),
                    ),
                  ),
                ),
                Gap(10),
                Padding(
                  padding: const EdgeInsets.only(right: 0.0),
                  child: AppText(
                    title: "( \t\t\t${text.tr}\t\t\t  )",
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w500,
                    size: 12.sp,
                    color: AppColors.black,
                  ),
                ),
                Gap(20),
                AppButton(
                  height: 50.h,
                  width: 250.w,
                  title: "Close".tr,
                  color: AppColors.primary_color,
                  borderColor: AppColors.primary_color,
                  textColors: AppColors.white,
                  onTap: () {
                    Get.back();
                  },
                )
              ],
            ),
          ),
        );
        //  );
      },
    );
  }
}
