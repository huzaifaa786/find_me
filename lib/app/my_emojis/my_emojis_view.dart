// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:find_me/app/my_emojis/my_emojis_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                          padding: EdgeInsets.symmetric(horizontal: 40.w),
                          child: Column(
                            children: [
                              Gap(35.h),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: AppText(
                                  title: "Favorites",
                                  fontWeight: FontWeight.w600,
                                  size: 16,
                                ),
                              ),
                              SizedBox(
                                height: Get.height,
                                child: GridView.builder(
                                    itemCount: controller.Emojis.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 5,
                                      // mainAxisExtent: 0.02,
                                      // crossAxisSpacing: 0.02,
                                    ),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GestureDetector(
                                        onTap: () {},
                                        child: Image.asset(
                                          controller.Emojis[index],
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          )))),
            ));
  }
}
