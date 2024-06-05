// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, deprecated_member_use

import 'package:find_me/utils/box_decoration/box_decoration.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PasswordTextFields extends StatelessWidget {
  const PasswordTextFields(
      {super.key,
      this.controller,
      this.hintText,
      this.obscure,
      this.toggle,
      this.fieldValidator,
      this.type,
      this.readOnly,
      this.autovalidateMode});

  final controller;
  final hintText;
  final type;
  final toggle;
  final obscure;
  final autovalidateMode;
  final readOnly;
  final FormFieldValidator<String>? fieldValidator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
      controller: controller,
      keyboardType: type,
      validator: fieldValidator,
      autovalidateMode: autovalidateMode ??
          (fieldValidator == true.obs
              ? AutovalidateMode.always
              : AutovalidateMode.onUserInteraction),
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
        suffixIcon: GestureDetector(
          onTap: () {
            toggle();
          },
          child: obscure
              ? SvgPicture.asset(
                  'assets/icons/eye-off.svg',
                  height: 24,
                  fit: BoxFit.scaleDown,
                  // color: darkblue,
                )
              : SvgPicture.asset(
                  'assets/icons/eye.svg',
                  height: 24,
                  fit: BoxFit.scaleDown,
                  // color: darkblue,
                ),
        ),
      ),
    );
  }
}
