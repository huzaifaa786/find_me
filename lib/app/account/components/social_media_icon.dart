// ignore_for_file: prefer_const_constructors

import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SocialMediaIcon extends StatelessWidget {
  const SocialMediaIcon(
      {super.key, this.socialMediaIcon, this.isEmpty = false, this.ontap});
  final socialMediaIcon;
  final bool isEmpty;
  final ontap;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          height: 50.h,
          width: 50.w,
          margin: EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isEmpty ? AppColors.lightSkyBlue.withOpacity(0.4) : AppColors.lightSkyBlue,
          ),
          child: Center(
            child: SvgPicture.asset(
              socialMediaIcon,
             
              color:
                  isEmpty ? AppColors.black.withOpacity(0.4) : AppColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
