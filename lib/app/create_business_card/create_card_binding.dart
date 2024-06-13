import 'package:find_me/app/create_business_card/create_card_controller.dart';
import 'package:get/get.dart';

class CreateCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateCardController());
  }
}