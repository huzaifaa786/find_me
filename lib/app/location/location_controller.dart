import 'package:find_me/utils/ui_utils.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  bool isLocationEnabled = false;

  @override
  void onInit() {
    super.onInit();
    _initLocation();
    _listenToLocationServiceStatus();
  }

  // Initialize location services
  Future<void> _initLocation() async {
    if (await _checkLocationPermission()) {
      isLocationEnabled = await Geolocator.isLocationServiceEnabled();
      if (!isLocationEnabled) {
        UiUtilites.errorSnackbar("", "Please enable location services.");
      }
    } else {
      UiUtilites.errorSnackbar("", "Location permission denied.");
    }
    update();
  }

  // Check and request location permission
  Future<bool> _checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      return true;
    } else if (permission == LocationPermission.deniedForever) {
      UiUtilites.errorSnackbar("",
          "Location permission is permanently denied. Please enable it from settings.");
      await Geolocator.openAppSettings(); // Open app settings for the user
    }
    return false;
  }

  // Listen to location service status changes
  void _listenToLocationServiceStatus() {
    Geolocator.getServiceStatusStream().listen((status) {
      isLocationEnabled = status == ServiceStatus.enabled;
      update();
    });
  }

  // Toggle location state (if needed)
  Future<void> toggleIsLocationEnabled(bool value) async {
    if (value && await _checkLocationPermission()) {
      isLocationEnabled = await Geolocator.isLocationServiceEnabled();
      if (!isLocationEnabled) {
        await Geolocator
            .openLocationSettings(); // Open location settings if disabled
      }
    } else {
      await Geolocator
          .openLocationSettings(); // Open settings if trying to disable
    }
    update();
  }
}
