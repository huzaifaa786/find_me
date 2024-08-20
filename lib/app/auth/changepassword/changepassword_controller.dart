import 'package:find_me/api/auth_api/changepassword_api.dart';
import 'package:find_me/utils/ui_utils.dart';
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

  changepassword() async {
    Map<String, dynamic> response = await ChangepasswordApi.Changepassword(
      password: oldpasswordController.text,
      new_password: passwordController.text,
    );
    update();
    if (response.isNotEmpty) {
     

      // UiUtilites.successSnackbar('Password change successfully.', 'Success');
      UiUtilites.registerSuccessAlert(Get.context, "Password Change Successfully".tr);
      oldpasswordController.clear();
      passwordController.clear();
      confirmPasswordController.clear();
      update();
    } else {
     
      UiUtilites.errorSnackbar('Could Not Update Password'.tr, 'Error!'.tr);
    }
  }
}
