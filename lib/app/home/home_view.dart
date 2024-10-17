// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, deprecated_member_use, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:cached_network_image/cached_network_image.dart';

import 'package:find_me/app/home/components/home_gif_button.dart';
import 'package:find_me/app/home/components/home_appbar.dart';
import 'package:find_me/app/home/components/user_card.dart';
import 'package:find_me/app/main_view/main_controller.dart';
import 'package:find_me/app/public_profile/public_profile_controller.dart';
import 'package:find_me/components/buttons/app_button.dart';
import 'package:find_me/helpers/subscription_manager.dart';
import 'package:find_me/routes/app_routes.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key});
  GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      autoRemove: false,
      initState: (state) {
        Future.delayed(Duration(milliseconds: 100), () {
          state.controller!.getUser();
        });
      },
      builder: (controller) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          title: homeAppBar(),
        ),
        body: Directionality(
          textDirection: box.read('locale') != 'ar'
              ? TextDirection.ltr
              : TextDirection.rtl,
          child: SafeArea(
            child: controller.userModel != null
                ? Column(
                    children: [
                      // Gap(35.h),
                      Row(
                        children: [
                          Gap(34.w),
                          Container(
                            height: 77,
                            width: 77,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(80.r),
                              child: controller.selectedItem.avatarUrl != null
                                  ? CachedNetworkImage(
                                      imageUrl:
                                          controller.selectedItem.avatarUrl!,
                                      fit: BoxFit.cover,
                                    )
                                  : SvgPicture.asset("assets/images/User.svg"),
                            ),
                          ),
                          Gap(11.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ConstrainedBox(
                                constraints: BoxConstraints(minWidth: 120.w),
                                child: SizedBox(
                                  // height: 50.h,
                                  child: ButtonTheme(
                                    child: DropdownButton<DropdownItem>(
                                      icon: null,
                                      iconSize: 0,
                                      hint: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize:
                                            MainAxisSize.min, // Add this
                                        children: [
                                          AppText(
                                            title: "Appears as".tr,
                                            color: AppColors.primary_color,
                                            size: 14.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          Gap(5.w),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 4.0),
                                            child: SvgPicture.asset(
                                              'assets/icons/arrow_down.svg',
                                            ),
                                          ),
                                        ],
                                      ),
                                      elevation: 1,
                                      borderRadius: BorderRadius.circular(20.r),
                                      items:
                                          controller.dropdownItems.map((item) {
                                        return DropdownMenuItem<DropdownItem>(
                                          value: item,
                                          child: item.text == "edit"
                                              ? Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    CircleAvatar(
                                                      backgroundColor: AppColors
                                                          .primary_color,
                                                      radius: 12,
                                                      child: Icon(
                                                        Icons.edit,
                                                        color: Colors.white,
                                                        size: 16,
                                                      ),
                                                    ),
                                                    SizedBox(width: 10.w),
                                                    AppText(
                                                      title: 'Edit Profiles'.tr,
                                                      color: AppColors
                                                          .primary_color,
                                                      size: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ],
                                                )
                                              : item.text == "add"
                                                  ? Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        CircleAvatar(
                                                          backgroundColor:
                                                              AppColors
                                                                  .primary_color,
                                                          radius: 12,
                                                          child: Icon(
                                                            Icons.add,
                                                            color: Colors.white,
                                                            size: 16,
                                                          ),
                                                        ),
                                                        SizedBox(width: 10.w),
                                                        AppText(
                                                          title:
                                                              'New profile'.tr+' ${controller.dropdownItems.length}'
                                                                  .tr,
                                                          color: AppColors
                                                              .primary_color,
                                                          size: 14.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ],
                                                    )
                                                  : Column(
                                                      children: [
                                                        Flexible(
                                                          child: Row(
                                                            children: [
                                                              CircleAvatar(
                                                                backgroundColor:
                                                                    Colors
                                                                        .white,
                                                                radius: 15.r,
                                                                child: ClipOval(
                                                                  child: item.avatarUrl !=
                                                                          null
                                                                      ? CachedNetworkImage(
                                                                          imageUrl:
                                                                              item.avatarUrl ?? '',
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          width:
                                                                              30.r,
                                                                          height:
                                                                              30.r,
                                                                        )
                                                                      : SvgPicture
                                                                          .asset(
                                                                              "assets/images/User.svg"),
                                                                ),
                                                              ),
                                                              Gap(10.w),
                                                              Text(
                                                                item.text ?? '',
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .justify,
                                                              ),
                                                              Gap(3.w),
                                                              if (item.verified)
                                                                SvgPicture.asset(
                                                                    'assets/icons/verified.svg'),
                                                            ],
                                                          ),
                                                        ),
                                                        Divider(
                                                          thickness: 0.3,
                                                          color:
                                                              Color(0x13000000),
                                                          indent: 16.0,
                                                          endIndent: 16.0,
                                                        ),
                                                      ],
                                                    ),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        if (value != null) {
                                          if (value.text == "add" ||
                                              value.text == "edit") {
                                            Get.find<MainController>()
                                                .onChange(3);
                                          } else {
                                            controller.selectItem(value);
                                          }
                                        }
                                      },
                                      underline: Container(),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  AppText(
                                    title: controller.selectedItem.text ?? '',
                                    size: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  Gap(15),
                                  if (controller.selectedItem.verified)
                                    SvgPicture.asset(
                                        'assets/icons/verified.svg')
                                ],
                              ),
                              Gap(10.h),
                            ],
                          ),
                        ],
                      ),
                      Gap(
                        20,
                      ),

                      Divider(
                        color: AppColors.border_grey,
                        endIndent: 16.w,
                        indent: 16.w,
                        thickness: 3.h,
                        height: 1.h,
                      ),
                      Gap(15.h),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 48),
                            child: controller.isSearching ||
                                    controller.isInternetChecking
                                ? Center(
                                    heightFactor: 10.h,
                                    child: AppText(
                                      title: controller.isInternetChecking
                                          ? 'Checking Connections...'.tr
                                          : 'Keep searching...'.tr,
                                      color: AppColors.black,
                                      textAlign: TextAlign.center,
                                      size: 14.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                : controller.scannedUsers.isNotEmpty
                                    ? GridView.builder(
                                        key: UniqueKey(),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        physics: NeverScrollableScrollPhysics(),
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          mainAxisSpacing: 15.h,
                                          crossAxisSpacing: 15.0,
                                          mainAxisExtent: 100.h,
                                        ),
                                        itemCount:
                                            controller.scannedUsers.length,
                                        itemBuilder: (context, index) {
                                          bool isFreeUser =
                                              !SubscriptionManager().isProUser;
                                          bool isBlurred =
                                              isFreeUser && index >= 6;
                                          return UserCard(
                                            key: ValueKey(controller.scannedUsers[index].id),
                                            user:
                                                controller.scannedUsers[index],
                                            isBlur: isBlurred,
                                            onTap: () {
                                              final selectedUser = controller.scannedUsers[index];

                                              if (isFreeUser && index >= 6) {
                                                UiUtilites.accountUpgradeAlert(
                                                    context, controller);
                                              } else {
                                                Get.delete<
                                                    PublicProfileController>();
                                                showModalBottomSheet(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return Container(
                                                    
                                                      height: 250,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          ListTile(
                                                            dense: true,
                                                            minTileHeight: 48.0,
                                                            leading: Icon(Icons
                                                                .visibility),
                                                            title: AppText(
                                                              size: 14,
                                                              title:
                                                                  'View Profile'
                                                                      .tr,
                                                            ),
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                              if (selectedUser
                                                                  .currentProfile!
                                                                  .isProfilePublic) {
                                                                Get.toNamed(
                                                                        AppRoutes
                                                                            .publicProfile,
                                                                        arguments: selectedUser
                                                                            .currentProfile)!
                                                                    .then(
                                                                        (value) {
                                                                  controller
                                                                      .getUser();
                                                                });
                                                              } else {
                                                                controller.sendRequest(
                                                                   selectedUser);
                                                              }
                                                            },
                                                          ),
                                                          Divider(
                                                            thickness: 1,
                                                            color: AppColors
                                                                .black
                                                                .withOpacity(
                                                                    0.08),
                                                          ),
                                                          ListTile(
                                                            dense: true,
                                                            minTileHeight: 48.0,
                                                            leading: Icon(
                                                                Icons.block),
                                                            title: AppText(
                                                              size: 14,
                                                              title: 'Block'.tr,
                                                            ),
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                              UiUtilites
                                                                  .accountAlert(
                                                                      context,
                                                                      text:
                                                                          "Are you sure you want to block this profile?",
                                                                      onTapYes:
                                                                          () {
                                                                Get.back();
                                                                controller.blockProfile(
                                                                   selectedUser);
                                                              }, onTapNo: () {
                                                                Get.back();
                                                              });
                                                            },
                                                          ),
                                                          Divider(
                                                            thickness: 1,
                                                            color: AppColors
                                                                .black
                                                                .withOpacity(
                                                                    0.08),
                                                          ),
                                                          ListTile(
                                                            dense: true,
                                                            minTileHeight: 48.0,
                                                            leading: Icon(
                                                                Icons.report),
                                                            title: AppText(
                                                              size: 14,
                                                              title:
                                                                  'Report'.tr,
                                                            ),
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                              Get.toNamed(
                                                                  AppRoutes
                                                                      .reportProfile,
                                                                  arguments: selectedUser
                                                                      .currentProfile);
                                                            },
                                                          ),
                                                          Divider(
                                                            thickness: 1,
                                                            color: AppColors
                                                                .black
                                                                .withOpacity(
                                                                    0.08),
                                                          ),
                                                          ListTile(
                                                            dense: true,
                                                            minTileHeight: 48.0,
                                                            leading: Icon(
                                                              Icons.cancel,
                                                              color:
                                                                  AppColors.red,
                                                            ),
                                                            title: AppText(
                                                              size: 14,
                                                              title:
                                                                  'Cancel'.tr,
                                                              color:
                                                                  AppColors.red,
                                                            ),
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                );
                                              }
                                            },
                                          );
                                        },
                                      )
                                    : Center(
                                        heightFactor: 15,
                                        child: AppText(
                                          title:
                                              "No finders nearby. Refresh or expand your radius.".tr,
                                          size: 12,
                                          fontWeight: FontWeight.w600,
                                          textAlign: TextAlign.center,
                                        )),
                          ),
                        ),
                      ),
                      Gap(25.h),
                    ],
                  )
                : Center(child: Text('')),
          ),
        ),
      ),
    );
  }
}
