import 'package:get/get.dart';

class LocationController extends GetxController {
  static LocationController get instance => Get.find();

  bool isLocationEnabled = false;

  void toggleLocation(bool value) {
    isLocationEnabled = value;
    update();
  }
}
