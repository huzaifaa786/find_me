import 'package:find_me/app/location/location_controller.dart';
import 'package:get/get.dart';

class LocationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LocationController());
  }
}