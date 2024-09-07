import 'package:find_me/services/revenue_cat_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class SubscriptionsController extends GetxController {
  static SubscriptionsController intance = Get.find();
  int selectedOption = 0;
  Package? package;

  @override
  void onInit() {
    getProduct();
    super.onInit();
  }

  void getProduct() async {
    try {
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
}
