import 'package:find_me/app/subscriptions/subscriptions_controller.dart';
import 'package:get/get.dart';

class SubscriptionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SubscriptionsController());
  }
}
