// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_me/components/appbars/home_appbar.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'home_controller.dart'; // Ensure this path is correct

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = HomeController.instance;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        title: homeAppBar(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Gap(35.h),
              Row(
                children: [
                  Obx(() {
                    return Container(
                      height: 77,
                      width: 77,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x66000000), // #00000040 with 40 being the alpha value in hexadecimal
                            blurRadius: 1.2,
                            spreadRadius: 0,
                            offset: Offset(0, 0),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(40.r),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            controller.selectedItem.value.avatarUrl,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }),
                  Gap(15.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() {
                        return DropdownButton<DropdownItem>(
                          iconEnabledColor: AppColors.primary_color,
                          icon: SvgPicture.asset('assets/icons/arrow_down.svg'),
                          iconDisabledColor: AppColors.primary_color,
                          iconSize: 20,
                          hint: AppText(
                            title: "Appears as",
                            color: AppColors.primary_color,
                            size: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          borderRadius: BorderRadius.circular(20.r),
                          items: controller.dropdownItems.map((item) {
                            return DropdownMenuItem<DropdownItem>(
                              value: item,
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: CachedNetworkImageProvider(item.avatarUrl),
                                    radius: 15,
                                  ),
                                  Gap(10.w),
                                  Text(item.text),
                                  Gap(5.w),
                                  if (item.verified)
                                    SvgPicture.asset('assets/icons/verified.svg'),
                                ],
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            if (value != null) {
                              controller.selectItem(value);
                            }
                          },
                        );
                      }),
                      Gap(13),
                      Obx(() {
                        return Row(
                          children: [
                            AppText(
                              title: controller.selectedItem.value.text,
                              size: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            Gap(15),
                            if (controller.selectedItem.value.verified)
                              SvgPicture.asset('assets/icons/verified.svg')
                          ],
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
