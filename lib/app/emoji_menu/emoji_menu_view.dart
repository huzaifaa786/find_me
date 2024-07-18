// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:find_me/app/emoji_menu/components/coins_value.dart';
import 'package:find_me/app/emoji_menu/components/custom_scroll_bar.dart';
import 'package:find_me/app/emoji_menu/emoji_menu_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:find_me/utils/ui_utils.dart';
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
              appBar: AppBar(
                automaticallyImplyLeading: false,
                forceMaterialTransparency: true,
                toolbarHeight: 83.h,
                title: topBar(
                  name: "Emoji Menu",
                  showBackIcon: true,
                ),
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
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(9),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 14, left: 12),
                          child: SingleChildScrollView(
                              physics: PageScrollPhysics(),
                              child: SizedBox(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: Get.height,
                                      child: GridView.builder(
                                          itemCount: controller.Emojis.length,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            // mainAxisExtent: 0.02,
                                            // crossAxisSpacing: 0.02,
                                          ),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return GestureDetector(
                                              onTap: () {
                                                UiUtilites.emojisappear(
                                                  context,
                                                  "assets/images/cold_angry_emoji.png",
                                                );
                                              },
                                              child: Image.asset(
                                                controller.Emojis[index],
                                              ),
                                            );
                                          }),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 14, left: 16, right: 10),
                        height: 646.h,
                        width: 164.w,
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(9),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ]),
                        child: SingleChildScrollView(
                            physics: PageScrollPhysics(),
                            child: SizedBox(
                              height: Get.height,
                              child: GridView.builder(
                                  itemCount: controller.emojiWithValue.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                  ),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Column(
                                      children: [
                                        Image.asset(
                                          controller.emojiWithValue[index],
                                          height: 42.h,
                                          width: 42.w,
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
                                              "10",
                                              style: TextStyle(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  }),
                            )),
                      )
                    ],
                  ),
                ),
              )),
            ));
  }
}
