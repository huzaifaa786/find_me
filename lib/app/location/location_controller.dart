import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationController extends GetxController {
  final GeolocatorPlatform _geolocator = GeolocatorPlatform.instance;
  bool isLocationEnabled = false;

  @override
  void onInit() {
    super.onInit();
    _checkLocationPermission();
  }
   void toggleisLocationEnabled(bool value) {
    isLocationEnabled = value;
    update();
  }

  _checkLocationPermission() async {
    PermissionStatus permission = await Permission.location.status;
    if (!permission.isGranted) {
      await Permission.location.request();
    }
  }

  turnLocationOn() async {
     if (!(await _geolocator.isLocationServiceEnabled())) {
      await _geolocator.openLocationSettings();
    }
   
  }

  turnLocationOff() async {
    if (await _geolocator.isLocationServiceEnabled()) {
      await _geolocator.openLocationSettings();
    }
  }
}
