// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:find_me/app/privacy/privacy_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/components/buttons/text_switch_button.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class PrivacyView extends StatefulWidget {
  const PrivacyView({super.key});

  @override
  State<PrivacyView> createState() => _PrivacyViewState();
}

class _PrivacyViewState extends State<PrivacyView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PrivacyController>(
        builder: (controller) => Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              scrolledUnderElevation: 0,
              title: topBar(
                name: "Privacy",
                showBackIcon: true,
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 34.w),
                  child: Column(
                    children: [
                      Gap(56),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: AppText(
                          title: "Profile",
                          size: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Gap(27),
                      TextSwitchButton(
                        title: "Grant access",
                        value: controller.profilegrantAccess,
                        size: 12.sp,
                        FontWeight: FontWeight.w400,
                        ontoggle: (value) {
                          setState(() {
                            controller.profilegrantAccess = value;
                            if (value) {
                              controller.profilereceiveRequest = false;
                            }
                          });
                        },
                      ),
                      Gap(21),
                      TextSwitchButton(
                          title: "Receive request",
                          size: 12.sp,
                          FontWeight: FontWeight.w400,
                          value: controller.profilereceiveRequest,
                          ontoggle: (value) {
                            setState(() {
                              controller.profilereceiveRequest = value;
                              if (value) {
                                controller.profilegrantAccess = false;
                              }
                            });
                          }),
                      Gap(37.5),
                      Divider(
                        thickness: 1,
                        color: AppColors.black.withOpacity(0.08),
                      ),
                      Gap(22.5),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: AppText(
                          title: "Social media & Business card",
                          size: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Gap(27),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextSwitchButton(
                              title: "Grant access",
                              size: 12.sp,
                              FontWeight: FontWeight.w400,
                              value: controller.socialMediagrantAccess,
                              ontoggle: (value) {
                                setState(() {
                                  controller.socialMediagrantAccess = value;
                                  if (value) {
                                    controller.socialMediaRequest = false;
                                  }
                                });
                              },
                            ),
                            TextSwitchButton(
                                title: "Receive request",
                                size: 12.sp,
                                FontWeight: FontWeight.w400,
                                value: controller.socialMediaRequest,
                                ontoggle: (value) {
                                  setState(() {
                                    controller.socialMediaRequest = value;
                                    if (value) {
                                      controller.socialMediagrantAccess = false;
                                    }
                                  });
                                }),
                          ]),
                      Gap(21),
                    ],
                  ),
                ),
              ),
            )));
  }
}
