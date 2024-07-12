import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//! APP Button Decoration DECORATION
BoxDecoration buttonDecoration(Color color, Color borderColor) {
  return BoxDecoration(
    border: Border.all(
      color: borderColor,
    ),
    color: color,
    borderRadius: BorderRadius.circular(30.r),
  );
}

//! INPUT CONTAINER DECORATION

//! INPUT CONTAINER DECORATION
var inputContainerDecoration = BoxDecoration(
  border: Border.all(color: AppColors.inputBorderColor),
  borderRadius: BorderRadius.circular(45.r),
);

var errorInputContainerDecoration = BoxDecoration(
  border: Border.all(color: AppColors.red),
  borderRadius: BorderRadius.circular(45.r),
);

//! INPUT OUTLINED DEOCRATION
var inputDecoration = OutlineInputBorder(
  borderRadius: BorderRadius.circular(45.r),
  borderSide: BorderSide(width: 1, color: AppColors.inputBorderColor),
);
var bioInputDecoration = OutlineInputBorder(
  borderRadius: BorderRadius.circular(45.r),
  borderSide: BorderSide(width: 1, color: AppColors.primary_color),
);

var inputErrorDecoration = OutlineInputBorder(
  borderRadius: BorderRadius.circular(45.r),
  borderSide: const BorderSide(width: 1, color: AppColors.red),
);

//! INPUT OUTLINED DEOCRATION
var roundedInputDecoration = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8.r),
  borderSide: BorderSide(width: 1, color: AppColors.inputBorderColor),
);

var roundedInputErrorDecoration = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8.r),
  borderSide: const BorderSide(width: 1, color: AppColors.red),
);