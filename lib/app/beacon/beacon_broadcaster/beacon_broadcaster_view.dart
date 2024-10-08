// ignore_for_file: prefer_const_constructors

import 'package:find_me/app/beacon/beacon_broadcaster/beacon_broadcaster_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ble_peripheral/flutter_ble_peripheral.dart';
import 'package:get/get.dart';

class BeaconBroadcasterView extends StatelessWidget {
  const BeaconBroadcasterView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BeaconBroadcasterController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                scrolledUnderElevation: 0,
                title: topBar(name: 'Beacon BroadCaster'.tr),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Is supported: ${controller.isSupported}'.tr),
                    StreamBuilder(
                      stream: FlutterBlePeripheral().onPeripheralStateChanged,
                      initialData: PeripheralState.unknown,
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        return Text(
                          'State: ${(snapshot.data as PeripheralState).name}',
                        );
                      },
                    ),
                    // StreamBuilder(
                    //     stream: FlutterBlePeripheral().getDataReceived(),
                    //     initialData: 'None',
                    //     builder:
                    //         (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    //       return Text('Data received: ${snapshot.data}');
                    //     },),
                    Text(
                        'Current UUID: ${controller.advertiseData.serviceUuid}'.tr),
                    // Text('Current UUID: ${advertiseData.serviceUuids ?? advertiseData.serviceUuid}'),
                    MaterialButton(
                      onPressed: controller.toggleAdvertise,
                      child: Text(
                        'Toggle advertising'.tr,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .labelLarge!
                            .copyWith(color: Colors.blue),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () async {
                        await FlutterBlePeripheral().start(
                          advertiseData: controller.advertiseData,
                          advertiseSetParameters:
                              controller.advertiseSetParameters,
                          advertisePeriodicData: controller.advertiseData,
                          periodicAdvertiseSettings: controller.periodicAdvertiseSettings,
                        );
                      },
                      child: Text(
                        'Start advertising'.tr,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .labelLarge!
                            .copyWith(color: Colors.blue),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () async {
                        await FlutterBlePeripheral().stop();
                      },
                      child: Text(
                        'Stop advertising'.tr,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .labelLarge!
                            .copyWith(color: Colors.blue),
                      ),
                    ),
               
                    StreamBuilder(
                      stream: FlutterBlePeripheral().onPeripheralStateChanged,
                      initialData: PeripheralState.unknown,
                      builder: (
                        BuildContext context,
                        AsyncSnapshot<PeripheralState> snapshot,
                      ) {
                        return MaterialButton(
                          onPressed: () async {
                            final bool enabled = await FlutterBlePeripheral()
                                .enableBluetooth(askUser: false);
                            if (enabled) {
                              UiUtilites.successSnackbar(
                                  "Bluetooth!".tr, "Bluetooth enabled!".tr);
                            } else {
                              UiUtilites.errorSnackbar(
                                  "Bluetooth!".tr, "Bluetooth not enabled!".tr);
                            }
                          },
                          child: Text(
                            'Enable Bluetooth (ANDROID)'.tr,
                            style: Theme.of(context)
                                .primaryTextTheme
                                .labelLarge!
                                .copyWith(color: Colors.blue),
                          ),
                        );
                      },
                    ),
                    MaterialButton(
                      onPressed: () async {
                        final bool enabled =
                            await FlutterBlePeripheral().enableBluetooth();
                        if (enabled) {
                          UiUtilites.successSnackbar(
                              "Bluetooth!".tr, "Bluetooth enabled!".tr);
                        } else {
                          UiUtilites.errorSnackbar(
                              "Bluetooth!".tr, "Bluetooth not enabled!".tr);
                        }
                      },
                      child: Text(
                        'Ask if enable Bluetooth (ANDROID)'.tr,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .labelLarge!
                            .copyWith(color: Colors.blue),
                      ),
                    ),
                    MaterialButton(
                      onPressed: controller.requestPermissions,
                      child: Text(
                        'Request Permissions'.tr,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .labelLarge!
                            .copyWith(color: Colors.blue),
                      ),
                    ),
                    MaterialButton(
                      onPressed: controller.hasPermissions,
                      child: Text(
                        'Has permissions'.tr,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .labelLarge!
                            .copyWith(color: Colors.blue),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () =>
                          FlutterBlePeripheral().openBluetoothSettings(),
                      child: Text(
                        'Open bluetooth settings'.tr,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .labelLarge!
                            .copyWith(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
