import 'package:find_me/utils/colors/app_colors.dart';
import 'package:find_me/utils/images/images.dart';
import 'package:flutter/material.dart';


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
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.5,
                color: AppColors.black,
              ),
              borderRadius: BorderRadius.circular(65),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(65),
              child: Image.asset(
                ImagesConst.introGif,
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
          ),
          if (showOpacity)
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: AppColors.primary_color.withOpacity(0.4),
                borderRadius: BorderRadius.circular(60),
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
