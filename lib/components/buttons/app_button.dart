import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/box_decoration/box_decoration.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.height,
    required this.width,
    this.color = AppColors.primary_color,
    this.textColors = AppColors.white,
    this.onTap,
    this.borderColor = AppColors.primary_color,
    required this.title,
  });

  final double height;
  final double width;
  final Color color;
  final Color textColors;
  final Function()? onTap;
  final Color borderColor;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30.r),
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: buttonDecoration(color, borderColor),
        child: Center(
          child: AppText(
            title: '$title',
            color: textColors,
            size: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
