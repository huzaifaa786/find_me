import 'dart:typed_data';

import 'package:find_me/app.dart';
import 'package:find_me/components/helper/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ble_peripheral/flutter_ble_peripheral.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:workmanager/workmanager.dart';
import 'firebase_options.dart';

@pragma('vm:entry-point')
AdvertiseData advertiseData = AdvertiseData(
  serviceUuid: 'bf27730d-860a-4e09-889c-2d8b6a9e0fe7',
  manufacturerId: 1234,
  localName: "MEEEEEEEEEEEEEEEEEEEEEEE",
  includePowerLevel: true,
  manufacturerData: Uint8List.fromList([1, 2, 3]),
);

final AdvertiseSetParameters advertiseSetParameters = AdvertiseSetParameters(
  scannable: true,
  txPowerLevel: txPowerHigh,
  includeTxPowerLevel: true,
);
final AdvertiseSettings advertiseSettings = AdvertiseSettings(
    advertiseMode: AdvertiseMode.advertiseModeBalanced,
    timeout: 180000,
    txPowerLevel: AdvertiseTxPower.advertiseTxPowerHigh);

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    print("Task: $task, Input DATA: $inputData");

    // Check if inputData is null or doesn't contain the expected key
    if (inputData == null || !inputData.containsKey('beacon_id')) {
      print("Input data is null or does not contain 'beacon_id'");
      return Future.value(false);
    }

    // Initialize the platform state with the provided beacon ID
    await initPlatformState(inputData['beacon_id']);
    return Future.value(true);
  });
}

Future<void> initPlatformState(String? id) async {
  final _isSupported = await FlutterBlePeripheral().isSupported;
  print("BLE Peripheral Supported: $_isSupported");

  if (id != null) {
    advertiseData = AdvertiseData(
      serviceUuid: id,
      manufacturerId: 1234,
      localName: "MEEEEEEEEE",
      includePowerLevel: true,
      manufacturerData: Uint8List.fromList([1, 2, 3]),
    );

    await FlutterBlePeripheral().start(
      advertiseData: advertiseData,
      advertiseSetParameters: advertiseSetParameters,
      advertisePeriodicData: advertiseData,
    );
    print("Started advertising with ID: $id");
  } else {
    print("No beacon ID provided.");
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LoadingHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
  await Permission.bluetoothAdvertise.request();
  await Permission.bluetoothConnect.request();
  await Permission.locationWhenInUse.request();

  Workmanager().initialize(callbackDispatcher, isInDebugMode: true);

  GetStorage box = GetStorage();
  String? id = box.read('beacon_id');
  print("Beacon ID from storage: $id");

  // Ensure beacon ID is available before registering the task
  if (id != null) {
    Workmanager().registerPeriodicTask(
      "task-identifier",
      "simpleTask",
      constraints: Constraints(
        networkType: NetworkType.connected,
        requiresDeviceIdle: true,
      ),
      inputData: {"beacon_id": id},
    );
  } else {
    print("No beacon ID found in storage.");
  }

  runApp(const App());
}
