import 'dart:async';
import 'dart:ffi';
import 'dart:math';

import 'package:find_me/api/auth_api/user_api.dart';
import 'package:find_me/components/cards/user_information_card.dart';
import 'package:find_me/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/helpers.dart';
import 'package:intl_phone_field/phone_number.dart';

class UserAccountController extends GetxController {
  static UserAccountController instance = Get.find();
  String? firstname;
  String? lastname;
  String? name;
  String? userName;
  String? Birthday;
  String? mobileNumber;
  String? email;
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
      firstname = userModel!.firstName;
      lastname = userModel!.lastName;
      name = userModel!.currentProfile!.name;
      userName = userModel!.currentProfile!.username;
      Birthday = userModel!.dob;
      mobileNumber = userModel!.phone;
      email = userModel!.email;
    }

    update();
  }
}
