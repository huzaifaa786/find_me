// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/box_decoration/box_decoration.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class PhoneInputField extends StatelessWidget {
  final ValueChanged<PhoneNumber?> onChanged;
  final String? errorText;
  final String? initialCode;
  final controller;
  final ValueChanged<Country> onCountryChanged;

  const PhoneInputField({
    super.key,
    required this.onChanged,
    required this.onCountryChanged,
    this.errorText,
    this.controller,
    this.initialCode,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: Get.width,
          height: 50.h,
          decoration: errorText!.isNotEmpty
              ? errorInputContainerDecoration
              : inputContainerDecoration,
          child: IntlPhoneField(
            controller: controller,
            initialCountryCode: initialCode,
            languageCode: "en",
            isValidation: false,
            dropdownIcon: Icon(
              Icons.arrow_drop_down_rounded,
              size: 24.h,
            ),
            dropdownIconPosition: IconPosition.trailing,
            flagsButtonMargin:
                EdgeInsets.only(left: 10.w, right: 10.w, top: 16.h, bottom: 8.h),
            dropdownDecoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                    color: AppColors.inputBorderColor.withOpacity(0.1),
                    width: 1.5.w),
              ),
            ),
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
            dropdownTextStyle: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
            flagsButtonPadding: EdgeInsets.only(top: 4.h),
            onCountryChanged: onCountryChanged,
            decoration: InputDecoration(
              fillColor: Colors.transparent,
              filled: true,
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(30.r),
              ),
              errorBorder: OutlineInputBorder(
                borderSide:
                     BorderSide(color: Colors.transparent, width: 0.5.w),
                borderRadius: BorderRadius.circular(30.r),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Colors.transparent, width: 0.5),
                borderRadius: BorderRadius.circular(30.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(30.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(30.r),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(30.r),
              ),
              errorStyle: const TextStyle(fontSize: 0),
              counterStyle: const TextStyle(fontSize: 0),
            ),
            onChanged: onChanged,
          ),
        ),
        if (errorText!.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(top: 4.h, left: 16.w, right: 16.w),
            child: AppText(
              title: errorText!,
              color: AppColors.red,
              size: 9.sp,
            ),
          )
      ],
    );
  }
}
