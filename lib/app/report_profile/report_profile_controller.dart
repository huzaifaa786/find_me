import 'dart:convert';
import 'dart:io';

import 'package:find_me/api/block_report_api/block_report_api.dart';
import 'package:find_me/api/report_api/report_api.dart';
import 'package:find_me/models/user_profile_model.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ReportProfileController extends GetxController {
  static ReportProfileController instanse = Get.find();
  final List<String> reportOptions = [
    'Spam',
    'Inappropriate content',
    'Harassment',
    'Fake profile',
    'Other'
  ];
  String? selectedOption;
  @override
  UserProfileModel? profile;
  void onInit() {
    profile ??= Get.arguments;
    super.onInit();
  }

  Future<void> reportProblem() async {
    if (selectedOption == null) {
      UiUtilites.errorSnackbar("", 'Please select a reason of reporting'.tr);
      return;
    }
    var response =
        await BlockReportApi.reportProfile(profile?.id, selectedOption!);
    if (response.isNotEmpty) {
      UiUtilites.registerSuccessAlert(Get.context,
          "Thank you for your feedback.Your\n report has been submitted");
    }
  }
}
