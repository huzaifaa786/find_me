// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:find_me/app/emoji_menu/components/coins_value.dart';
import 'package:find_me/app/emoji_menu/components/custom_scroll_bar.dart';
import 'package:find_me/app/emoji_menu/emoji_menu_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class EmojiMenuView extends StatefulWidget {
  const EmojiMenuView({super.key});

  @override
  State<EmojiMenuView> createState() => _EmojiMenuViewState();
}

class _EmojiMenuViewState extends State<EmojiMenuView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmojiMenuController>(
        builder: (controller) => Scaffold(
              backgroundColor: AppColors.black,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                forceMaterialTransparency: true,
                title: topBar(
                    name: "Emoji Menu",
                    showBackIcon: true,
                    color: AppColors.white),
              ),
              body: SafeArea(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(2.0),
                        height: 646.h,
                        width: 164.w,
                        decoration: BoxDecoration(
                            color: AppColors.light_black,
                            borderRadius: BorderRadius.circular(9)),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 14, left: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Image.asset(
                                    "assets/images/grinning_face.png",
                                    height: 54.h,
                                    width: 54.02.w,
                                  ),
                                  Image.asset(
                                    "assets/images/smiling_face_with_horns.png",
                                    height: 54.h,
                                    width: 53.w,
                                  ),
                                  Image.asset(
                                    "assets/images/smiling face with smiling eyes.png",
                                    height: 54.h,
                                    width: 53.w,
                                  ),
                                  Image.asset(
                                    "assets/images/traget.png",
                                    height: 54.h,
                                    width: 53.w,
                                  ),
                                  Image.asset(
                                    "assets/images/stuck_out_tongue _winking_eye.png",
                                    height: 54.h,
                                    width: 53.w,
                                  ),
                                  Image.asset(
                                    "assets/images/loving.png",
                                    height: 54,
                                    width: 52,
                                  ),
                                  Image.asset(
                                    "assets/images/Squinting face with tongue.png",
                                    height: 54.h,
                                    width: 52.w,
                                  ),
                                  Image.asset(
                                    "assets/images/traget.png",
                                    height: 54.h,
                                    width: 52.w,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    "assets/images/sunglass.png",
                                    height: 55.h,
                                    width: 53.w,
                                  ),
                                  Image.asset(
                                    "assets/images/loving.png",
                                    height: 54.h,
                                    width: 53.w,
                                  ),
                                  Image.asset(
                                    "assets/images/Squinting face with tongue.png",
                                    height: 54.h,
                                    width: 53.w,
                                  ),
                                  Image.asset(
                                    "assets/images/party.png",
                                    height: 54.h,
                                    width: 52.w,
                                  ),
                                  Image.asset(
                                    "assets/images/angry.png",
                                    height: 54.h,
                                    width: 52.w,
                                  ),
                                  Image.asset(
                                    "assets/images/stuck_out_tongue _winking_eye.png",
                                    height: 54.h,
                                    width: 53.w,
                                  ),
                                  Image.asset(
                                    "assets/images/smiling face with smiling eyes.png",
                                    height: 54.h,
                                    width: 53.w,
                                  ),
                                  Image.asset(
                                    "assets/images/party.png",
                                    height: 54.h,
                                    width: 53.w,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 14, left: 16, right: 10),
                        height: 646.h,
                        width: 164.w,
                        decoration: BoxDecoration(
                            color: AppColors.light_black,
                            borderRadius: BorderRadius.circular(9)),
                        child: SingleChildScrollView(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Image.asset(
                                    "assets/images/smiling_face_with _halo.png",
                                    height: 57.h,
                                    width: 62.w,
                                  ),
                                  Gap(2.51.h),
                                  CoinsValue(
                                    value: "10",
                                  ),
                                  Gap(11.5.h),
                                  Image.asset(
                                    "assets/images/smiling_face_with _halo.png",
                                    height: 57.h,
                                    width: 62.w,
                                  ),
                                  Gap(2.51.h),
                                  CoinsValue(
                                    value: "10",
                                  ),
                                  Gap(11.5.h),
                                  Image.asset(
                                    "assets/images/heart_emoji.png",
                                    height: 53,
                                    width: 58,
                                  ),
                                  Gap(2.51.h),
                                  CoinsValue(
                                    value: "10",
                                  ),
                                  Gap(11.5.h),
                                  Image.asset(
                                    "assets/images/star_struck.png",
                                    height: 57.h,
                                    width: 62.w,
                                  ),
                                  Gap(2.51.h),
                                  CoinsValue(
                                    value: "10",
                                  ),
                                  Gap(11.5.h),
                                  Image.asset(
                                    "assets/images/blue_heart.png",
                                    height: 57.h,
                                    width: 63.w,
                                  ),
                                  Gap(2.51.h),
                                  CoinsValue(
                                    value: "10",
                                  ),
                                  Gap(11.5),
                                  Image.asset(
                                    "assets/images/grinning_face_with_halo.png",
                                    height: 57.h,
                                    width: 63.w,
                                  ),
                                  Gap(2.51.h),
                                  CoinsValue(
                                    value: "10",
                                  ),
                                  Gap(11.5.h),
                                  Image.asset(
                                    "assets/images/star_struck.png",
                                    height: 57.h,
                                    width: 62.w,
                                  ),
                                  Gap(2.51.h),
                                  CoinsValue(
                                    value: "10",
                                  ),
                                  Gap(11.5.h),
                                  Image.asset(
                                    "assets/images/star_struck.png",
                                    height: 57.h,
                                    width: 62.w,
                                  ),
                                  Gap(2.51.h),
                                  CoinsValue(
                                    value: "10",
                                  ),
                                  Gap(11.5.h),
                                  Image.asset(
                                    "assets/images/star_struck.png",
                                    height: 57.h,
                                    width: 62.w,
                                  ),
                                  Gap(2.51.h),
                                  CoinsValue(
                                    value: "10",
                                  ),
                                  Gap(11.5.h),
                                  Image.asset(
                                    "assets/images/star_struck.png",
                                    height: 57.h,
                                    width: 62.w,
                                  ),
                                  Gap(2.51.h),
                                  CoinsValue(
                                    value: "10",
                                  ),
                                  Gap(11.5.h),
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    "assets/images/angry_emoji.png",
                                    height: 57.h,
                                    width: 62.w,
                                  ),
                                  CoinsValue(
                                    value: "10",
                                  ),
                                  Gap(15.h),
                                  Image.asset(
                                    "assets/images/cold_emoji.png",
                                    height: 61.h,
                                    width: 63.w,
                                  ),
                                  Gap(8.h),
                                  CoinsValue(
                                    value: "10",
                                  ),
                                  Gap(11.5.h),
                                  Image.asset(
                                    "assets/images/emojis_heart.png",
                                    height: 58.h,
                                    width: 60.w,
                                  ),
                                  Gap(1.9.h),
                                  CoinsValue(
                                    value: "10",
                                  ),
                                  Gap(11.5.h),
                                  Image.asset(
                                    "assets/images/laughing_emojis.png",
                                    height: 56.h,
                                    width: 62.w,
                                  ),
                                  Gap(2.51.h),
                                  CoinsValue(
                                    value: "10",
                                  ),
                                  Gap(11.5.h),
                                  Image.asset(
                                    "assets/images/cold_angry_emoji.png",
                                    height: 57.h,
                                    width: 62.w,
                                  ),
                                  Gap(2.51.h),
                                  CoinsValue(
                                    value: "10",
                                  ),
                                  Gap(11.5.h),
                                  Image.asset(
                                    "assets/images/emojis_heart.png",
                                    height: 56.h,
                                    width: 62.w,
                                  ),
                                  Gap(2.51.h),
                                  CoinsValue(
                                    value: "10",
                                  ),
                                  Gap(11.5.h),
                                  Image.asset(
                                    "assets/images/emojis_heart.png",
                                    height: 56.h,
                                    width: 62.w,
                                  ),
                                  Gap(2.51.h),
                                  CoinsValue(
                                    value: "10",
                                  ),
                                  Gap(11.5.h),
                                  Image.asset(
                                    "assets/images/emojis_heart.png",
                                    height: 56.h,
                                    width: 62.w,
                                  ),
                                  Gap(2.51.h),
                                  CoinsValue(
                                    value: "10",
                                  ),
                                  Gap(11.5.h),
                                  Image.asset(
                                    "assets/images/emojis_heart.png",
                                    height: 56.h,
                                    width: 62.w,
                                  ),
                                  Gap(2.51.h),
                                  CoinsValue(
                                    value: "10",
                                  ),
                                  Gap(11.5.h),
                                  Image.asset(
                                    "assets/images/emojis_heart.png",
                                    height: 56.h,
                                    width: 62.w,
                                  ),
                                  Gap(2.51.h),
                                  CoinsValue(
                                    value: "10",
                                  ),
                                  Gap(11.5.h),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
            ));
  }
}
