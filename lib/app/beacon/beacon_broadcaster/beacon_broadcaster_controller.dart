import 'dart:typed_data';
import 'package:find_me/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_ble_peripheral/flutter_ble_peripheral.dart';
import 'package:permission_handler/permission_handler.dart';
// ignore: implementation_imports
import 'package:flutter_ble_peripheral/src/models/periodic_advertise_settings.dart';

class BeaconBroadcasterController extends GetxController {
  static BeaconBroadcasterController instance = Get.find();
  TextEditingController emailController = TextEditingController();
  GetStorage box = GetStorage();

  final AdvertiseData advertiseData = AdvertiseData(
    serviceUuid: 'bf27730d-860a-4e09-889c-2d8b6a9e0fe7',
    manufacturerId: 1234,
    localName: "MEEEEEEEEEEEEEEEEEEEEEEE",
    includePowerLevel: true,
    // serviceDataUuid: 'bf27730d-860a-4e09-889c-2d8b6a9e0fe7',
    // serviceData: Uint8List.fromList([1, 2, 3]),
    manufacturerData: Uint8List.fromList([1, 2, 3]),
  );

  final PeriodicAdvertiseSettings periodicAdvertiseSettings = PeriodicAdvertiseSettings();
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
    initPlatformState();
    super.onInit();
  }

  Future<void> initPlatformState() async {
    final _isSupported = await FlutterBlePeripheral().isSupported;
    await Permission.bluetoothAdvertise.request();
    await Permission.bluetoothConnect.request();
    await Permission.locationWhenInUse.request();
    isSupported = _isSupported;
    update();
  }

  Future<void> toggleAdvertise() async {
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

  Future<void> toggleAdvertiseSet() async {
    if (await FlutterBlePeripheral().isAdvertising) {
      await FlutterBlePeripheral().stop();
    } else {
      try {
        await FlutterBlePeripheral().start(
            advertiseData: advertiseData,
            advertiseSetParameters: advertiseSetParameters,
            advertiseSettings: advertiseSettings);
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
            "Permissions!", "We don't have permissions, requesting now!");
        await requestPermissions();
        break;
      default:
        UiUtilites.successSnackbar("Permissions!", 'State: $hasPermission!');
        break;
    }
  }

  Future<void> hasPermissions() async {
    final hasPermissions = await FlutterBlePeripheral().hasPermission();
    Get.showSnackbar(
      GetSnackBar(
        message: 'Has permission: $hasPermissions',
        backgroundColor: hasPermissions == BluetoothPeripheralState.granted
            ? Colors.green
            : Colors.red,
      ),
    );
  }

  final messangerKey = GlobalKey<ScaffoldMessengerState>();
}
