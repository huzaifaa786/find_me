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
    print(inputData);
    initPlatformState(inputData!['id']);
    return Future.value(true);
  });
}

Future<void> initPlatformState(String? id) async {
  final _isSupported = await FlutterBlePeripheral().isSupported;

  if (id != null) {
    advertiseData = AdvertiseData(
      serviceUuid: id,
      manufacturerId: 1234,
      localName: "MEEEEEEEEEEEEEEEEEEEEEEE",
      includePowerLevel: true,
      manufacturerData: Uint8List.fromList([1, 2, 3]),
    );
    await FlutterBlePeripheral().start(
      advertiseData: advertiseData,
      advertiseSetParameters: advertiseSetParameters,
      advertisePeriodicData: advertiseData,
    ); 
  } else {
    print(
        "HELLLLO.................................................................");
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

  Workmanager().registerPeriodicTask(
    "task-identifier",
    "simpleTask",
    constraints: Constraints(
      networkType: NetworkType.connected,
      requiresDeviceIdle: true,
    ),
    inputData: <String, dynamic>{"beacon_id": id},
  );
  runApp(const App());
}
