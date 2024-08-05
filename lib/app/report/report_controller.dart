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

  var selectedImagePath = '';
  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImagePath = pickedFile.path;
      update();
      UiUtilites.successSnackbar('Image selected successfully', 'Success');
    } else {
      UiUtilites.errorSnackbar('No image selected', 'Error');
    }
  }

  Future<String> _convertImageToBase64(String imagePath) async {
    final bytes = await File(imagePath).readAsBytes();
    return base64Encode(bytes);
  }

  Future<void> reportProblem({String? userId}) async {
    if (descriptionController.text.isEmpty && selectedImagePath.isEmpty) {
      UiUtilites.errorSnackbar(
          'Please provide a description or select an image', 'Error');
      return;
    }
    String base64Image = '';
    if (selectedImagePath.isNotEmpty) {
      base64Image = await _convertImageToBase64(selectedImagePath);
    }
    var response = await ReportApi.ReportProblem(
      image: base64Image.isNotEmpty ? base64Image : null,
      desc: descriptionController.text.isNotEmpty
          ? descriptionController.text
          : null,
      user_id: userId,
    );
    if (response.isNotEmpty) {
      UiUtilites.registerSuccessAlert(
          Get.context, "Report the problem Successfully");
    } else {
      UiUtilites.errorSnackbar('Could not report the problem', 'Error!');
    }
  }
}
