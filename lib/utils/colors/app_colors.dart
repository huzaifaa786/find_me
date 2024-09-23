// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:flutter/material.dart';

class AppColors {
  static const shadepurple = Color(0xFFF6D4FF);
  static const shadeblue = Color(0xFFD9E9FF);
  static const shadeLightCyan1 = Color(0xFFDEFBFF);
  static const shade_light_cyan2 = Color(0xFFF1FFF7);
  static const shadelightcyan3 = Color(0xFFFFFFFF);

  static const light_white = Color(0xFFF6F9FF);
  static const light_black = Color(0xFF3B3C15);
  static const dark_blue = Color(0xFF1270C7);
  static const primary_color = Color(0xFF0A6DFE);
  static const light_blue = Color(0xFFB8D9FE);
  static const lightly_blue = Color(0xFFA6D2FF);
  static const lightSkyBlue = Color(0xFF92C8FF);
  static const light_purple = Color(0xFFB478FF);
  static const orange = Color(0xFFFBA705);
  static const black = Color(0xFF000000);
  static const shadow_black = Color(0x66000000);
  static const white = Color(0xFFFFFFFF);
   static const cardColors = Color(4294967295);
  // static const Color primary_color = Color(0xFF6200EA);
  static const Color borderGreyLight = Color(0xFFBDBDBD);
  
  

  
  
  static const grey = Color(0xFFF3F3F3);
  static const profile_grey = Color(0xFFF5F5F5);
  static const border_grey = Color(0xFFE8E8E8);
  static const green = Color(0xFF00CD2D);
  static const light_grey = Color(0xFFB8B8B8);
  static Color Icon_grey = const Color(0xFF92C8FF).withOpacity(0.29);
  static const transparent = Colors.transparent;
  

  static const red = Color(0xFFFF0000);
  static const pink = Color(0xFFFF21E9);
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
  static Gradient notification_gradient = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      primary_color,
      light_purple,
    ],
  );
  static Gradient emojie_store_card_gradient = const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color(0xFF00FFFF),
      Color(0xFF0085FF),
    ],
  );
}
