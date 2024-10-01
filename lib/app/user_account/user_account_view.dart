import 'dart:async';

import 'package:find_me/app/languages/language_card.dart';
import 'package:find_me/app/user_account/user_account_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/components/cards/user_information_card.dart';
import 'package:find_me/routes/app_routes.dart';
import 'package:find_me/utils/app_text/app_text.dart';
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: AppText(
                                      title: 'My information'.tr,
                                      size: 14,
                                      fontWeight: FontWeight.w600),
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
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: AppText(
                                      title: 'Settings'.tr,
                                      size: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                Gap(18),
                                Container(
                                  margin: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(11.0),
                                    border: Border.all(
                                        color:
                                            AppColors.black.withOpacity(0.05)),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            AppColors.black.withOpacity(0.02),
                                        spreadRadius: 0.1,
                                        blurRadius: 1,
                                        offset: Offset(-3, -3), // top-left
                                      ),
                                      BoxShadow(
                                        color:
                                            AppColors.black.withOpacity(0.02),
                                        spreadRadius: 0.1,
                                        blurRadius: 1,
                                        offset: Offset(3, -3), // top-right
                                      ),
                                      BoxShadow(
                                        color:
                                            AppColors.black.withOpacity(0.02),
                                        spreadRadius: 0.1,
                                        blurRadius: 1,
                                        offset: Offset(-3, 3), // bottom-left
                                      ),
                                      BoxShadow(
                                        color:
                                            AppColors.black.withOpacity(0.02),
                                        spreadRadius: 0.1,
                                        blurRadius: 1,
                                        offset: Offset(3, 3), // bottom-right
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      ListTile(
                                        dense: true,
                                        minTileHeight: 48.0,
                                        title: Text(
                                          'Change my information'.tr,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600),
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
                                        dense: true,
                                        minTileHeight: 48.0,
                                        title: Text(
                                          'Change password'.tr,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600),
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
                                        dense: true,
                                        minTileHeight: 48.0,
                                        title: Text(
                                          'Change mobile number'.tr,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600),
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
                                        dense: true,
                                        minTileHeight: 48.0,
                                        title: Text(
                                          'Change email'.tr,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600),
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
                                        dense: true,
                                        minTileHeight: 48.0,
                                        title: Text(
                                          'Delete Account'.tr,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        onTap: () {
                                          UiUtilites.accountAlert(context,
                                              text:
                                                  "Are you sure you want to delete your account? This will permanently erase your account.",
                                              onTapYes: () {
                                            controller.deleteAccount();
                                          }, onTapNo: () {
                                            Get.back();
                                          });
                                        },
                                      ),
                                      
                                    ],
                                  ),
                                ),
                                Gap(20),
                              ],
                            ),
                          ),
                        )
                      : SizedBox()),
            ));
  }
}
