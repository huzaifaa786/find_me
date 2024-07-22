import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:find_me/api/auth_api.dart/user_api.dart';
import 'package:find_me/api/bluetooth_api/bluetooth_users_api.dart';
import 'package:find_me/api/profile_api/profile_api.dart';
import 'package:find_me/components/popups/profile_request_popup.dart';
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
import 'package:permission_handler/permission_handler.dart';
// ignore: implementation_imports
import 'package:flutter_ble_peripheral/src/models/periodic_advertise_settings.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

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
    id: 1,
    avatarUrl: null,
    text: 'Almarwan General Trd',
    verified: true,
  );

  @override
  void onInit() {
    // WidgetsBinding.instance.addObserver(this);
    initPlatformState();
    getUser();
    initPusher();
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
          id: userModel!.currentProfile!.id,
          avatarUrl: userModel!.currentProfile!.imageUrl,
          text: userModel!.currentProfile!.name,
          verified: userModel!.currentProfile!.isVerified);
      dropdownItems = [];
      for (var element in userModel!.profiles!) {
        dropdownItems.add(DropdownItem(
            id: element.id,
            avatarUrl: element.imageUrl,
            text: element.name,
            verified: element.isVerified));
      }
      if (userModel!.profiles!.length < 2) {
        dropdownItems.add(DropdownItem(
            id: 20444444444444444, avatarUrl: "2", text: "2", verified: false));
      } else if (userModel!.profiles!.length >= 2 &&
          userModel!.profiles!.length < 4) {
        dropdownItems.add(DropdownItem(
            id: 30039202929292929, avatarUrl: "4", text: "2", verified: false));
      }
      update();
    }
  }

  void selectItem(DropdownItem item) async {
    selectedItem = item; 
    var response = await ProfileApi.updateCurrentProfile(
        userProfileId: item.id, userId: userModel!.id);
    if (response.isNotEmpty) {
      
    }
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
    await requestPermissions();

    if (!await FlutterBluePlus.isOn) {
      await FlutterBluePlus.turnOn();
    }

    if (!await Permission.locationWhenInUse.isGranted) {
      await Permission.locationWhenInUse.request();
    }

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

  Future<void> startPeriodicAdvertising() async {
    if (!await FlutterBluePlus.isOn) {
      Get.snackbar("Bluetooth", "Please turn on Bluetooth to start advertising",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (!await Permission.locationWhenInUse.isGranted) {
      Get.snackbar(
          "Location", "Please turn on location services to start advertising",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

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
    final permissions = [
      Permission.bluetoothAdvertise,
      Permission.bluetoothConnect,
      Permission.locationWhenInUse,
    ];

    for (var permission in permissions) {
      if (!await permission.isGranted) {
        await permission.request();
      }
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
    scannedUsers = [];
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
        timeout: Duration(seconds: 5));
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

  showPopUp(String beaconId) async {
    final response = await UserApi.showPopup(beaconId);
    if (response.isNotEmpty) {}
  }

  // pusher start
  PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
  initPusher() async {
    try {
      await pusher.init(
        apiKey: "6f60a485866f4c65caac",
        cluster: "ap2",
        onConnectionStateChange: onConnectionStateChange,
        onError: onError,
        onSubscriptionSucceeded: onSubscriptionSucceeded,
        onEvent: onEvent,
        onSubscriptionError: onSubscriptionError,
        onDecryptionFailure: onDecryptionFailure,
        onMemberAdded: onMemberAdded,
        onMemberRemoved: onMemberRemoved,
        onAuthorizer: onAuthorizer,
      );
      String id = box.read('beacon_id');
      await pusher.subscribe(channelName: 'user.$id');
      await pusher.connect();
    } catch (e) {
      log("error in initialization: $e");
    }
  }

  void onError(String message, int? code, dynamic e) {
    log("onError: $message code: $code exception: $e");
  }

  void onConnectionStateChange(dynamic currentState, dynamic previousState) {
    log("Connection: $currentState");
  }

  void onMemberRemoved(String channelName, PusherMember member) {
    log("onMemberRemoved: $channelName member: $member");
  }

  void onMemberAdded(String channelName, PusherMember member) {
    log("onMemberAdded: $channelName member: $member");
  }

  void onSubscriptionSucceeded(String channelName, dynamic data) {
    log("onSubscriptionSucceeded: $channelName data: $data");
  }

  void onSubscriptionError(String message, dynamic e) {
    log("onSubscriptionError: $message Exception: $e");
  }

  void onEvent(PusherEvent event) {
    if (event.data != null && event.eventName == "my-event") {
      Map<String, dynamic> data = json.decode(event.data!);
      UserModel user = UserModel.fromJson(data['user']);
      showPopup(data['message'], user);
    }
  }

  void onDecryptionFailure(String event, String reason) {
    log("onDecryptionFailure: $event reason: $reason");
  }

  dynamic onAuthorizer(
      String channelName, String socketId, dynamic options) async {
    log('Channel Name: $channelName, Socket Id: $socketId, Options: $options');
  }

  void showPopup(String message, UserModel user) {
    Get.dialog(
      ProfileRequestPopup(
        name: user.currentProfile!.name!,
        imageUrl:
            'https://avatar.iran.liara.run/public/boy?username=${user.currentProfile!.name!}',
        requestMessage: 'Would like to take a look at your "Profile".',
      ),
    );
  }
}

class DropdownItem {
  final String? avatarUrl;
  final String? text;
  final bool verified;
  final int id;

  DropdownItem({
    required this.avatarUrl,
    required this.text,
    required this.verified,
    required this.id,
  });
}
