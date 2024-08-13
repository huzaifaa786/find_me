import 'package:find_me/api/auth_api/login_api.dart';
import 'package:find_me/api/auth_api/register_api.dart';
import 'package:find_me/models/user_model.dart';
import 'package:find_me/routes/app_routes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SignInController extends GetxController {
  static SignInController instance = Get.find();

  TextEditingController emailController = TextEditingController();

  //! Password And Confirm Password Variable and Functions
  bool obscureTextPassword = true;

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GetStorage box = GetStorage();

  UserModel? user;
  void toggle() {
    obscureTextPassword = !obscureTextPassword;
    update();
  }

  @override
  void dispose() {
    super.dispose();
  }

  loginUser() async {
    // final token = await FirebaseMessaging.instance.getToken();
    final token = null;

    Map<String, dynamic> response = await LoginApi.loginUser(
        password: passwordController.text,
        email: emailController.text,
        token: token);
    if (response.isNotEmpty) {
      if (response['user']['phone_verified'] == 1) {
        box.write('api_token', response['user']['token']);
        box.write('beacon_id', response['user']['beacon_id']);
        Get.offAllNamed(AppRoutes.mainview);
      } else {
        Get.offAllNamed(AppRoutes.mainview,
            arguments: response['user']['phone']);
      }
    }
  }

  final _authApi = RegisterApi();
  loginGoogleUser(name, email) async {
    var responce = await _authApi.googleLogin(name, email);
    return responce;
  }
}
