import 'dart:io';

import 'package:find_me/api/bluetooth_api/bluetooth_users_api.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class BeaconScannerController extends GetxController {
  static BeaconScannerController instance = Get.find();
  TextEditingController emailController = TextEditingController();

  List<ScanResult> scanResult = [];
  List<String> serviceDataKeys = [];

  List<BluetoothDevice> devices = [];

  @override
  void onInit() {
    // initBeacon();
    initFlutterBlue();
    // startScanning();
    super.onInit();
  }

  void startScanning() async {
    await FlutterBluePlus.startScan();
    FlutterBluePlus.scanResults.listen((results) {
      for (ScanResult result in results) {
        if (!devices.contains(result.device)) {
          devices.add(result.device);
          update();
        }
      }
    });
  }

  void initFlutterBlue() async {
    await Permission.bluetoothScan.request();
    // FlutterBluePlus.setLogLevel(LogLevel.verbose, color: true);

    if (await FlutterBluePlus.isSupported == false) {
      print("Bluetooth not supported by this device");
      return;
    }

    FlutterBluePlus.adapterState.listen((BluetoothAdapterState state) {
      if (state == BluetoothAdapterState.on) {
        FlutterBluePlus.onScanResults.listen(
            (results) async {
              if (results.isNotEmpty) {
                scanResult = results;
                update();

                for (var ee in results) {
                  // print("serviceData: ${ee.advertisementData.serviceData.keys.toList()}");
                  print("*************** DEVICE START ********************");
                  // print("Advname: ${ee.advertisementData.advName}");
                  // print("appearance: ${ee.advertisementData.appearance}");
                  // print("connectable: ${ee.advertisementData.connectable}");
                  // print(
                  //     "manufacturerData: ${ee.advertisementData.manufacturerData}");

                  print("serviceUuids: ${ee.advertisementData.serviceUuids}");
                  // print("txPowerLevel: ${ee.advertisementData.txPowerLevel}");
                  // print("device: ${ee.device}");
                  // print("rssi: ${ee.rssi}");
                  // print("device: ${ee.timeStamp}");
                  print("*************** DEVICE END ********************");

                  // print('$ee found!');
                  if (ee.advertisementData.serviceUuids.isNotEmpty) {
                    serviceDataKeys.add(
                        ee.advertisementData.serviceUuids.first.toString());
                  }
                  update();
                }
              }
            },
            onError: (e) => print("YEH ERROR HA:$e"),
            onDone: () async {
              print("DONE");
              serviceDataKeys = serviceDataKeys.toSet().toList();
              await sendServiceDataKeysToApi();
            });

        FlutterBluePlus.scanResults.listen((results) async {
          if (results.isNotEmpty) {
            scanResult = results;
            update();

            for (var ee in results) {
              print("*************** DEVICE START ********************");
              print("serviceData: ${ee.advertisementData.serviceData}");
              print("Advname: ${ee.advertisementData.advName}");
              print("appearance: ${ee.advertisementData.appearance}");
              print("connectable: ${ee.advertisementData.connectable}");
              print(
                  "manufacturerData: ${ee.advertisementData.manufacturerData}");
              print("serviceUuids: ${ee.advertisementData.serviceUuids}");
              print("txPowerLevel: ${ee.advertisementData.txPowerLevel}");
              print("device: ${ee.device}");
              print("rssi: ${ee.rssi}");
              print("device: ${ee.timeStamp}");
              print("*************** DEVICE END ********************");

              // print('$ee found!');
              if (ee.advertisementData.serviceUuids.isNotEmpty) {
                serviceDataKeys
                    .add(ee.advertisementData.serviceUuids.first.toString());
              }
              update();
            }
          }
        }, onError: (e) => print("YEH ERROR HA:$e"), onDone: () async {});
      } else {
        // show an error to the user, etc
      }
    });

    if (Platform.isAndroid) {
      await FlutterBluePlus.turnOn();
    }
    await FlutterBluePlus.startScan(
        // *or* any of the specified names
        timeout: Duration(seconds: 30));
    // await FlutterBluePlus.isScanning.where((val) => val == false).first;

    // serviceDataKeys = serviceDataKeys.toSet().toList();
    // update();
    // await sendServiceDataKeysToApi();
  }

  Future<void> sendServiceDataKeysToApi() async {
    final response =
        await BluethoohUsersApi.getUsersList(keys: serviceDataKeys);
    if (response.isNotEmpty) {
      print(response);
    }
  }
}
