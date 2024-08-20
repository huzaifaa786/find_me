import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:find_me/utils/images/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

GetStorage? box = GetStorage();
Widget topBar({
  String? name,
  bool showBackIcon = true,
  Color color = AppColors.black,
  padding = const EdgeInsets.only(left: 40, right: 40),
}) {
  return Padding(
    padding: padding,
    child: Row(
      children: [
        if (showBackIcon)
          GestureDetector(
              onTap: () {
                Get.back();
              },
              child: box!.read('locale') != 'ar'
                  ? SvgPicture.asset(
                      ImagesConst.backIcon,
                      height: 28.h,
                      width: 28.w,
                      fit: BoxFit.scaleDown,
                      color: color,
                    )
                  : SvgPicture.asset(
                      "assets/icons/back right.svg",
                      height: 28.h,
                      width: 28.w,
                      fit: BoxFit.scaleDown,
                      color: color,
                    )),
        if (showBackIcon) Gap(70.w) else Gap(98.w),
        AppText(
          title: name!,
          size: 16.sp,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ],
    ),
  );
}
