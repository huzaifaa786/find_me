import 'package:find_me/api/auth_api.dart/new_password_api.dart';
import 'package:find_me/routes/app_routes.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewPasswordController extends GetxController {
  static NewPasswordController instance = Get.find();
  String? type;
  String? phone;
  String? email;

  var newPasswordValue = false;
  bool obscureTextPassword = true;
  bool obscureTextCPassword = true;
  bool obscureTextOldPassword = true;
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    type = Get.arguments['type'];
    phone = Get.arguments['phone'];
    email = Get.arguments['email'];
    print(type);
    print(phone);
    print(email);
  }

  void newtoggle() {
    obscureTextPassword = !obscureTextPassword;
    update();
  }

  void confirmtoggle() {
    obscureTextCPassword = !obscureTextCPassword;
    update();
  }

  updatepassword() async {
    print(type);
    print(email);
    print(phone);
    print(passwordController);
    print("usaannnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn");

    var response = await NewPasswordApi.NewPassword(
        type: type,
        email: email,
        phone: phone,
        password: passwordController.text);
    if (response.isNotEmpty) {
      Get.offAllNamed(
        AppRoutes.signin,
      );
      newPasswordValue = true;
      UiUtilites.successSnackbar(
          'password updated successfully'.tr, 'Success!'.tr);
    } else {
      newPasswordValue = false;
      UiUtilites.errorSnackbar('could not update password'.tr, 'Error!'.tr);
    }
  }
}
