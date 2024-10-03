import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:find_me/api/auth_api/user_api.dart';
import 'package:find_me/api/block_report_api/block_report_api.dart';
import 'package:find_me/api/bluetooth_api/bluetooth_users_api.dart';
import 'package:find_me/api/profile_api/profile_api.dart';
import 'package:find_me/api/request_api/request_api.dart';
import 'package:find_me/app/main_view/main_controller.dart';
import 'package:find_me/app/public_profile/public_profile_controller.dart';
import 'package:find_me/components/helper/loading.dart';
import 'package:find_me/components/popups/profile_request_popup.dart';
import 'package:find_me/helpers/subscription_manager.dart';
import 'package:find_me/models/profile_request_model.dart';
import 'package:find_me/models/user_model.dart';
import 'package:find_me/models/user_profile_model.dart';
import 'package:find_me/routes/app_routes.dart';
import 'package:find_me/services/revenue_cat_service.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ble_peripheral/flutter_ble_peripheral.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';
// ignore: implementation_imports
import 'package:flutter_ble_peripheral/src/models/periodic_advertise_settings.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  static MainController mainController = Get.find();
  GetStorage box = GetStorage();
  final GeolocatorPlatform _geolocator = GeolocatorPlatform.instance;

  Timer? _advertisingTimer; // Define a Timer variable

  AdvertiseData? advertiseData;

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
    text: 'Almarwan General Trd'.tr,
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
   onClose([String? beaconId]) async {
    super.onClose();
    // WidgetsBinding.instance.removeObserver(this);
    await stopPeriodicAdvertising();

    // Check if beaconId is provided; if not, read it from the box
    String id = beaconId ?? box.read('beacon_id') ?? '';
    if (id.isNotEmpty) {
      pusher.unsubscribe(channelName: 'user.$id');
    }
  }

  getUser() async {
    configureSDK();
    var response = await UserApi.getUser();
    if (response.isNotEmpty) {
      userModel = UserModel.fromJson(response['user']);
      dropdownItems = [];
      // Determine the profile limit based on whether the user is Pro or Free
      int profileLimit = SubscriptionManager().isProUser ? 4 : 2;
      // Handle case where user has more profiles than allowed after unsubscribing
      List<UserProfileModel> limitedProfiles =
          userModel!.profiles!.take(profileLimit).toList();
      // Check if the current profile is outside the allowed range
      if (!limitedProfiles
          .any((profile) => profile.id == userModel!.currentProfile!.id)) {
        // If the current profile is not in the allowed profiles, shift to the first allowed profile
        userModel!.currentProfile = limitedProfiles.first;
        // Call selectItem to update the current profile on the server and UI
        selectItem(DropdownItem(
            id: userModel!.currentProfile!.id,
            avatarUrl: userModel!.currentProfile!.imageUrl,
            text: userModel!.currentProfile!.name,
            verified: userModel!.currentProfile!.isVerified));
      } else {
        selectedItem = DropdownItem(
            id: userModel!.currentProfile!.id,
            avatarUrl: userModel!.currentProfile!.imageUrl,
            text: userModel!.currentProfile!.name,
            verified: userModel!.currentProfile!.isVerified);
      }

      // Add the limited profiles to dropdownItems
      for (var element in limitedProfiles) {
        dropdownItems.add(DropdownItem(
            id: element.id,
            avatarUrl: element.imageUrl,
            text: element.name,
            verified: element.isVerified));
      }
      if (limitedProfiles.length < profileLimit) {
        dropdownItems.add(DropdownItem(
            id: 20444444444444444,
            avatarUrl: "2",
            text: "add",
            verified: false));
      } else {
        dropdownItems.add(DropdownItem(
            id: 30039202929292929,
            avatarUrl: "4",
            text: "edit",
            verified: false));
      }
      scannedUsers = [];
    }
    update();
    Get.find<MainController>().update();
  }

  void selectItem(DropdownItem item) async {
    selectedItem = item;
    var response = await ProfileApi.updateCurrentProfile(
        userProfileId: item.id, userId: userModel!.id);
    getUser();
    if (response.isNotEmpty) {}
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

    if (Platform.isAndroid) {
      await FlutterBluePlus.turnOn();
    }

    if (!await Permission.locationWhenInUse.isGranted) {
      await Permission.locationWhenInUse.request();
    }

    String id = box.read('beacon_id');

    print('advertise honay lga haaaaa');
    print(id);
    advertiseData = AdvertiseData(
      serviceUuid: id,
      localName: id,
      includePowerLevel: true,
    );
    update();
    startPeriodicAdvertising(); // Start the periodic advertising
  }

  void listenToBluetoothServiceStatus() {
    FlutterBluePlus.adapterState.listen((status) {
      if (status == BluetoothAdapterState.on) {
        print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
        // startPeriodicAdvertising();
      }
      update();
    });
  }

  Future<void> startPeriodicAdvertising() async {
    if (Platform.isAndroid) {
      if (FlutterBluePlus.adapterStateNow == BluetoothAdapterState.off) {
        await FlutterBlePeripheral().stop();

        return;
      }
    }
    _advertisingTimer?.cancel(); // Cancel any existing timer
    _advertisingTimer = Timer.periodic(Duration(seconds: 6), (timer) async {
      if (await Geolocator.isLocationServiceEnabled()) {
        await FlutterBlePeripheral().start(
          advertiseData: advertiseData!,
          advertiseSetParameters: advertiseSetParameters,
          advertisePeriodicData: advertiseData,
          periodicAdvertiseSettings: periodicAdvertiseSettings,
        );
      } else {
        await FlutterBlePeripheral().stop();
      }
    });
  }

   stopPeriodicAdvertising() async {
    _advertisingTimer?.cancel(); 
    await FlutterBlePeripheral().stop();
  }

  Future<void> toggleAdvertise() async {
    if (await FlutterBlePeripheral().isAdvertising) {
      await FlutterBlePeripheral().stop();
    } else {
      try {
        await FlutterBlePeripheral().start(
          advertiseData: advertiseData!,
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
    Location location = new Location();

    bool _serviceEnabled;

    _serviceEnabled = await location.serviceEnabled();

    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    await location.requestPermission();
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
    if (!(await _geolocator.isLocationServiceEnabled())) {
      await _geolocator.openLocationSettings();
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

  //Scanner Start

  List<String> serviceDataKeys = [];
  List<ScanResult> scanResult = [];
  List<UserModel> scannedUsers = [];
  bool isInternetChecking = false;
  bool _hasShownBluetoothOffSnackbar = false;

  Future<void> checkData() async {
    isInternetChecking = true;
    update();
    final connectionChecker = InternetConnectionChecker();
    InternetConnectionStatus internetConnectionStatus =
        await connectionChecker.connectionStatus;

    if (internetConnectionStatus == InternetConnectionStatus.connected) {
      print('Connected to the internet');
      isInternetChecking = false;

      initFlutterBlue();
    } else {
      isInternetChecking = false;

      Get.snackbar(
        'No Internet Connection',
        'You are not connected to the internet. Please check your connection.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: AppColors.white,
        duration: Duration(seconds: 5),
      );
    }
    connectionChecker.onStatusChange.listen(
      (InternetConnectionStatus status) {
        internetConnectionStatus = status;
        update();
      },
    );
  }

  void initFlutterBlue() async {
    scannedUsers = [];
    update();
        await Permission.bluetoothScan.request();

    // Check if location permissions are granted
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        UiUtilites.errorSnackbar("", "Location permission denied.");
        isSearching = false;
        update();
        return;
      }
    }

    // Check if location services are enabled
    if (!await Geolocator.isLocationServiceEnabled()) {
      // Ask the user to enable location services
      await Geolocator.openLocationSettings();

      // Recheck if location services are enabled
      if (!await Geolocator.isLocationServiceEnabled()) {
        UiUtilites.errorSnackbar("", "Location services are disabled.");
        isSearching = false;
        update();
        return;
      }
    }

    // Final check after user interaction with location services and permissions
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      // Proceed with location-based functionality
    } else {
      isSearching = false;
      update();
      UiUtilites.errorSnackbar(
          "", "Location permission denied or services are disabled.");
      return;
    }

    if (await FlutterBluePlus.isSupported == false) {
      isSearching = false;
      update();
      print("Bluetooth not supported by this device");

      return;
    }
    isSearching = true;
    update();
    Get.find<MainController>().update();
    serviceDataKeys = [];
    scannedUsers = [];
    FlutterBluePlus.adapterState.listen((BluetoothAdapterState state) {
      if (state == BluetoothAdapterState.on) {
         _hasShownBluetoothOffSnackbar = false;

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
                  if (ee.advertisementData.advName != '') {
                    serviceDataKeys.add(ee.advertisementData.advName);
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
      }
       else if(state == BluetoothAdapterState.off) {
       if (!_hasShownBluetoothOffSnackbar) {
          _hasShownBluetoothOffSnackbar = true; // Set the flag to true
          UiUtilites.errorSnackbar("", "Bluetooth is turned off.");
        }
      }
      return;
    });

    if (Platform.isAndroid) {
      await FlutterBluePlus.turnOn();
    }
    await FlutterBluePlus.startScan(timeout: Duration(seconds: 5));
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
      scannedUsers = [];

      for (var element in response['users']) {
        scannedUsers.add(UserModel.fromJson(element));
      }
      FirebaseAnalytics.instance.logEvent(
        name: 'scan_users',
        parameters: <String, Object>{
          'found': scannedUsers.length,
        },
      );
    }
    isSearching = false;
    mainController.update();
    update();
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
    if (event.data != null && event.eventName == "emoji-gifted") {
      Map<String, dynamic> data = json.decode(event.data!);
      UiUtilites.EmojiGiftPopUp(Get.context,
          text: data['message'] ?? "",
          imageUrl: data['emoji'],
          senderImage: data['senderImage'],
          senderName: data['senderName']);
    }

    if (event.data != null && event.eventName == "my-event") {
      Map<String, dynamic> data = json.decode(event.data!);
      // UserModel user = UserModel.fromJson(data['user']);
      ProfileRequestModel requestModel =
          ProfileRequestModel.fromJson(data['profileRequest']);
      showPopup(
          data['message'], data['userName'], data['userImage'], requestModel);
    }

    if (event.data != null && event.eventName == "profile-access") {
      Map<String, dynamic> data = json.decode(event.data!);

      String status = data['status'];
      String userName = data['name'];
      if (data['requestType'] == "profile") {
        if (status == "accepted") {
          String name = "$userName has accepted your request".tr;
          UiUtilites.successSnackbar(
              name.toString(), "Profile Request Access".tr);
        } else {
          String name = "$userName has rejected your request".tr;
          UiUtilites.errorSnackbar(
              "Profile Request Access".tr, name.toString());
        }
      } else {
        if (status == "accepted") {
          String name = "$userName has accepted your request".tr;
          UiUtilites.successSnackbar(
              name.toString(), "Social Request Access".tr);
          updatePublicProfile();
        } else {
          String name = "$userName has rejected your request".tr;
          UiUtilites.errorSnackbar("Social Request Access".tr, name.toString());
        }
      }
      update();
    }
  }

  void onDecryptionFailure(String event, String reason) {
    log("onDecryptionFailure: $event reason: $reason");
  }

  dynamic onAuthorizer(
      String channelName, String socketId, dynamic options) async {
    log('Channel Name: $channelName, Socket Id: $socketId, Options: $options');
  }

  void showPopup(String message, String? userName, String? userImage,
      ProfileRequestModel profileRequestModel) {
    Get.dialog(
      barrierDismissible: false,
      ProfileRequestPopup(
        name: userName ?? "",
        imageUrl: userImage ??
            'https://avatar.iran.liara.run/public/boy?username=${userName ?? ""}',
        requestMessage: profileRequestModel.requestType == "profile"
            ? 'Would like to view your profile.'.tr
            : 'Would like to view your social media  \n accounts and business card.'
                .tr,
        onAcceptTap: () {
          respondRequest(profileRequestModel, "accepted".tr);
          Get.back();
        },
        onRejectTap: () {
          respondRequest(profileRequestModel, "rejected".tr);
          Get.back();
        },
      ),
    );
  }

  // Handle Requests Logic

  sendRequest(UserModel user) async {
    var response =
        await RequestApi.sendRequest(user: user, requestType: "profile");

    if (response.isNotEmpty) {
      if (response['Request'] == "Sent") {
        FirebaseAnalytics.instance.logEvent(
          name: 'send_profile_request',
        );
        UiUtilites.successSnackbar("Request to access profile has been sent".tr,
            "Access Profile Request".tr);
      } else if (response['Request'] == "Access") {
        Get.toNamed(AppRoutes.publicProfile, arguments: user.currentProfile)!
            .then((value) {
          getUser();
        });
      }
    }
  }

  void updatePublicProfile() {
    PublicProfileController publicProfileController =
        Get.find<PublicProfileController>();
    publicProfileController.updateData();
  }

  respondRequest(ProfileRequestModel requestModel, String status) async {
    var response = await RequestApi.respondRequest(
        profileRequestModel: requestModel, status: status);

    if (response.isNotEmpty) {
      if (status == "accepted") {
        FirebaseAnalytics.instance.logEvent(
          name: 'accepted_profile_request',
        );
      } else {
        FirebaseAnalytics.instance.logEvent(
          name: 'rejected_profile_request',
        );
      }
    }
  }

  // Block and report

  blockProfile(UserModel user) async {
    var response = await BlockReportApi.blockProfile(user.currentProfile?.id);
    if (response.isNotEmpty) {
      scannedUsers.remove(user);
      update();
      UiUtilites.successSnackbar(response['message'], "");
    }
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
