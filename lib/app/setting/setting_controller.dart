import 'package:find_me/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingController extends GetxController {
  static SettingController instance = Get.find();
  launchWebUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      UiUtilites.errorSnackbar("", "Invalid Url");
    }
  }
}
