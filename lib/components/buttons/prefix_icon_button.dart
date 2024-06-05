import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/box_decoration/box_decoration.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:find_me/utils/images/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class PrefixIconButton extends StatelessWidget {
  const PrefixIconButton({
    super.key,
    required this.height,
    required this.width,
    this.color = AppColors.white,
    this.textColors = AppColors.black,
    this.onTap,
    this.image = ImagesConst.googleIcon,
    this.borderColor = AppColors.primary_color,
    required this.title,
  });

  final double height;
  final double width;
  final Color color;
  final Color textColors;
  final Function()? onTap;
  final String? image;
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(image!),
            Gap(8.w),
            AppText(
              title: '$title',
              color: textColors,
              size: 13.sp,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
