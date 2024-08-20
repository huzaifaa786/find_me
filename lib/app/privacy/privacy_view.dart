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
      builder: (controller) {
        // Determine the total number of profiles to display
        final int totalProfiles = 4;

        return Scaffold(
          backgroundColor: AppColors.grey,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            scrolledUnderElevation: 0,
            title: topBar(
              name: "Privacy".tr,
              showBackIcon: true,
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: SizedBox(
                height: Get.height,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: totalProfiles, // Always display 4 items
                  itemBuilder: (BuildContext context, int index) {
                    // Check if the profile exists
                    bool profileExists =
                        index < (controller.userModel?.profiles?.length ?? 0);

                    final profile = profileExists
                        ? controller.userModel!.profiles![index]
                        : null;

                    return PrivacyCard(
                      // Show settings only if the profile exists
                      publicValue: profileExists
                          ? (controller
                                  .profileGrantAccess[profile!.id.toString()] ??
                              false)
                          : false,
                      publicOnTab: profileExists
                          ? (value) {
                              controller.toggleProfileGrantAccess(
                                  profile!.id.toString(), value);
                              controller.profilePrivacy(profile.id.toString());
                            }
                          : null,
                      socialValue: profileExists
                          ? (controller
                                  .socialGrantAccess[profile!.id.toString()] ??
                              false)
                          : false,
                      socialOnTab: profileExists
                          ? (value) {
                              controller.toggleSocialGrantAccess(
                                  profile!.id.toString(), value);
                              controller.profilePrivacy(profile.id.toString());
                            }
                          : null,
                      image: profileExists && profile!.isVerified
                          ? "assets/icons/verified.svg"
                          : "",
                      userProfile: profileExists
                          ? profile!.name
                          : "Profile ${index + 1} (Not created)",
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
