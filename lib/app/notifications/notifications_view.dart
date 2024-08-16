// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:find_me/app/notifications/notifications_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/models/notification_model.dart';


import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';


NotificationModel? notifications;

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
          toolbarHeight: 83.h,
          title: topBar(name: 'Notifications'.tr),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 15,
                    top: 30,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Today".tr,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),

                ListView.builder(
                  itemCount: controller.notificationss.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () async {},
                      title: Text(controller.notificationss[index].title!),
                      subtitle: Text(
                        controller.notificationss[index].body.toString(),
                      ),
                    );
                  },
                ),
                // NotificationPermissionTile(
                //   img:
                //       'https://as1.ftcdn.net/v2/jpg/03/46/83/96/1000_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg',
                //   msg: 'Ahmed mohammed wants to send you a file',
                //   onAccepttap: () {
                //     print('accept');
                //   },
                //   onRejecttap: () {
                //     print('reject');
                //   },
                // ),
                // Gap(11.h),
                // Divider(
                //   thickness: 1,
                //   color: AppColors.black.withOpacity(0.08),
                //   height: 1,
                // ),
                // Gap(6.h),
                // NotificationTile(
                //   isrejected: true,
                //   buttonclr: true,
                //   status: 1,
                //   img:
                //       'https://as1.ftcdn.net/v2/jpg/03/46/83/96/1000_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg',
                //   msg: 'Khaledx4  sent you a file',
                //   ontap: () {
                //     print('view file');
                //   },
                // ),
                // Gap(15.h),
                // Divider(
                //   thickness: 1,
                //   color: AppColors.black.withOpacity(0.08),
                //   height: 1,
                // ),
                // Gap(6.h),
                // NotificationTile(
                //   isrejected: true,
                //   buttonclr: true,
                //   status: 2,
                //   img:
                //       'https://as1.ftcdn.net/v2/jpg/03/46/83/96/1000_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg',
                //   msg: 'Khaledx4  sent you a emoji',
                //   ontap: () {
                //     print('view file');
                //   },
                // ),
                // Gap(15.h),
                // Divider(
                //   thickness: 1,
                //   color: AppColors.black.withOpacity(0.08),
                //   height: 1,
                // ),
                // Gap(25.h),
                // SubscriptionNotificationTile(
                //   daycount: '3',
                //   title: 'Three days left!',
                //   msg:
                //       'There are three days left until your subscription to the weekly package ends',
                //   ontap: () {
                //     print('view sub');
                //   },
                // ),
                // Gap(15.h),
                // Divider(
                //   thickness: 1,
                //   color: AppColors.black.withOpacity(0.08),
                //   height: 1,
                // ),
                // Gap(6.h),
                // NotificationTile(
                //   isrejected: false,
                //   buttonclr: false,
                //   status: 3,
                //   img:
                //       'https://as1.ftcdn.net/v2/jpg/03/46/83/96/1000_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg',
                //   msg: 'Khaledx4  sent you a emoji',
                //   ontap: () {
                //     print('view file');
                //   },
                // ),
                // Gap(15.h),
                // Divider(
                //   thickness: 1,
                //   color: AppColors.black.withOpacity(0.08),
                //   height: 1,
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //     bottom: 18,
                //     top: 21,
                //   ),
                //   child: Align(
                //     alignment: Alignment.centerLeft,
                //     child: Text(
                //       "Yesterday",
                //       textAlign: TextAlign.start,
                //       style: TextStyle(
                //           fontSize: 14.sp, fontWeight: FontWeight.w600),
                //     ),
                //   ),
                // ),
                // //
                // // Gap(15.h),
                // NotificationPermissionTile(
                //   img:
                //       'https://as1.ftcdn.net/v2/jpg/03/46/83/96/1000_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg',
                //   msg: 'Ahmed mohammed wants to send you a file',
                //   onAccepttap: () {
                //     print('accept');
                //   },
                //   onRejecttap: () {
                //     print('reject');
                //   },
                // ),
                // Gap(15.h),
                // Divider(
                //   thickness: 1,
                //   color: AppColors.black.withOpacity(0.08),
                //   height: 1,
                // ),
                // Gap(24.h),
                // SubscriptionNotificationTile(
                //   daycount: '3',
                //   title: 'Three days left!',
                //   msg:
                //       'There are three days left until your subscription to the weekly package ends',
                //   ontap: () {
                //     print('view sub');
                //   },
                // ),
                // Gap(15.h),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
