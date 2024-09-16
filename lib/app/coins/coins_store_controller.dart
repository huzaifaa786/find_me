import 'dart:convert';
import 'dart:developer';

import 'package:find_me/api/auth_api/user_api.dart';
import 'package:find_me/api/coin_api.dart/coin_api.dart';
import 'package:find_me/helpers/subscription_manager.dart';
import 'package:find_me/models/coin_package_model.dart';
import 'package:find_me/models/user_model.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class CoinsStoreController extends GetxController {
  static CoinsStoreController instance = Get.find();

  List<CoinPackageModel> coinPackages = [];
  List<Package>? packages = [];
  UserModel? userModel;

  @override
  void onInit() {
    getUser();
    getCoinPackages();
    super.onInit();
  }

  getUser() async {
    var response = await UserApi.getUser();
    if (response.isNotEmpty) {
      userModel = UserModel.fromJson(response['user']);
      update();
    }
  }

  getCoinPackages() async {
    try {
      FirebaseAnalytics.instance.logEvent(
          name: 'view_coins_page',
        );
      Offerings offerings = await Purchases.getOfferings();
      if (offerings.getOffering("coins") != null) {
        packages = offerings.getOffering("coins")?.availablePackages;
        print(packages);
        // debugPrint(monthly?.description);
        // debugPrint(monthly?.priceString);
        // debugPrint(offerings.current?.availablePackages[0].toString());
        update();
      } else {
        debugPrint('No offerings');
      }
    } on PlatformException catch (e) {
      debugPrint(e.message);
    }
    // var response = await CoinApi.getCoinPackages();

    // if (response.isNotEmpty) {
    //   coinPackages = [];
    //   coinPackages = List.from(response['data']['packages'])
    //       .map((package) =>
    //           CoinPackageModel.fromJson(package as Map<String, dynamic>))
    //       .toList();
    //   userModel = UserModel.fromJson(response['data']['user']);
    //   update();
    // }
  }

  Future<void> purchaseCoinPackage(
      BuildContext context, Package product) async {
    try {
      CustomerInfo customerInfo = await Purchases.purchasePackage(product);
    } on PlatformException catch (e) {
      log(e.toString());
    }
  }
}
