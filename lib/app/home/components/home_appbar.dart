// ignore_for_file: prefer_const_constructors

import 'package:find_me/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

Widget homeAppBar({String? name}) {
  return Padding(
    padding: EdgeInsets.only(left: 20.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: SvgPicture.asset(
              alignment: Alignment.center,
              "assets/icons/LogoHome.svg",
              height: 25.h,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.notifications);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'assets/icons/bell.svg',
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.setting);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'assets/icons/menu (2).svg',
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}
