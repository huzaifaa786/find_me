// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:flutter/material.dart';

class AppColors {
  static const primary_color = Color(0xFF148EFF);
  static const orange = Color(0xFFFBA705);
  static const black = Color(0xFF000000);
  static const white = Color(0xFFFFFFFF);
  static const green = Color(0xFF00CD2D);
  static const light_grey = Color(0xFFB8B8B8);
  static const red = Color(0xFFFF0000);
  static const hintGrey = Color(0xFF8F8F8F);
  static Color borderGrey = const Color(0xFF000000).withOpacity(0.31);
  static Color inputBorderColor = const Color(0xFF000000).withOpacity(0.13);

  static Gradient LOGINSCREEN_GRADIENT = const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color(0xff2412A9),
      Color(0XFFFFFFFF),
    ],
  );
}