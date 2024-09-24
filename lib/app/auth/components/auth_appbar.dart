import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/images/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

GetStorage? box = GetStorage();

AppBar authAppBar({String? name, color}) {
  return AppBar(
    automaticallyImplyLeading: false,
    forceMaterialTransparency: true,
    centerTitle: true,
    leadingWidth: 90,
    leading: GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Padding(
          padding: box!.read('locale') != 'ar'
              ? EdgeInsets.only(
                  left: 30.w,
                )
              : EdgeInsets.only(
                  right: 30.w,
                ),
          // padding: box!.read('locale') != 'ar'
          //     ? EdgeInsets.only(
          //         left: 30.w,
          //       )
          //     : EdgeInsets.only(
          //         right: 30.w,
          //       ),
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
    ),
    title: Padding(
      padding: const EdgeInsets.only(bottom: 9),
      child: AppText(
        title: name ?? '',
        size: 24.sp,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
