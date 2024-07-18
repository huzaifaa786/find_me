import 'package:find_me/models/coin_package_model.dart';
import 'package:find_me/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/helpers.dart';
import 'package:intl_phone_field/phone_number.dart';

class PurchaseCoinsController extends GetxController {
  static PurchaseCoinsController instance = Get.find();

  UserModel? userModel;
  CoinPackageModel? coinPackageModel;
  @override
  void onInit() {
    userModel ??= Get.arguments[0];
    coinPackageModel ??= Get.arguments[1];
    super.onInit();
  }

  
}
