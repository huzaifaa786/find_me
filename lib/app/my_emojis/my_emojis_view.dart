import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_me/app/my_emojis/my_emojis_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class MyEmojisView extends StatefulWidget {
  const MyEmojisView({super.key});

  @override
  State<MyEmojisView> createState() => _MyEmojisViewState();
}

class _MyEmojisViewState extends State<MyEmojisView> {
  String coins = "";
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyEmojisController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: topBar(
            name: "My Emojis",
            showBackIcon: true,
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 34.w),
              child: Column(
                children: [
                  Gap(35.h),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: AppText(
                      title: "Favorites",
                      fontWeight: FontWeight.w600,
                      size: 16,
                    ),
                  ),
                  Gap(20),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: controller.allEmojis.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          controller.allEmojis[index].type == "free"
                              ? CachedNetworkImage(
                                  imageUrl: controller.allEmojis[index].image,
                                  width: 52.w,
                                  height: 45.h,
                                )
                              : Column(
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl:
                                          controller.allEmojis[index].image,
                                      width: 52.w,
                                      height: 45.h,
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
                                          controller.allEmojis[index].coins
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
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
