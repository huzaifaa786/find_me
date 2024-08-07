// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, use_super_parameters

import 'package:find_me/utils/box_decoration/box_decoration.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmallTextFields extends StatelessWidget {
  const SmallTextFields({
    Key? key,
    this.controller,
    this.hintText,
    this.type,
    this.fieldValidator,
    this.onChanged,
    this.enabled,
  }) : super(key: key);

  final controller;
  final hintText;
  final type;
  final fieldValidator;
  final ValueChanged<String>? onChanged;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 56.0, right: 160.0),
      child: TextFormField(
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
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.hintGrey,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
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
      ),
    );
  }
}
