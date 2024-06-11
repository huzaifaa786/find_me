import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePaswordController extends GetxController {
  static ChangePaswordController instance = Get.find();
  TextEditingController emailController = TextEditingController();
  bool obscureTextPassword = true;
  bool obscureTextCPassword = true;
  bool obscureTextOldPassword = true;

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
}
