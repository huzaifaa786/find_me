import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/box_decoration/box_decoration.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class EditButton extends StatelessWidget {
  const EditButton({
    super.key,
    this.color = AppColors.buttonGrey,
    this.textColors = AppColors.primary_color,
    this.onTap,
    this.borderColor = AppColors.buttonGrey,
    this.height = 50,
    this.width = 50,
    this.padding = const EdgeInsets.only(top: 4, bottom: 4, left: 11, right: 11),
    required this.title,
  });

  final Color color;
  final Color textColors;
  final Function()? onTap;
  final Color borderColor;
  final String? title;
  final double height;
  final double width;
  final padding;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(5.r),
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: padding,
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
          ),
          color: color,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/icons/edit_pencil.svg",
              height: 20.h,
              width: 20.w,
            ),
            AppText(
              title: '$title',
              color: textColors,
              size: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
