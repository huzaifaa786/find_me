import 'package:find_me/api/coin_api.dart/coin_api.dart';
import 'package:find_me/models/coin_package_model.dart';
import 'package:find_me/models/user_model.dart';
import 'package:find_me/services/payment_service.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/helpers.dart';
import 'package:intl_phone_field/phone_number.dart';

class PurchaseCoinsController extends GetxController {
  static PurchaseCoinsController instance = Get.find();
  final paymentService = PaymentService();

  UserModel? userModel;
  CoinPackageModel? coinPackageModel;
  @override
  void onInit() {
    userModel ??= Get.arguments[0];
    coinPackageModel ??= Get.arguments[1];
    super.onInit();
  }

  buyCoins() async {
    bool paymentSuccess =
        await paymentService.makePayment(coinPackageModel!.price!.toDouble());
    if (paymentSuccess) {
      var response =
          await CoinApi.buyCoinPackages(packageId: coinPackageModel!.id);
      if (response.isNotEmpty) {
        UiUtilites.coinsAlert(Get.context, coinPackageModel!.coins!.toString());
      }
    }
  }
}
