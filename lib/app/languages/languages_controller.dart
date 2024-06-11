import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:find_me/utils/colors/app_colors.dart';

class LanguagesController extends GetxController {
  static LanguagesController get instance => Get.find();

  int selectedLanguage = 0;

  void changeLanguage(int index) {
    selectedLanguage = index;
    update();
  }

  // Method to get the color based on the selection state
  Color getRadioColor(int value) {
    return value == selectedLanguage ? AppColors.primary_color : AppColors.primary_color;
  }
}
