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
  double fontSize = 20,
  double gapIcon = 70,
  double gap = 20,
  padding = const EdgeInsets.only(left: 20, right: 20),
}) {
  return Padding(
    padding: padding,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        showBackIcon?
          GestureDetector(
              onTap: () {
                Get.back();
              },
              child: box!.read('locale') != 'ar'
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        ImagesConst.backIcon,
                        height: 28.h,
                        width: 28.w,
                        fit: BoxFit.scaleDown,
                        color: color,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        "assets/icons/back right.svg",
                        height: 28.h,
                        width: 28.w,
                        fit: BoxFit.scaleDown,
                        color: color,
                      ),
                    )):Text(""),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0, right: 20),
          child: AppText(
            title: name!,
            size: fontSize.sp,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
        Text("")
      ],
    ),
  );
}
