import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get_storage/get_storage.dart';
import 'location_controller.dart';
import 'package:flutter_switch/flutter_switch.dart';

class LocationView extends StatefulWidget {
  const LocationView({Key? key}) : super(key: key);

  @override
  _LocationViewState createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  final LocationController controller = Get.put(LocationController());
  GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 83.h,
        title: topBar(name: 'Location'.tr, showBackIcon: true),
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        child: GetBuilder<LocationController>(
          builder: (controller) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 34.w),
              child: Column(
                children: [
                  Gap(55.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: AppText(
                          textAlign: box.read('locale') != "ar"
                              ? TextAlign.left
                              : TextAlign.right,
                          title:
                              'Allow the application to access \nyour location'
                                  .tr,
                          size: 13.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Gap(34.w),
                      FlutterSwitch(
                        height: 25.h,
                        width: 45.w,
                        activeColor: AppColors.green,
                        inactiveColor: Colors.grey,
                        value: controller.isLocationEnabled,
                        onToggle: (value) {
                          controller.toggleIsLocationEnabled(value);
                        },
                      ),
                    ],
                  ),
                  Gap(10.h),
                  Align(
                    alignment: box.read('locale') != "ar"
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: AppText(
                      title:
                          "Keeping your location turned on will allow the app to provide the best experience, such as real-time connections, which work better when your location is available."
                              .tr,
                      size: 11,
                      fontWeight: FontWeight.w400,
                      color: AppColors.hintGrey,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
