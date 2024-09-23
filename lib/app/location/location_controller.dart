import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class LocationController extends GetxController {
  final GeolocatorPlatform _geolocator = GeolocatorPlatform.instance;
  bool isLocationEnabled = false;

  @override
  void onInit() {
    super.onInit();
    _checkLocationPermission();
    _listenToLocationServiceStatus();
  }

  // Toggle location state
  void toggleisLocationEnabled(bool value) async {
    if (value) {
      isLocationEnabled = await Geolocator.isLocationServiceEnabled();
      if (!isLocationEnabled) {
        isLocationEnabled = await Location().requestService();
      }
    } else {
      await _geolocator.openLocationSettings();
    }
    update();
  }

  void _listenToLocationServiceStatus() {
    _geolocator.getServiceStatusStream().listen((status) {
      if (status == ServiceStatus.enabled) {
        isLocationEnabled = true;
      } else {
        isLocationEnabled = false;
      }
      update();
    });
  }

  _checkLocationPermission() async {
    isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationEnabled) {
      isLocationEnabled = await Location().requestService();
    }
    update();
  }
}
