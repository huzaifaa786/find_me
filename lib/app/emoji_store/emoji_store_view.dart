// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:find_me/app/emoji_store/components/emoji_store_card.dart';
import 'package:find_me/app/emoji_store/emoji_store_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/helpers/subscription_manager.dart';
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
                title: topBar(
                  name: "Emojis".tr,
                  showBackIcon: false,
                ),
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
                        Flexible(
                          child: EmojiStoreCard(
                            icon: "assets/images/allemojis.png",
                            iconGap: 8.h,
                            iconHeight: 48,
                            iconWidth: 96,
                            padding: EdgeInsets.only(top: 18, bottom: 10),
                            title: "Emojis for All".tr,
                            subtitle: "",
                            show: true,
                            onTap: () {
                              Get.toNamed(AppRoutes.edit_menu,arguments: "free");
                            },
                          ),
                        ),
                        Flexible(
                          child: EmojiStoreCard( 
                            icon:"assets/images/picks.png",
                            iconGap: 3,
                            padding: EdgeInsets.only(top: 8, bottom: 28),
                            iconHeight: 68,
                            iconWidth: 68,
                            title: "findme Picks".tr,
                            subtitle: "",
                            show: false,
                            onTap: () {
                              Get.toNamed(AppRoutes.edit_menu,arguments: "paid");
                            },
                          ),
                        ),
                      ],
                    ),
                    Gap(34),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: EmojiStoreCard(
                            icon:"assets/images/Emoji.png",
                            iconGap: 10,
                            padding: EdgeInsets.only(top: 8, bottom: 20),
                            iconHeight: 68,
                            iconWidth: 68,
                            title: "Gifted emojis".tr,
                            subtitle: "",
                            show: false,
                            onTap: () {
                              Get.toNamed(AppRoutes.gifted_emoji);
                            },
                          ),
                        ),
                        Flexible(
                          child: EmojiStoreCard(
                            icon:"assets/images/myemojis.png",
                            iconGap: 0,
                            padding: EdgeInsets.only(),
                            iconHeight: 80,
                            iconWidth: 80,
                            title: "My emojis \n& Picks".tr,
                            subtitle: "",
                            show: false,
                            onTap: () {
                              Get.toNamed(AppRoutes.my_emojis);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
            ));
  }
}
