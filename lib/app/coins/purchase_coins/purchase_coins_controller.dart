import 'dart:developer';
import 'dart:io';

import 'package:find_me/api/coin_api.dart/coin_api.dart';
import 'package:find_me/components/helper/loading.dart';
import 'package:find_me/models/user_model.dart';
import 'package:find_me/services/payment_service.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class PurchaseCoinsController extends GetxController {
  static PurchaseCoinsController instance = Get.find();
  final paymentService = PaymentService();

  UserModel? userModel;
  Package? coinPackageModel;
  String displayText = "";
  GetStorage box = GetStorage();
  @override
  void onInit() {
    userModel ??= Get.arguments[0];
    coinPackageModel ??= Get.arguments[1];
    if (box.read('locale') == 'ar') {
      // If the locale is Arabic, translate "Coins" in title or description
      String title =
          coinPackageModel!.storeProduct.title.replaceFirst("Coins", "عملات");
      String description = coinPackageModel!.storeProduct.description
          .replaceFirst("Coins", "عملات");
      displayText = Platform.isIOS ? title : description;
    } else {
      // For other locales, keep the original title or description
      displayText = Platform.isIOS
          ? coinPackageModel!.storeProduct.title
          : coinPackageModel!.storeProduct.description;
    }
    super.onInit();
  }

  Future<void> buyCoins(BuildContext context, Package product) async {
    try {
      LoadingHelper.show();

      await Purchases.purchasePackage(product).whenComplete(() {
        LoadingHelper.dismiss();
      });

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
