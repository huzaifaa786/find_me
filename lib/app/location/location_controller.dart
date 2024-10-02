import 'package:find_me/utils/ui_utils.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationController extends GetxController {
  final geo.GeolocatorPlatform _geolocator = geo.GeolocatorPlatform.instance;
  bool isLocationEnabled = false;

  @override
  void onInit() {
    super.onInit();
    _checkLocationPermissionAndService();
    _listenToLocationServiceStatus();
  }

  // Toggle location state
  void toggleIsLocationEnabled(bool value) async {
    if (value) {
      // Check and request permissions first
      if (await _checkLocationPermission()) {
        // Only enable location service if permission is granted
        isLocationEnabled = await geo.Geolocator.isLocationServiceEnabled();
        if (!isLocationEnabled) {
          isLocationEnabled = await Location().requestService();
        }
      } else {
        // Handle the case where permission is denied
        UiUtilites.errorSnackbar("", "Location permission is required to enable services.");
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

  // Check if location permission is granted and then check for service
  Future<void> _checkLocationPermissionAndService() async {
    if (await _checkLocationPermission()) {
      isLocationEnabled = await geo.Geolocator.isLocationServiceEnabled();
      if (!isLocationEnabled) {
        isLocationEnabled = await Location().requestService();
      }
    } else {
      // If permission is denied, location service should not be enabled
      isLocationEnabled = false;
      UiUtilites.errorSnackbar("", "Location permission denied.");
    }
    update();
  }

  // Check if location permission is granted
  Future<bool> _checkLocationPermission() async {
    var permissionStatus = await Permission.location.status;
    
    if (permissionStatus.isDenied) {
      // Request permission if denied
      permissionStatus = await Permission.location.request();
    }
    
    if (permissionStatus.isGranted) {
      return true;
    } else {
      // If permission is denied permanently, show appropriate message
      if (permissionStatus.isPermanentlyDenied) {
        UiUtilites.errorSnackbar("", "Location permission is permanently denied.");
        openAppSettings(); // Optionally open app settings for the user to manually allow permission
      }
      return false;
    }
  }
}
