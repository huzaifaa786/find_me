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
            height: 131.h,
            width: 131.w,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.5,
                color: AppColors.black,
              ),
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.r),
              child: Image.asset(
                ImagesConst.introGif,
                height: 131.h,
                width: 131.w,
              ),
            ),
          ),
          if (showOpacity)
            Container(
              height: 131.h,
              width: 131.w,
              decoration: BoxDecoration(
                color: AppColors.primary_color.withOpacity(0.4),
                shape: BoxShape.circle,
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
