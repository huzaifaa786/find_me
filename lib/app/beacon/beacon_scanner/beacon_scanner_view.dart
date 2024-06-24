// ignore_for_file: prefer_const_constructors

import 'package:find_me/app/beacon/beacon_scanner/beacon_scanner_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
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
                title: topBar(name: 'Beacon Scanner'),
              ),
              body: controller.devices.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: controller.devices.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () async {
                            await controller.devices[index].connect();
                          },
                          title: Text(controller.devices[index].localName),
                          subtitle: Text(
                              controller.devices[index].remoteId.toString()),
                        );
                      },
                    ),
            ));
  }
}
