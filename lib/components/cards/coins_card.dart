import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CardCoins extends StatelessWidget {
  const CardCoins({
    super.key,
    this.ontap,
    required this.bottomText,
    required this.img,
    required this.text,
    this.height,
    this.width,
    this.imageHeight,
    this.imageWidth,
    this.textSize,
    this.bottomTextSize,
    this.onTap,
  });
  final ontap;
  final String bottomText;
  final String img;
  final String text;
  final height;
  final width;
  final double? imageHeight;
  final double? imageWidth;
  final double? textSize;
  final double? bottomTextSize;
  final onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: width,
            height: height,
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(11.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(2, 2),
                ),
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(-2, -2),
                ),
              ],
            ),
            child: Column(
              children: [
                Image.asset(
                  img,
                  // 'assets/images/coin_icon.png',
                  height: imageHeight,
                  width: imageWidth,
              
                ),
                Text(
                  text,
                  //'1000 coins',
                  style: TextStyle(
                    fontSize: textSize ?? 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Gap(3),
          Text(
            bottomText,
            style: TextStyle(
                fontSize: bottomTextSize ?? 12.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primary_color),
          )
        ],
      ),
    );
  }
}
