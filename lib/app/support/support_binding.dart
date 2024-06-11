import 'package:find_me/app/location/location_controller.dart';
import 'package:find_me/app/support/support_controller.dart';
import 'package:get/get.dart';

class SupportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SupportController());
  }
}
