import 'package:find_me/app/coins/coins_store_controller.dart';
import 'package:find_me/app/coins/purchase_coins/purchase_coins_controller.dart';
import 'package:find_me/app/create_business_card/create_card_controller.dart';
import 'package:get/get.dart';

class PurchaseCoinsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PurchaseCoinsController());
  }
}