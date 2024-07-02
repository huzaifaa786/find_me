// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:find_me/app/gifted_emoji/components/emojis_card.dart';
import 'package:find_me/app/my_emojis/my_emojis_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class MyEmojisView extends StatefulWidget {
  const MyEmojisView({super.key});

  @override
  State<MyEmojisView> createState() => _MyEmojisViewState();
}

class _MyEmojisViewState extends State<MyEmojisView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyEmojisController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                forceMaterialTransparency: true,
                title: topBar(
                  name: "My Emojis",
                  showBackIcon: true,
                ),
              ),
              body: SafeArea(
                  child: SingleChildScrollView(
                      child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    Gap(61.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppText(
                          title: "Recent",
                          fontWeight: FontWeight.w600,
                          size: 16,
                        ),
                      ],
                    ),
                    Gap(18.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          "assets/images/stuck_out_tongue _winking_eye.png",
                          height: 55.h,
                          width: 55.w,
                        ),
                        Image.asset(
                          "assets/images/angry.png",
                          height: 55.h,
                          width: 55.w,
                        ),
                        Image.asset(
                          "assets/images/loving.png",
                          height: 55.h,
                          width: 55.w,
                        ),
                        Image.asset(
                          "assets/images/sunglass.png",
                          height: 55.h,
                          width: 55.w,
                        ),
                        Image.asset(
                          "assets/images/pink_flowers.png",
                          height: 55.h,
                          width: 55.w,
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(16.w),
                        Image.asset(
                          "assets/images/yellow_ flowers.png",
                          height: 55.h,
                          width: 55.w,
                        ),
                        Gap(11.w),
                        Image.asset(
                          "assets/images/diamond.png",
                          height: 55.h,
                          width: 55.w,
                        ),
                      ],
                    ),
                    Gap(32.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppText(
                          title: "Favorites",
                          fontWeight: FontWeight.w600,
                          size: 16,
                        ),
                      ],
                    ),
                    Gap(14.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          "assets/images/smiling_face_with _halo.png",
                          height: 50.h,
                          width: 52.w,
                        ),
                        Image.asset("assets/images/angry_emoji.png",
                            height: 50.h, width: 52.w),
                        Image.asset(
                          "assets/images/heart_emoji.png",
                          height: 46.h,
                          width: 49.w,
                        ),
                        Image.asset(
                          "assets/images/cold_emoji.png",
                          height: 54.h,
                          width: 53.w,
                        ),
                        Image.asset(
                          "assets/images/star_struck.png",
                          height: 50.h,
                          width: 52.w,
                        ),
                      ],
                    ),
                    Gap(40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppText(
                          title: "Purchased",
                          fontWeight: FontWeight.w600,
                          size: 16.sp,
                        ),
                      ],
                    ),
                    Gap(25.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Gap(16.w),
                        Image.asset("assets/images/blue_heart.png"),
                        Gap(12.w),
                        Image.asset("assets/images/cold_angry_emoji.png"),
                      ],
                    ),
                  ],
                ),
              ))),
            ));
  }
}
