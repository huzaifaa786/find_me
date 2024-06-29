import 'package:find_me/app/beacon/beacon_broadcaster/beacon_broadcaster_controller.dart';
import 'package:get/get.dart';

class BeaconBroadcasterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BeaconBroadcasterController());
  }
}
