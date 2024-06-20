// ignore_for_file: prefer_const_constructors

import 'package:find_me/app/beacon/beacon_scanner/beacon_scanner_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beacon/flutter_beacon.dart';
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
              body: controller.streamRanging == null
                  ? Center(child: CircularProgressIndicator())
                  : StreamBuilder<RangingResult>(
                      stream: controller.streamRanging,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        }

                        return ListView(
                          children: snapshot.data!.beacons.map((beacon) {
                            return ListTile(
                              title:
                                  Text('Beacon UUID: ${beacon.proximityUUID}'),
                              subtitle: Text(
                                  'Major: ${beacon.major}, Minor: ${beacon.minor}'),
                            );
                          }).toList(),
                        );
                      },
                    ),
            ));
  }
}
