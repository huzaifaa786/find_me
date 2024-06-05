import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthRichText extends StatelessWidget {
  const AuthRichText({super.key, this.title, this.description, this.onTap});
  final String? title;
  final String? description;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$title ',
        style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
            fontFamily: 'Inter'),
        children: <TextSpan>[
          TextSpan(
            text: '$description',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.primary_color,
              fontFamily: 'Inter',
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
