import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/images/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

Widget topBar({String? name, bool showBackIcon = true}) {
  return Padding(
    padding: EdgeInsets.only(left: 40.w, right: 40.w),
    child: Row(
      children: [
        if (showBackIcon)
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: SvgPicture.asset(
              ImagesConst.backIcon,
              height: 28.h,
              width: 28.w,
              fit: BoxFit.scaleDown,
            ),
          ),
        if (showBackIcon) Gap(70.w) else Gap(98.w),
        AppText(
          title: name!,
          size: 16.sp,
          fontWeight: FontWeight.w600,
        ),
      ],
    ),
  );
}
