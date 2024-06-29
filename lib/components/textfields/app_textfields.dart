// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, use_super_parameters

import 'package:find_me/utils/box_decoration/box_decoration.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppTextFields extends StatelessWidget {
  const AppTextFields({
    Key? key,
    this.icon,
    this.controller,
    this.hintText,
    this.type,
    this.fieldValidator,
    this.onChanged,
    this.enabled,
    this.color = AppColors.black,
    this.height = 20.0,
    this.width = 20.0,
  }) : super(key: key);

  final icon;
  final double? width;
  final double? height;
  final controller;
  final hintText;
  final type;
  final fieldValidator;
  final ValueChanged<String>? onChanged;
  final bool? enabled;
  final color;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      autovalidateMode: fieldValidator == true
          ? AutovalidateMode.always
          : AutovalidateMode.onUserInteraction,
      style: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        prefixIcon: icon != null
            ? Padding(
                padding: EdgeInsets.only(left: 23.w),
                child: SvgPicture.asset(
                  icon!,
                  fit: BoxFit.scaleDown,
                  width: width,
                  height: height,
                  color: color,
                ),
              )
            : null,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors.hintGrey,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
        fillColor: AppColors.white,
        border: inputDecoration,
        enabledBorder: inputDecoration,
        focusedBorder: inputDecoration,
        errorBorder: inputErrorDecoration,
        focusedErrorBorder: inputErrorDecoration,
      ),
      enabled: enabled,
      validator: fieldValidator,
      onChanged: onChanged,
    );
  }
}
