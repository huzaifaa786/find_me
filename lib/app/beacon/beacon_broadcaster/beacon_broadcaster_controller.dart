import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:beacon_broadcast/beacon_broadcast.dart';

class BeaconBroadcasterController extends GetxController {
  static BeaconBroadcasterController instance = Get.find();
  TextEditingController emailController = TextEditingController();
  BeaconBroadcast beaconBroadcast = BeaconBroadcast();
  bool isBroadcasting = false;
  GetStorage box = GetStorage();
  String uuid = '2F234454-CF6D-4A0F-ADF2-F4911BA9FFA6'; // Example UUID
  int major = 1;
  int minor = 1;

  @override
  void onInit() {
    initializeBeaconBroadcast();

    super.onInit();
  }

  void initializeBeaconBroadcast() {
    uuid = box.read('beacon_id');
    beaconBroadcast.setUUID(uuid).setMajorId(major).setMinorId(minor).start();
    update();
  }

  void startBroadcast() {
    beaconBroadcast.start();
    isBroadcasting = true;
    update();
  }

  void stopBroadcast() {
    beaconBroadcast.stop();
    isBroadcasting = false;
    update();
  }
}
