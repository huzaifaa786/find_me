import 'package:find_me/api/auth_api.dart/change_email_api.dart';
import 'package:find_me/routes/app_routes.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeEmailController extends GetxController {
  static ChangeEmailController instance = Get.find();
  TextEditingController emailController = TextEditingController();

  void updateEmail() async {
    if (emailController.text.isNotEmpty) {
      var response = await ChangeEmailApi.changeEmail(emailController.text);
      if (response.isNotEmpty) {
        UiUtilites.successSnackbar("Otp sent successfully", "");
        Get.toNamed(AppRoutes.email_otp, arguments: emailController.text);
      }
    } else {
      UiUtilites.errorSnackbar("", "Email can't be empty");
    }
  }
}
