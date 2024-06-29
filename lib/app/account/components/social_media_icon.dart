// ignore_for_file: prefer_const_constructors

import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SocialMediaIcon extends StatelessWidget {
  const SocialMediaIcon({super.key, this.socialMediaIcon});
  final socialMediaIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      width: 45.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.lightSkyBlue,
      ),
      child: Center(
        child: SvgPicture.asset(
          socialMediaIcon,
          height: 22.h,
          width: 22.h,
          color: AppColors.black,
        ),
      ),
    );
  }
}
