// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_me/app/gifted_emoji/gifted_emoji_controller.dart';
import 'package:find_me/app/gifted_emoji/components/emojis_card.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

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
                  title: topBar(name: "Gifted Emoji".tr, showBackIcon: true)),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 34.w),
                    child: Column(
                      children: [
                        GridView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.allEmojis.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 0.1,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return Stack(
                                alignment: Alignment.center,
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: controller.allEmojis[index].image,
                                    placeholder: (context, url) =>
                                        Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[100]!,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        width: 100,
                                        height: 100,
                                      ),
                                    ), // 
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                    width: 55,
                                    height: 55,
                                  ),
                                  if (controller.allEmojis[index].type ==
                                      "paid")
                                    Positioned(
                                      top: 19,
                                      left: -1.5,
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            "assets/images/gift_coin.png",
                                            height: 22.23.h,
                                            width: 22.09.w,
                                          ),
                                          Text(
                                            controller.allEmojis[index].coins
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  if (controller.allEmojis[index].giftCount !=
                                      "0")
                                    Positioned(
                                      bottom: -3,
                                      child: Text(
                                        controller.allEmojis[index].giftCount ??
                                            "",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
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
