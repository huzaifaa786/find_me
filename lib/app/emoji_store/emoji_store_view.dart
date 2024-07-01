// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:find_me/app/emoji_store/components/emoji_store_card.dart';
import 'package:find_me/app/emoji_store/emoji_store_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class EmojiStoreView extends StatefulWidget {
  const EmojiStoreView({super.key});

  @override
  State<EmojiStoreView> createState() => _EmojiStoreViewState();
}

class _EmojiStoreViewState extends State<EmojiStoreView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmojiStoreController>(
        autoRemove: false,
        builder: (controller) => Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                forceMaterialTransparency: true,
                title: topBar(name: "Emoji store", showBackIcon: true),
              ),
              body: SafeArea(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 34.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        EmojiStoreCard(
                          icon: "assets/images/shopping_bags.png",
                          iconGap: 20,
                          iconHeight: 60.h,
                          iconWidth: 62.w,
                          padding: EdgeInsets.only(top: 18, bottom: 28),
                          title: "Emojis menu ",
                          subtitle: "Free & paid emojis.",
                          show: true,
                          onTap: () {
                            Get.toNamed(AppRoutes.edit_menu);
                          },
                        ),
                        EmojiStoreCard(
                          icon:
                              "assets/images/Social media love or heart emoji.png",
                          iconGap: 3.35,
                          padding: EdgeInsets.only(top: 8, bottom: 28),
                          iconHeight: 74.49.h,
                          iconWidth: 93.52.w,
                          title: "My emojis  ",
                          subtitle: "Favorites & purchased.",
                          show: true,
                          onTap: () {
                            Get.toNamed(AppRoutes.edit_menu);
                          },
                        ),
                      ],
                    ),
                    Gap(34),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        EmojiStoreCard(
                          containerHeight: 210.h,
                          containerWidth: 152.w,
                          padding: EdgeInsets.only(top: 29, bottom: 44),
                          icon: "assets/images/gift_box.png",
                          iconGap: 16,
                          title: "Gifted emojis ",
                          iconHeight: 64.0.h,
                          iconWidth: 64.0.w,
                          show: false,
                          onTap: () {
                            Get.toNamed(AppRoutes.edit_menu);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              )),
            ));
  }
}
