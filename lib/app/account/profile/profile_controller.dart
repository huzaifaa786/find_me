import 'package:find_me/api/auth_api.dart/user_api.dart';
import 'package:find_me/models/user_model.dart';
import 'package:find_me/models/user_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/helpers.dart';
import 'package:intl_phone_field/phone_number.dart';

class ProfileController extends GetxController {
  static ProfileController instance = Get.find();
  UserModel? userModel;
  UserProfileModel? profile;
  

  @override
  void onInit() {
    getUser();

    super.onInit();
  }

  getUser() async {
    var response = await UserApi.getUser();
    if (response.isNotEmpty) {
      userModel = UserModel.fromJson(response['user']);
      profile = userModel!.currentProfile;
      update();
    }
  }
}
