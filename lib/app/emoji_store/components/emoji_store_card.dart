// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class EmojiStoreCard extends StatelessWidget {
  const EmojiStoreCard(
      {super.key,
      this.icon,
      this.subtitle,
      this.title,
      this.show,
      this.containerHeight = 162,
      this.containerWidth = 142,
      this.iconHeight,
      required this.iconGap,
      this.padding,
      this.onTap,
      this.iconWidth});
  final String? icon;
  final Function()? onTap;
  final double? iconHeight;
  final double? iconWidth;
  final double containerHeight;
  final double containerWidth;
  final double iconGap;
  final EdgeInsets? padding;
  final String? title;
  final String? subtitle;
  final bool? show;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
         
          width: containerWidth,
          height: containerHeight,
          decoration: BoxDecoration(
              border: GradientBoxBorder(
                  gradient: AppColors.emojie_store_card_gradient),
              borderRadius: BorderRadius.circular(16.r)),
          child: Padding(
            padding: padding!,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  icon!,
                  height: iconHeight,
                  width: iconWidth,
                ),
                Gap(iconGap),
                Text(
                  title.toString(),
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                Gap(4.h),
                if (show == true)
                  Text(
                    subtitle.toString(),
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                    
                  ),
                // Gap(cardBottomGap),
              ],
            ),
          )),
    );
  }
}
