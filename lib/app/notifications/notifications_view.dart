// ignore_for_file: prefer_const_constructors

import 'package:find_me/app/auth/components/auth_appbar.dart';
import 'package:find_me/app/notifications/notifications_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationsController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          forceMaterialTransparency: true,
          title: topBar(name: 'Notifications'),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: Column(
              children: [
                // Container(
                //     decoration: BoxDecoration(border: Border.all()),
                //     child: topBar(name: 'Notifications')),
                Row(
                  children: [Text('data')],
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
