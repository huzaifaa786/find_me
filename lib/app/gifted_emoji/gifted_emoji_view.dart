// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:find_me/app/gifted_emoji/gifted_emoji_controller.dart';
import 'package:find_me/app/gifted_emoji/components/emojis_card.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class GiftedEmojiView extends StatefulWidget {
  const GiftedEmojiView({super.key});

  @override
  State<GiftedEmojiView> createState() => _GiftedEmojiViewState();
}

class _GiftedEmojiViewState extends State<GiftedEmojiView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GiftedEmojiController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                  automaticallyImplyLeading: false,
                  forceMaterialTransparency: true,
                  title: topBar(name: "Gifted Emoji", showBackIcon: true)),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 34.w),
                    child: Column(
                      children: [
                        Gap(21.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Image.asset(
                              "assets/images/calligraphic-design.png",
                              height: 46.h,
                              width: 186.w,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            EmojisCard(
                              picture: "assets/images/grinning_face.png",
                              value: 10,
                            ),
                            EmojisCard(
                              picture: "assets/images/sunglass.png",
                              value: 10,
                            ),
                            EmojisCard(
                              picture: "assets/images/pink_flowers.png",
                              value: 10,
                            ),
                            EmojisCard(
                              picture: "assets/images/yellow_ flowers.png",
                              value: 10,
                            ),
                            EmojisCard(
                              picture: "assets/images/diamond.png",
                              value: 10,
                            ),
                          ],
                        ),
                        Gap(16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Gap(9.w),
                            EmojisCard(
                              picture:
                                  "assets/images/stuck_out_tongue _winking_eye.png",
                              value: 10,
                            ),
                            EmojisCard(
                              picture: "assets/images/angry.png",
                              value: 10,
                            ),
                          ],
                        ),
                        Gap(14.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Gap(9.w),
                            EmojisCard(
                              picture: "assets/images/loving.png",
                              value: 10,
                            ),
                            EmojisCard(
                              picture:
                                  "assets/images/stuck_out_tongue _winking_eye.png",
                              value: 10,
                            ),
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
