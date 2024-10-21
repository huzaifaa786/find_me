import 'dart:io';

import 'package:find_me/services/revenue_cat_service.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SubscriptionsController extends GetxController {
  static SubscriptionsController intance = Get.find();
  int selectedOption = 0;
  Package? package;
  String plateform = "iTunes";

  @override
  void onInit() {
    plateform = Platform.isIOS ? "iTunes" : "Google Play";
    getProduct();
    super.onInit();
  }

  void getProduct() async {
    try {
      FirebaseAnalytics.instance.logEvent(
        name: 'view_subscription_page',
      );
      Offerings offerings = await Purchases.getOfferings();
      if (offerings.getOffering("premium") != null) {
        package = offerings.getOffering("premium")?.availablePackages.first;
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
  }

  void selectOption(int value) {
    selectedOption = value;
    update();
  }

  launchWebUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      UiUtilites.errorSnackbar("", "Invalid Url");
    }
  }
}
