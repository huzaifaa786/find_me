import 'package:find_me/utils/colors/app_colors.dart';
import 'package:find_me/utils/images/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GifButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool showOpacity;

  const GifButton({super.key, required this.onTap, required this.showOpacity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            height: 130.h,
            width: 130.w,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.5,
                color: AppColors.black,
              ),
              borderRadius: BorderRadius.circular(100.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.r),
              child: Image.asset(
                ImagesConst.introGif,
                height: 131.h,
                width: 131.w,
                fit: BoxFit.cover,
              ),
            ),
          ),
          if (showOpacity)
            Container(
              height: 131.h,
              width: 131.w,
              decoration: BoxDecoration(
                color: AppColors.primary_color.withOpacity(0.4),
                borderRadius: BorderRadius.circular(100.r),
                border: Border.all(
                  width: 1.5,
                  color: AppColors.primary_color,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
