import 'dart:convert';
import 'dart:io';

import 'package:find_me/api/report_api/report_api.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ReportController extends GetxController {
  static ReportController instanse = Get.find();
  TextEditingController descriptionController = TextEditingController();
  final List<String> reportOptions = [
    'I think my account was compromised',
    'I can\'t access my account',
    'I want to report an account or \n content',
    'I lost my account',
    'I found a bug',
    'I need help with a feature',
    'I want to report intellectual property \n infringement',
    'I have a privacy or European Digital \n Services Act related question',
    'I want to deactivate or delete my \n account',
  ];
  String? selectedOption;
  @override
  void onInit() {
    selectedOption = reportOptions.first;
    super.onInit();
  }

  var selectedImagePath = '';
  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImagePath = pickedFile.path;
      update();
      UiUtilites.successSnackbar(
          'Image selected successfully'.tr, 'Success'.tr);
    } else {
      UiUtilites.errorSnackbar('No image selected'.tr, 'Error'.tr);
    }
  }

  Future<String> _convertImageToBase64(String imagePath) async {
    final bytes = await File(imagePath).readAsBytes();
    return base64Encode(bytes);
  }

  Future<void> reportProblem({String? userId}) async {
    if (descriptionController.text.isEmpty && selectedImagePath.isEmpty) {
      UiUtilites.errorSnackbar(
          'Please provide a description or select an image'.tr, 'Error'.tr);
      return;
    }
    String base64Image = '';
    if (selectedImagePath.isNotEmpty) {
      base64Image = await _convertImageToBase64(selectedImagePath);
    }
    var response = await ReportApi.ReportProblem(
      type: selectedOption,
      image: base64Image.isNotEmpty ? base64Image : null,
      desc: descriptionController.text.isNotEmpty
          ? descriptionController.text
          : null,
      user_id: userId,
    );
    if (response.isNotEmpty) {
      UiUtilites.registerSuccessAlert(Get.context,
          "Thank you for your feedback.your\n report has been submitted");
      clearFields();
    } else {
      UiUtilites.errorSnackbar('Could not report the problem'.tr, 'Error!'.tr);
    }
  }

  void clearFields() {
    selectedImagePath = '';
    selectedOption = reportOptions.first;
    descriptionController.clear();
    update();
  }
}
