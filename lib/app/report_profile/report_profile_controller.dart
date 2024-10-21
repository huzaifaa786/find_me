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
  TextEditingController descriptionController = TextEditingController();

  final List<String> reportOptions = [
    'Pretending to be someone else',
    'Bullying or harassment',
    'Nudity or sexual content',
    'Threats or violence',
    'Hate speech or extremism',
    'Drugs or illegal items',
    'Suicide or self-harm',
    'Scam or fraud',
    'False information',
    'Intellectual property violation',
    'Other',
  ];
  String? selectedOption;

  @override
  UserProfileModel? profile;
  void onInit() {
    profile ??= Get.arguments;
    selectedOption = reportOptions.first;
    super.onInit();
  }

  Future<void> reportProblem() async {
    if (selectedOption == null) {
      UiUtilites.errorSnackbar("", 'Please select a reason of reporting'.tr);
      return;
    }
    var response =
        await BlockReportApi.reportProfile(profile?.id, selectedOption!,descriptionController.text);
    if (response.isNotEmpty) {
      UiUtilites.registerSuccessAlert(Get.context,
          "Thank you for your feedback.Your\n report has been submitted".tr);
    }
  }
}
