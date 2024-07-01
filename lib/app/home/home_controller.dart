import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:find_me/api/auth_api.dart/user_api.dart';
import 'package:find_me/api/bluetooth_api/bluetooth_users_api.dart';
import 'package:find_me/models/user_model.dart';
import 'package:find_me/utils/images/ui_utils/ui_utils.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ble_peripheral/flutter_ble_peripheral.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_ble_peripheral/src/models/periodic_advertise_settings.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
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

  File? pdfFile;
  File? videoFile;
  File? imageFile;
  bool isLoading = false;
  bool isShowSticker = false;
  String imageUrl = "";
  UserModel? userModel;

  bool isSearching = false;

  var dropdownItems = <DropdownItem>[];
  DropdownItem selectedItem = DropdownItem(
    avatarUrl:
        'https://th.bing.com/th/id/OIP.DmAJheE6apJ9IX7pxIRDjgHaFN?pid=ImgDet&w=474&h=333&rs=1',
    text: 'Almarwan General Trd',
    verified: true,
  );

  @override
  void onInit() {
    // WidgetsBinding.instance.addObserver(this);
    initPlatformState();
    getUser();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    // WidgetsBinding.instance.removeObserver(this);
    stopPeriodicAdvertising();
  }

  getUser() async {
    var response = await UserApi.getUser();
    if (response.isNotEmpty) {
      userModel = UserModel.fromJson(response['user']);
      selectedItem = DropdownItem(
          avatarUrl: userModel!.currentProfile!.imageUrl,
          text: userModel!.currentProfile!.name,
          verified: true);
      for (var element in userModel!.profiles!) {
        dropdownItems.add(DropdownItem(
            avatarUrl: element.imageUrl, text: element.name, verified: true));
      }
      update();
    }
  }

  void selectItem(DropdownItem item) {
    selectedItem = item;
    update();
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

  //Scanner Start

  List<String> serviceDataKeys = [];
  List<ScanResult> scanResult = [];
  List<UserModel> scannedUsers = [];

  void initFlutterBlue() async {
    isSearching = true;
    update();
    await Permission.bluetoothScan.request();
    // FlutterBluePlus.setLogLevel(LogLevel.verbose, color: true);
    serviceDataKeys = [];
    update();
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
                  print(
                      "serviceData: ${ee.advertisementData.serviceData.keys.toList()}");
                  print("*************** DEVICE START ********************");
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
      } else {
        // show an error to the user, etc
      }
    });

    if (Platform.isAndroid) {
      await FlutterBluePlus.turnOn();
    }
    await FlutterBluePlus.startScan(
        // *or* any of the specified names
        timeout: Duration(seconds: 10));
    await FlutterBluePlus.isScanning.where((val) => val == false).first;

    serviceDataKeys = serviceDataKeys.toSet().toList();
    isSearching = false;
    update();
    await sendServiceDataKeysToApi();
  }

  Future<void> sendServiceDataKeysToApi() async {
    final response =
        await BluethoohUsersApi.getUsersList(keys: serviceDataKeys);
    if (response.isNotEmpty) {
      for (var element in response['users']) {
        scannedUsers.add(UserModel.fromJson(element));
      }
    }
    update();
  }
}

class DropdownItem {
  final String? avatarUrl;
  final String? text;
  final bool verified;

  DropdownItem({
    required this.avatarUrl,
    required this.text,
    required this.verified,
  });
}
