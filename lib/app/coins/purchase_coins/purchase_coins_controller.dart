import 'dart:developer';

import 'package:find_me/api/coin_api.dart/coin_api.dart';
import 'package:find_me/components/helper/loading.dart';
import 'package:find_me/models/coin_package_model.dart';
import 'package:find_me/models/user_model.dart';
import 'package:find_me/services/payment_service.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/helpers.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class PurchaseCoinsController extends GetxController {
  static PurchaseCoinsController instance = Get.find();
  final paymentService = PaymentService();

  UserModel? userModel;
  Package? coinPackageModel;
  @override
  void onInit() {
    userModel ??= Get.arguments[0];
    coinPackageModel ??= Get.arguments[1];
    super.onInit();
  }

  Future<void> buyCoins(BuildContext context, Package product) async {
    try {
      CustomerInfo customerInfo = await Purchases.purchasePackage(product);
      LoadingHelper.show();
      Map<String, int> coinPackages = {
        'coins_1000': 1000,
        'coins_1400': 1400,
        'coins_8000': 8000,
        'coins_400': 400,
        'coins_2000': 2000,
        'coins_600': 600,
      };

      if (coinPackages.containsKey(product.identifier)) {
        int coinsToAdd = coinPackages[product.identifier]!;
        LoadingHelper.dismiss();
        var response = await CoinApi.buyCoinPackages(coins: coinsToAdd);
        if (response.isNotEmpty) {
          FirebaseAnalytics.instance.logEvent(
            name: 'purchased_coins',
            parameters: <String, Object>{
              'coins': coinsToAdd,
            },
          );
          UiUtilites.coinsAlert(Get.context, coinsToAdd.toString());
        }
      } else {
        LoadingHelper.dismiss();
      }
    } on PlatformException catch (e) {
      LoadingHelper.dismiss();
      log(e.toString());
    }
  }
}
