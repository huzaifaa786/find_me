// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'location_controller.dart';

class LocationView extends StatefulWidget {
  const LocationView({super.key});

  @override
  _LocationViewState createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  // Initialize the controller
  final LocationController controller = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: topBar(name: 'Location'),
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        child: GetBuilder<LocationController>(
          builder: (controller) {
            return Column(
              children: [
                Gap(63.h),
                Row(
                  children: [
                    Gap(59.w),
                    Expanded(
                      child: AppText(
                        title: 'Allow the application to access your location',
                        size: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Switch(
                      value: controller.isLocationEnabled,
                      onChanged: (value) {
                        controller.toggleLocation(value);
                      },
                      activeColor: AppColors.primary_color,
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
