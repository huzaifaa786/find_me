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
                        GridView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.Emojis.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                              crossAxisSpacing: 0.1,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  EmojisCard(
                                    picture: controller.Emojis[index],
                                    value: 10,
                                  ),
                                ],
                              );
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
