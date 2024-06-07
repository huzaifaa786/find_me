// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

Widget homeAppBar({String? name}) {
  return Padding(
    padding: EdgeInsets.only(left: 45.w),
    child: Row(
      children: [
        GestureDetector(
            onTap: () {
              Get.back();
            },
            child: SvgPicture.asset(
              'assets/icons/find_me.svg',
              fit: BoxFit.scaleDown,
            )),
        Gap(153.w),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // notification.isNotEmpty?
            // SvgPicture.asset(
            //   'assets/icons/bell_alert.svg',
            //   fit: BoxFit.scaleDown,
            //   height: 32.h,
            // )
            //  :
            SvgPicture.asset(
              'assets/icons/bell.svg',
              fit: BoxFit.scaleDown,
            ),
            Gap(10),
            SvgPicture.asset(
              'assets/icons/menu (2).svg',
              fit: BoxFit.scaleDown,
            ),
          ],
        )
      ],
    ),
  );
}
