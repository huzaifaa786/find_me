// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

class UserInformationCard extends StatelessWidget {
  const UserInformationCard({
    super.key,
    this.firstname,
    this.lastname,
    required this.username,
    required this.userid,
    required this.userbirthday,
    required this.usermobilenumber,
    required this.useremialid,
  });
  final String? firstname;
  final String? lastname;

  final String username;
  final String userid;
  final String userbirthday;
  final String usermobilenumber;
  final String useremialid;
  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    return Container(
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(11.0),
        border: Border.all(color: AppColors.black.withOpacity(0.05)),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.02),
            spreadRadius: 0.1,
            blurRadius: 1,
            offset: Offset(-3, -3), // top-left
          ),
          BoxShadow(
            color: AppColors.black.withOpacity(0.02),
            spreadRadius: 0.1,
            blurRadius: 1,
            offset: Offset(3, -3), // top-right
          ),
          BoxShadow(
            color: AppColors.black.withOpacity(0.02),
            spreadRadius: 0.1,
            blurRadius: 1,
            offset: Offset(-3, 3), // bottom-left
          ),
          BoxShadow(
            color: AppColors.black.withOpacity(0.02),
            spreadRadius: 0.1,
            blurRadius: 1,
            offset: Offset(3, 3), // bottom-right
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            dense: true,
            minTileHeight: 64.0,
            title: AppText(
              title: 'Name'.tr,
              size: 13,
              fontWeight: FontWeight.w500,
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(left: 2, top: 15),
              child: AppText(
                  title: '$firstname $lastname',
                  size: 10,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black.withOpacity(0.65)),
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.grey.withOpacity(0.3),
          ),
          ListTile(
            dense: true,
            minTileHeight: 64.0,
            title: AppText(
              title: 'Username'.tr,
              size: 13,
              fontWeight: FontWeight.w500,
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(left: 2, top: 15),
              child: AppText(
                  title: username,
                  size: 10,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black.withOpacity(0.65)),
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.grey.withOpacity(0.3),
          ),
          ListTile(
            dense: true,
            minTileHeight: 64.0,
            title: AppText(
              title: 'Birthday'.tr,
              size: 13,
              fontWeight: FontWeight.w500,
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(left: 2, top: 15),
              child: Align(
                alignment: box.read("locale") != "ar"
                    ? Alignment.bottomLeft
                    : Alignment.bottomRight,
                child: Directionality(
                  textDirection: ui.TextDirection.ltr,
                  child: AppText(
                      title: DateFormat('dd MMMM yyyy')
                          .format(DateTime.parse(userbirthday)),
                      size: 10,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black.withOpacity(0.65)),
                ),
              ),
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.grey.withOpacity(0.3),
          ),
          ListTile(
            dense: true,
            minTileHeight: 64.0,
            title: AppText(
              title: 'Mobile Number'.tr,
              size: 13,
              fontWeight: FontWeight.w500,
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(left: 2, top: 15),
              child: Align(
                alignment: box.read("locale") != "ar"
                    ? Alignment.bottomLeft
                    : Alignment.bottomRight,
                child: Directionality(
                  textDirection: ui.TextDirection.ltr,
                  child: AppText(
                      title: usermobilenumber,
                      size: 10,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black.withOpacity(0.65)),
                ),
              ),
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.grey.withOpacity(0.3),
          ),
          ListTile(
            dense: true,
            minTileHeight: 64.0,
            title: AppText(
              title: 'Email'.tr,
              size: 13,
              fontWeight: FontWeight.w500,
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(left: 2, top: 15),
              child: AppText(
                  title: useremialid,
                  size: 10,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black.withOpacity(0.65)),
            ),
          ),
        ],
      ),
    );
  }
}
