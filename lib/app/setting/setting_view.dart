import 'package:find_me/app/setting/setting_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
        builder: (controller) => Scaffold(
          appBar: AppBar(
          title: topBar(name: 'Change phone number'),
          automaticallyImplyLeading: false,
        ),
              body: SafeArea(
                  child: Column(
                children: [],
              )),
            ));
  }
}
