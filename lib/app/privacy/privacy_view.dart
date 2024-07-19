// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:find_me/app/privacy/components/privacy_card.dart';
import 'package:find_me/app/privacy/privacy_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

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
            backgroundColor: AppColors.grey,
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
                  child: SizedBox(
                height: Get.height,
                child: ListView.builder(
                    itemCount: controller.userModel?.profiles?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      final profileId =
                          controller.userModel!.profiles![index].id;
                      return PrivacyCard(
                        publicValue: controller
                                .profileGrantAccess[profileId.toString()] ??
                            false,
                        publicOnTab: (value) {
                          controller.toggleProfileGrantAccess(
                              profileId.toString(), value);
                          controller.profilePrivacy(profileId.toString());
                        },
                        socialValue: controller
                                .socialGrantAccess[profileId.toString()] ??
                            false,
                        socialOnTab: (value) {
                          controller.toggleSocialGrantAccess(
                              profileId.toString(), value);
                          controller.profilePrivacy(profileId.toString());
                        },
                        image:
                            controller.userModel!.profiles![index].isVerified ==
                                    true
                                ? "assets/icons/verified.svg"
                                : "",
                        userProfile:
                            controller.userModel!.profiles![index].name,
                      );
                    }),
              )),
            )));
  }
}
