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
                title: topBar(name: 'Beacon BroadCaster'),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Is supported: ${controller.isSupported}'),
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
                        'Current UUID: ${controller.advertiseData.serviceUuid}'),
                    // Text('Current UUID: ${advertiseData.serviceUuids ?? advertiseData.serviceUuid}'),
                    MaterialButton(
                      onPressed: controller.toggleAdvertise,
                      child: Text(
                        'Toggle advertising',
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
                        );
                      },
                      child: Text(
                        'Start advertising',
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
                        'Stop advertising',
                        style: Theme.of(context)
                            .primaryTextTheme
                            .labelLarge!
                            .copyWith(color: Colors.blue),
                      ),
                    ),
                    MaterialButton(
                      onPressed: controller.toggleAdvertiseSet,
                      child: Text(
                        'Toggle advertising set for 1 second',
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
                                  "Bluetooth!", "Bluetooth enabled!");
                            } else {
                              UiUtilites.errorSnackbar(
                                  "Bluetooth!", "Bluetooth not enabled!");
                            }
                          },
                          child: Text(
                            'Enable Bluetooth (ANDROID)',
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
                              "Bluetooth!", "Bluetooth enabled!");
                        } else {
                          UiUtilites.errorSnackbar(
                              "Bluetooth!", "Bluetooth not enabled!");
                        }
                      },
                      child: Text(
                        'Ask if enable Bluetooth (ANDROID)',
                        style: Theme.of(context)
                            .primaryTextTheme
                            .labelLarge!
                            .copyWith(color: Colors.blue),
                      ),
                    ),
                    MaterialButton(
                      onPressed: controller.requestPermissions,
                      child: Text(
                        'Request Permissions',
                        style: Theme.of(context)
                            .primaryTextTheme
                            .labelLarge!
                            .copyWith(color: Colors.blue),
                      ),
                    ),
                    MaterialButton(
                      onPressed: controller.hasPermissions,
                      child: Text(
                        'Has permissions',
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
                        'Open bluetooth settings',
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
