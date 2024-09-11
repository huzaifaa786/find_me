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

Widget profileTopBar({
  String? name,
  bool showBackIcon = true,
  Color color = AppColors.black,
  padding = const EdgeInsets.only(
    left: 20,
  ),
  required VoidCallback blockAction,
  required VoidCallback reportAction,
}) {
  return Padding(
    padding: padding,
    child: Row(
      mainAxisAlignment: MainAxisAlignment
          .spaceBetween, // Aligns items with space between them
      children: [
        // Back Icon
        Row(
          children: [
            if (showBackIcon)
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
                      ),
              ),
          ],
        ),

        // Three-dotted menu
        PopupMenuButton<int>(
          icon: Icon(Icons.more_vert, color: color, size: 28.w),
          padding: EdgeInsets.only(bottom: 4), // Three-dotted icon
          onSelected: (value) {
            if (value == 0) {
              blockAction();
            } else if (value == 1) {
              reportAction();
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 0,
              child: Text('Block'),
            ),
            PopupMenuItem(
              value: 1,
              child: Text('Report'),
            ),
          ],
        ),
      ],
    ),
  );
}
