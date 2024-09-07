import 'dart:async';
import 'package:find_me/api/auth_api/user_api.dart';
import 'package:find_me/models/user_model.dart';
import 'package:find_me/routes/app_routes.dart';
import 'package:get/get.dart';

class UserAccountController extends GetxController {
  static UserAccountController instance = Get.find();

  UserModel? userModel;
  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  Future getUser() async {
    var response = await UserApi.getUser();
    if (response.isNotEmpty) {
      userModel = UserModel.fromJson(response['user']);
    }

    update();
  }

  void deleteAccount() async {
    var response = await UserApi.accountDelete();
    if (response.isNotEmpty) {
      Get.offAllNamed(AppRoutes.intro);
    }
  }
}
