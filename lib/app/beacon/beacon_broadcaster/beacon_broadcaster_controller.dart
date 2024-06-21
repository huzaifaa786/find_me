import 'dart:typed_data';

import 'package:find_me/utils/ui_utils.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_ble_peripheral/flutter_ble_peripheral.dart';

class BeaconBroadcasterController extends GetxController {
  static BeaconBroadcasterController instance = Get.find();
  TextEditingController emailController = TextEditingController();
  GetStorage box = GetStorage();
  final AdvertiseData advertiseData = AdvertiseData(
    serviceUuid: 'bf27730d-860a-4e09-889c-2d8b6a9e0fe7',
    // serviceUuids: ['ffffffff-ffff-ffff-ffff-ffffffffffff'],
    localName: 'test',
    manufacturerId: 1234,
    manufacturerData: Uint8List.fromList([1, 2, 3, 4, 5, 6]),
  );

  // final advertiseSettings = AdvertiseSettings(
  //   advertiseMode: AdvertiseMode.advertiseModeBalanced,
  //   txPowerLevel: AdvertiseTxPower.advertiseTxPowerMedium,
  //   timeout: 3000,
  // );

  final AdvertiseSetParameters advertiseSetParameters =
      AdvertiseSetParameters();

  bool isSupported = false;

  @override
  void onInit() {
    initPlatformState();
    super.onInit();
  }

  Future<void> initPlatformState() async {
    final _isSupported = await FlutterBlePeripheral().isSupported;

    isSupported = _isSupported;
    update();
  }

  Future<void> toggleAdvertise() async {
    if (await FlutterBlePeripheral().isAdvertising) {
      await FlutterBlePeripheral().stop();
    } else {
      await FlutterBlePeripheral().start(advertiseData: advertiseData);
    }
  }

  Future<void> toggleAdvertiseSet() async {
    if (await FlutterBlePeripheral().isAdvertising) {
      await FlutterBlePeripheral().stop();
    } else {
      await FlutterBlePeripheral().start(
        advertiseData: advertiseData,
        advertiseSetParameters: advertiseSetParameters,
      );
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
