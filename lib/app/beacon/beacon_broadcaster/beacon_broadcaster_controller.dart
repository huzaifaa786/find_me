import 'dart:async'; // Import the dart:async package
import 'dart:typed_data';
import 'package:find_me/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_ble_peripheral/flutter_ble_peripheral.dart';
import 'package:permission_handler/permission_handler.dart';
// ignore: implementation_imports
import 'package:flutter_ble_peripheral/src/models/periodic_advertise_settings.dart';

class BeaconBroadcasterController extends GetxController with WidgetsBindingObserver {
  static BeaconBroadcasterController instance = Get.find();
  TextEditingController emailController = TextEditingController();
  GetStorage box = GetStorage();
  Timer? _advertisingTimer; // Define a Timer variable

  AdvertiseData advertiseData = AdvertiseData(
    serviceUuid: 'bf27730d-860a-4e09-889c-2d8b6a9e0fe7',
    manufacturerId: 1234,
    localName: "MEEEEEEEEEEEEEEEEEEEEEEE",
    includePowerLevel: true,
    manufacturerData: Uint8List.fromList([1, 2, 3]),
  );

  final PeriodicAdvertiseSettings periodicAdvertiseSettings =
      PeriodicAdvertiseSettings(interval: 10);
  final AdvertiseSetParameters advertiseSetParameters = AdvertiseSetParameters(
    scannable: true,
    txPowerLevel: txPowerHigh,
    includeTxPowerLevel: true,
  );
  final AdvertiseSettings advertiseSettings = AdvertiseSettings(
      advertiseMode: AdvertiseMode.advertiseModeBalanced,
      timeout: 180000,
      txPowerLevel: AdvertiseTxPower.advertiseTxPowerHigh);

  bool isSupported = false;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    initPlatformState();
  }

  @override
  void onClose() {
    super.onClose();
    WidgetsBinding.instance.removeObserver(this);
    stopPeriodicAdvertising();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      startPeriodicAdvertising();
    } else if (state == AppLifecycleState.paused) {
      stopPeriodicAdvertising();
    }
  }

  Future<void> initPlatformState() async {
    isSupported = await FlutterBlePeripheral().isSupported;
    await Permission.bluetoothAdvertise.request();
    await Permission.bluetoothConnect.request();
    await Permission.locationWhenInUse.request();

    String id = box.read('beacon_id');
    advertiseData = AdvertiseData(
      serviceUuid: id,
      manufacturerId: 1234,
      localName: "MEEEEEEEEEEEEEEEEEEEEEEE",
      includePowerLevel: true,
      manufacturerData: Uint8List.fromList([1, 2, 3]),
    );
    update();
    startPeriodicAdvertising(); // Start the periodic advertising
  }

  void startPeriodicAdvertising() {
    _advertisingTimer?.cancel(); // Cancel any existing timer
    _advertisingTimer = Timer.periodic(Duration(seconds: 5), (timer) async {
      await FlutterBlePeripheral().start(
        advertiseData: advertiseData,
        advertiseSetParameters: advertiseSetParameters,
        advertisePeriodicData: advertiseData,
        periodicAdvertiseSettings: periodicAdvertiseSettings,
      );
    });
  }

  void stopPeriodicAdvertising() async {
    _advertisingTimer?.cancel(); // Cancel the timer
    await FlutterBlePeripheral().stop(); // Stop advertising
  }

  Future<void> toggleAdvertise() async {
    print("HRRRRRR");
    if (await FlutterBlePeripheral().isAdvertising) {
      await FlutterBlePeripheral().stop();
    } else {
      try {
        await FlutterBlePeripheral().start(
          advertiseData: advertiseData,
          advertiseSetParameters: advertiseSetParameters,
          advertisePeriodicData: advertiseData,
          periodicAdvertiseSettings: periodicAdvertiseSettings,
        );
      } catch (e) {
        print('Error starting advertising set: $e');
      }
    }
  }

  Future<void> requestPermissions() async {
    final hasPermission = await FlutterBlePeripheral().hasPermission();
    switch (hasPermission) {
      case BluetoothPeripheralState.denied:
        UiUtilites.errorSnackbar(
            "Permissions!".tr, "We don't have permissions, requesting now!".tr);
        await requestPermissions();
        break;
      default:
        UiUtilites.successSnackbar("Permissions!".tr, 'State: $hasPermission!'.tr);
        break;
    }
  }

  Future<void> hasPermissions() async {
    final hasPermissions = await FlutterBlePeripheral().hasPermission();
    Get.showSnackbar(
      GetSnackBar(
        message: 'Has permission: $hasPermissions'.tr,
        backgroundColor: hasPermissions == BluetoothPeripheralState.granted
            ? Colors.green
            : Colors.red,
      ),
    );
  }

  final messangerKey = GlobalKey<ScaffoldMessengerState>();
}
