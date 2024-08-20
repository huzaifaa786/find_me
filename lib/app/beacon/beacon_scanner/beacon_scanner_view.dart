// ignore_for_file: prefer_const_constructors

import 'package:find_me/app/beacon/beacon_scanner/beacon_scanner_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class BeaconScannerView extends StatelessWidget {
  const BeaconScannerView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BeaconScannerController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                scrolledUnderElevation: 0,
                title: topBar(name: 'Beacon Scanner'.tr),
              ),
              body: Container(
                height: Get.height,
                child: Column(
                  children: [
                    Container(
                      height: Get.height * 0.5,
                      child: ListView.builder(
                        itemCount: controller.users.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () async {},
                            title: Text(controller.users[index].name!),
                            subtitle:
                                Text(controller.users[index].phone.toString()),
                          );
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controller.fetchBluetoothAddress();
                      },
                      child: FlutterBluePlus.isScanningNow
                          ? Container(
                              width: Get.width * 0.3,
                              padding: EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Text("Scaning".tr),
                                  Gap(10),
                                  CircularProgressIndicator(
                                    strokeWidth: 1,
                                  ),
                                ],
                              ),
                            )
                          : Text("Scan Now".tr),
                    )
                  ],
                ),
              ),
            ));
  }
}
