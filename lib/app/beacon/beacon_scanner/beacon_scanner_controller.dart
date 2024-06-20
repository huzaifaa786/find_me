import 'package:find_me/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_beacon/flutter_beacon.dart';

class BeaconScannerController extends GetxController {
  static BeaconScannerController instance = Get.find();
  TextEditingController emailController = TextEditingController();
  Stream<RangingResult>? streamRanging;

  @override
  void onInit() {
    initBeacon();
    super.onInit();
  }

  void initBeacon() async {
    try {
      await flutterBeacon.initializeAndCheckScanning;
    } on PlatformException catch (e) {
      UiUtilites.errorSnackbar("ERROR", e.message.toString());
    }

    final regions = <Region>[Region(identifier: 'com.beacon')];

    streamRanging = flutterBeacon.ranging(regions);
    update();
  }
}
