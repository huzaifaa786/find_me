import 'package:find_me/app/setting/setting_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/components/buttons/prefix_icon_button.dart';
import 'package:find_me/components/cards/settings_card.dart';
import 'package:find_me/routes/app_routes.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                toolbarHeight: 83.h,
                title: topBar(name: 'Settings'.tr),
                automaticallyImplyLeading: false,
                scrolledUnderElevation: 0,
              ),
              body: SafeArea(
                  child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 34.w),
                  child: Column(
                    children: [
                      Gap(4.h),

                      //Gap(12.h),

                      CardSetting(
                          text: 'Subscriptions'.tr,
                          image: 'assets/icons/star.svg',
                          ontap: () {
                            Get.toNamed(AppRoutes.subscriptions);
                          }),
                      Gap(12.h),
                      CardSetting(
                          text: 'Account'.tr,
                          image: 'assets/icons/user.svg',
                          ontap: () {
                            Get.toNamed(AppRoutes.useraccount);
                          }),
                      Gap(12.h),
                      CardSetting(
                          text: 'Privacy'.tr,
                          image: 'assets/icons/lock (1).svg',
                          ontap: () {
                            Get.toNamed(AppRoutes.privacy);
                          }),
                      Gap(12.h),
                      CardSetting(
                          text: 'Notifications Permissions'.tr,
                          image: 'assets/icons/bell (1).svg',
                          ontap: () {
                            Get.toNamed(AppRoutes.notificationsPermissions);
                          }),
                      Gap(12.h),
                      CardSetting(
                          text: 'Language'.tr,
                          image: 'assets/icons/globe.svg',
                          ontap: () {
                            Get.toNamed(AppRoutes.language);
                          }),
                      Gap(12.h),
                      CardSetting(
                          text: 'Report a problem'.tr,
                          image: 'assets/icons/help-circle.svg',
                          ontap: () {
                            Get.toNamed(AppRoutes.report);
                          }),
                      Gap(12.h),
                      CardSetting(
                          text: 'Location'.tr,
                          image: 'assets/icons/map-pin.svg',
                          ontap: () {
                            Get.toNamed(AppRoutes.location);
                          }),
                      Gap(12.h),
                      CardSetting(
                          text: 'Support'.tr,
                          image: 'assets/icons/headphones.svg',
                          ontap: () {
                            Get.toNamed(AppRoutes.support);
                          }),
                      Gap(12.h),
                      CardSetting(
                          text: 'Terms & Policies'.tr,
                          image: 'assets/icons/shield.svg',
                          ontap: () {
                            Get.toNamed(AppRoutes.policies);
                          }),
                      Gap(60.h),
                      GestureDetector(
                        onTap: () async {
                          UiUtilites.logoutSuccessAlert(context, () async {
                            GetStorage box = GetStorage();
                            await box.remove('api_token');
                            await box.remove('beacon_id');
                            Get.offAllNamed(AppRoutes.intro);
                          }, () {
                            Get.back();
                          });
                        },
                        child: PrefixIconButton(
                          height: 55.h,
                          width: 304.w,
                          title: 'Log out'.tr,
                          textColors: Colors.red,
                          borderColor: Colors.red,
                          image: 'assets/icons/log-out.svg',
                        ),
                      )
                    ],
                  ),
                ),
              )),
            ));
  }
}
