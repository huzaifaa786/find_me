import 'package:find_me/app/languages/languages_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:get_storage/get_storage.dart';

class LanguagesController extends GetxController {
  static LanguagesController get instance => Get.find();

  String language = 'english';
  translateMethod? site;
  toggleplan(translateMethod value) {
    site = value;
    update();
  }

  @override
  void onInit() {
    GetStorage box = GetStorage();
    site = box.read('locale') != 'ar'
        ? translateMethod.English
        : translateMethod.Arabic;
    update();
    // language = site == translateMethod.English ? 'english' : 'Arabic';
    // update();
    super.onInit();
  }

  // int selectedLanguage = 0;

  // void changeLanguage(int index) {
  //   selectedLanguage = index;
  //   update();
  // }

  // // Method to get the color based on the selection state
  // Color getRadioColor(int value) {
  //   return value == selectedLanguage
  //       ? AppColors.primary_color
  //       : AppColors.primary_color;
  // }
}