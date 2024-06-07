// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_me/app/auth/components/auth_appbar.dart';
import 'package:find_me/app/auth/components/auth_rich_text.dart';
import 'package:find_me/app/notifications/components/notification_permission.dart';
import 'package:find_me/app/notifications/components/notification_tile.dart';
import 'package:find_me/app/notifications/components/subscription_notification.dart';
import 'package:find_me/app/notifications/notifications_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class NotificationsView extends StatelessWidget {
   NotificationsView({super.key});
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
                Gap(15.h),
                NotificationPermissionTile(
                  img:
                      'https://as1.ftcdn.net/v2/jpg/03/46/83/96/1000_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg',
                  msg: 'Ahmed mohammed wants to send you a file',
                  onAccepttap: () {
                    print('accept');
                  },
                  onRejecttap: () {
                    print('reject');
                  },
                ),
                Gap(11.h),
                Divider(
                  thickness: 1,
                  color: AppColors.black.withOpacity(0.08),
                  height: 1,
                ),
                Gap(6.h),
                NotificationTile(
                  isrejected: true,
                  buttonclr: true,
                  status: 1,
                  img:
                      'https://as1.ftcdn.net/v2/jpg/03/46/83/96/1000_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg',
                  msg: 'Khaledx4  sent you a file',
                  ontap: () {
                    print('view file');
                  },
                ),
                Gap(15.h),
                Divider(
                  thickness: 1,
                  color: AppColors.black.withOpacity(0.08),
                  height: 1,
                ),
                Gap(6.h),
                NotificationTile(
                  isrejected: true,
                  buttonclr: true,
                  status: 2,
                  img:
                      'https://as1.ftcdn.net/v2/jpg/03/46/83/96/1000_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg',
                  msg: 'Khaledx4  sent you a emoji',
                  ontap: () {
                    print('view file');
                  },
                ),
                Gap(15.h),
                Divider(
                  thickness: 1,
                  color: AppColors.black.withOpacity(0.08),
                  height: 1,
                ),
                Gap(25.h),
                SubscriptionNotificationTile(
                  daycount: '3',
                  title: 'Three days left!',
                  msg:
                      'There are three days left until your subscription to the weekly package ends',
                  ontap: () {
                    print('view sub');
                  },
                ),
                Gap(15.h),
                Divider(
                  thickness: 1,
                  color: AppColors.black.withOpacity(0.08),
                  height: 1,
                ),
                Gap(6.h),
                NotificationTile(
                  isrejected: false,
                  buttonclr: false,
                  status: 3,
                  img:
                      'https://as1.ftcdn.net/v2/jpg/03/46/83/96/1000_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg',
                  msg: 'Khaledx4  sent you a emoji',
                  ontap: () {
                    print('view file');
                  },
                ),
                Gap(15.h),
                Divider(
                  thickness: 1,
                  color: AppColors.black.withOpacity(0.08),
                  height: 1,
                ),
                Gap(15.h),
                NotificationPermissionTile(
                  img:
                      'https://as1.ftcdn.net/v2/jpg/03/46/83/96/1000_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg',
                  msg: 'Ahmed mohammed wants to send you a file',
                  onAccepttap: () {
                    print('accept');
                  },  
                  onRejecttap: () {
                    print('reject');
                  },
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
