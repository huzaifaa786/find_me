import 'dart:async';

import 'package:find_me/api/auth_api.dart/changepassword_api.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePaswordController extends GetxController {
  static ChangePaswordController instance = Get.find();
  TextEditingController emailController = TextEditingController();
  bool obscureTextPassword = true;
  bool obscureTextCPassword = true;
  bool obscureTextOldPassword = true;
  var changePasswordText = false;

  TextEditingController passwordController = TextEditingController();
  TextEditingController oldpasswordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  void toggle() {
    obscureTextPassword = !obscureTextPassword;
    update();
  }

  void ctoggle() {
    obscureTextCPassword = !obscureTextCPassword;
    update();
  }

  oldtoggle() {
    obscureTextOldPassword = !obscureTextOldPassword;
    update();
  }

  changepassword() async {
    Map<String, dynamic> response = await ChangepasswordApi.Changepassword(
      password: oldpasswordController.text,
      new_password: passwordController.text,
    );
    update();
    if (response.isNotEmpty) {
      Timer(Duration(seconds: 5), () {
        changePasswordText = false;
      });
      UiUtilites.successSnackbar('Password change successfully.', 'Success');
      oldpasswordController.clear();
      passwordController.clear();
      confirmPasswordController.clear();
      update();
    } else {
      changePasswordText = false;
      UiUtilites.errorSnackbar('could not update password'.tr, 'Error!'.tr);
    }
  }
}
