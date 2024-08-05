import 'package:find_me/app/beacon/beacon_scanner/beacon_scanner_controller.dart';
import 'package:get/get.dart';

class BeaconScannerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BeaconScannerController());
  }
}
