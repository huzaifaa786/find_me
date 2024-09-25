import 'dart:async';

import 'package:find_me/app/languages/language_card.dart';
import 'package:find_me/app/user_account/user_account_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/components/cards/user_information_card.dart';
import 'package:find_me/routes/app_routes.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class UserAccountView extends StatefulWidget {
  const UserAccountView({super.key});

  @override
  State<UserAccountView> createState() => _UserAccountViewState();
}

class _UserAccountViewState extends State<UserAccountView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserAccountController>(
        initState: (state) {
          Future.delayed(Duration(milliseconds: 100), () {
            state.controller!.getUser();
          });
        },
        builder: (controller) => Scaffold(
              appBar: AppBar(
                toolbarHeight: 83.h,
                title: topBar(name: 'Account'.tr),
                scrolledUnderElevation: 0,
                automaticallyImplyLeading: false,
              ),
              body: SafeArea(
                  child: controller.userModel != null
                      ? Container(
                          padding: EdgeInsets.only(
                            left: 35,
                            right: 35,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'My information'.tr,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Gap(18),
                                UserInformationCard(
                                  firstname:
                                      controller.userModel!.firstName ?? "",
                                  lastname:
                                      controller.userModel!.lastName ?? "",
                                  username: controller.userModel!.name ?? "",
                                  userid: controller.userModel!.id.toString(),
                                  userbirthday: controller.userModel!.dob ?? "",
                                  usermobilenumber:
                                      controller.userModel!.phone ?? "",
                                  useremialid:
                                      controller.userModel!.email ?? "",
                                ),
                                Gap(15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Settings'.tr,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Gap(18),
                                Container(
                                  margin: EdgeInsets.only(bottom: 15),
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
                                        offset: Offset(
                                            -2, -2), // Shadow for top and left
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      ListTile(
                                        title: Text(
                                          'Change my information'.tr,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        trailing: Icon(
                                          Icons.chevron_right,
                                          color: Colors.grey,
                                        ),
                                        onTap: () {
                                          Get.toNamed(AppRoutes
                                                  .editaccountinformation)!
                                              .then((value) {
                                            controller.getUser();
                                          });
                                        },
                                      ),
                                      Divider(
                                        thickness: 1,
                                        color: Colors.grey.withOpacity(0.3),
                                      ),
                                      ListTile(
                                        title: Text(
                                          'Change mobile number'.tr,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        trailing: Icon(
                                          Icons.chevron_right,
                                          color: Colors.grey,
                                        ),
                                        onTap: () {
                                          Get.toNamed(
                                                  AppRoutes.changephonenumber)!
                                              .then((value) {
                                            controller.getUser();
                                          });
                                        },
                                      ),
                                      Divider(
                                        thickness: 1,
                                        color: Colors.grey.withOpacity(0.3),
                                      ),
                                      ListTile(
                                        title: Text(
                                          'Change email'.tr,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        trailing: Icon(
                                          Icons.chevron_right,
                                          color: Colors.grey,
                                        ),
                                        onTap: () {
                                          Get.toNamed(AppRoutes.change_email)!
                                              .then((value) {
                                            controller.getUser();
                                          });
                                        },
                                      ),
                                      Divider(
                                        thickness: 1,
                                        color: Colors.grey.withOpacity(0.3),
                                      ),
                                      ListTile(
                                        title: Text(
                                          'Change password'.tr,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        trailing: Icon(
                                          Icons.chevron_right,
                                          color: Colors.grey,
                                        ),
                                        onTap: () {
                                          Get.toNamed(AppRoutes.changepassword)!
                                              .then((value) {
                                            controller.getUser();
                                          });
                                        },
                                      ),
                                      Divider(
                                        thickness: 1,
                                        color: Colors.grey.withOpacity(0.3),
                                      ),
                                      ListTile(
                                        title: Text(
                                          'Delete Account'.tr,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        trailing: Icon(
                                          Icons.chevron_right,
                                          color: Colors.grey,
                                        ),
                                        onTap: () {
                                          UiUtilites.accountAlert(context,
                                              text:
                                                  "Are you sure you want to delete your account?",
                                              onTapYes: () {
                                            controller.deleteAccount();
                                          }, onTapNo: () {
                                            Get.back();
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      : SizedBox()),
            ));
  }
}
