// ignore_for_file: prefer_const_constructors

import 'package:find_me/app/auth/forgetpassword/forgetpassword_controller.dart';
import 'package:find_me/app/beacon/beacon_broadcaster/beacon_broadcaster_controller.dart';
import 'package:find_me/app/change_email/change_email_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/components/buttons/app_button.dart';
import 'package:find_me/components/textfields/app_textfields.dart';
import 'package:find_me/routes/app_routes.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:find_me/utils/images/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
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
                title: topBar(name: 'Change email'),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Beacon UUID: ${controller.uuid}'),
                    Text(
                        'Major: ${controller.major}, Minor: ${controller.minor}'),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: controller.isBroadcasting
                          ? controller.stopBroadcast
                          : controller.startBroadcast,
                      child: Text(controller.isBroadcasting
                          ? 'Stop Broadcasting'
                          : 'Start Broadcasting'),
                    ),
                  ],
                ),
              ),
            ));
  }
}
