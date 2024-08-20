// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
    return Container(
      height: 490.h,
      width: 290.w,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(11.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(2, 2),
          ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(-2, -2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'First Name'.tr,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                Text(
                  'Last Name'.tr,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 66.w,
                    child: Text(
                      firstname.toString()
                      // 'Mohammed ahmed'
                      ,
                      overflow: TextOverflow.visible,
                      maxLines: 3,
                      // textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black.withOpacity(0.6)),
                    ),
                  ),
                  SizedBox(
                    width: 66.w,
                    child: Text(
                        lastname.toString()
                        // 'Mohammed ahmed'
                        ,
                        overflow: TextOverflow.visible,
                        maxLines: 3,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black.withOpacity(0.6))),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.grey.withOpacity(0.3),
          ),
          ListTile(
            title: Text(
              'Username'.tr,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              username
              //'almarwan_4'
              ,
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black.withOpacity(0.6)),
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.grey.withOpacity(0.3),
          ),
          ListTile(
            title: Text(
              'Birthday'.tr,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              userbirthday
              //'8 march 1997'
              ,
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black.withOpacity(0.6)),
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.grey.withOpacity(0.3),
          ),
          ListTile(
            title: Text(
              'Mobile Number'.tr,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              usermobilenumber
              // '0000 0000'
              ,
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black.withOpacity(0.6)),
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.grey.withOpacity(0.3),
          ),
          ListTile(
            title: Text(
              'Email'.tr,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              useremialid,
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black.withOpacity(0.6)),
            ),
          ),
        ],
      ),
    );
  }
}
