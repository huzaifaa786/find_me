import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/images/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

AppBar authAppBar({String? name}) {
  return AppBar(
    automaticallyImplyLeading: false,
    forceMaterialTransparency: true,
    leading: GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Padding(
        padding: EdgeInsets.only(left: 30.w),
        child: SvgPicture.asset(
          ImagesConst.backIcon,
          height: 28.h,
          width: 28.w,
          fit: BoxFit.scaleDown,
        ),
      ),
    ),
    title: AppText(
      title: name ?? '',
      size: 24.sp,
      fontWeight: FontWeight.w600,
    ),
    titleSpacing: 15,
  );
}
