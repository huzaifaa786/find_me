import 'package:find_me/app/privacy/privacy_controller.dart';
import 'package:get/get.dart';

class PrivacyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PrivacyController());
  }
}
