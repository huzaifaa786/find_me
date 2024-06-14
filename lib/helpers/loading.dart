import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoadingHelper {
  static bool absorbClick = false;
  // static var onChangeAbsorbClick;

  static show() {
    absorbClick = true;
    EasyLoading.show();
  }

  static dismiss() {
    absorbClick = false;
    EasyLoading.dismiss();
  }

  static init() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.circle
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 50.0
      ..radius = 10.0
      ..progressColor = AppColors.white
      ..backgroundColor = AppColors.transparent
      ..indicatorColor = AppColors.primary_color
      ..textColor = AppColors.primary_color
      ..maskColor = AppColors.primary_color.withOpacity(0.5)
      ..userInteractions = false
      ..dismissOnTap = false
      ..boxShadow = <BoxShadow>[];
  }
}
