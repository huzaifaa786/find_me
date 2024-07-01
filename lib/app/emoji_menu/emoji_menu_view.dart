// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:find_me/app/emoji_menu/emoji_menu_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              backgroundColor: AppColors.white,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                forceMaterialTransparency: true,
                title: topBar(
                    name: "Emoji Menu",
                    showBackIcon: true,
                    color: AppColors.white),
              ),
              body: SafeArea(
                  child: SingleChildScrollView(
                      child: Padding(
                // padding: EdgeInsets.symmetric(horizontal: 34.w),
                child: Column(
                  children: [
                    Container(
                      height: Get.height * 20.0,
                      decoration: BoxDecoration(color: AppColors.light_black),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text("usama"),
                            ],
                          ),
                          Column(
                            children: [
                              Text("usama"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: Get.height * 40.0,
                      decoration: BoxDecoration(color: AppColors.light_black),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text("usama"),
                              Text("usama"),
                              Text("usama"),
                              Text("usama"),
                              Text("usama"),
                              Text("usama"),
                              Text("usama"),
                            ],
                          ),
                          Column(
                            children: [
                              Text("usama"),
                              Text("usama"),
                              Text("usama"),
                              Text("usama"),
                              Text("usama"),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ))),
            ));
  }
}
