// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_me/app/emoji_menu/components/coins_value.dart';
import 'package:find_me/app/emoji_menu/components/custom_scroll_bar.dart';
import 'package:find_me/app/emoji_menu/emoji_menu_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

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
              appBar: AppBar(
                automaticallyImplyLeading: false,
                forceMaterialTransparency: true,
                toolbarHeight: 83.h,
                title: topBar(
                  name:controller.emojiType == "free" ? "Emojis for All".tr :"FindMe Picks".tr,
                  showBackIcon: true,
                ),
              ),
              body: SafeArea(
                  child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: controller.emojiType == "free"
                        ? GridView.builder(
                            itemCount: controller.freeEmojis.length,
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  UiUtilites.emojisappear(context,
                                      controller.freeEmojis[index].image, () {
                                    controller.addEmojis(
                                        controller.freeEmojis[index].id);
                                  });
                                },
                                child: Column(
                                  children: [
                                    Flexible(
                                      child: CachedNetworkImage(
                                        height: 58.h,
                                        width: 58.w,
                                        imageUrl:
                                            controller.freeEmojis[index].image,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            })
                        : GridView.builder(
                            itemCount: controller.paidEmojis.length,
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  UiUtilites.emojisappear(context,
                                      controller.paidEmojis[index].image, () {
                                    controller.addEmojis(
                                        controller.paidEmojis[index].id);
                                  });
                                },
                                child: Column(
                                  children: [
                                    Flexible(
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            controller.paidEmojis[index].image,
                                        placeholder: (context, url) =>
                                            Shimmer.fromColors(
                                          baseColor: Colors.grey[300]!,
                                          highlightColor: Colors.grey[100]!,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(100)),
                                           height: 58.h,
                                        width: 58.w,
                                          ),
                                        ),
                                        // CircularProgressIndicator(strokeWidth: 1.5,),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icons/coins.svg",
                                          height: 18.23.h,
                                          width: 19.09.w,
                                        ),
                                        Text(
                                          controller.paidEmojis[index].coins
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            })),
              )),
            ));
  }
}
