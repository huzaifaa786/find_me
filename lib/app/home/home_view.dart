// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, deprecated_member_use, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:cached_network_image/cached_network_image.dart';

import 'package:find_me/app/home/components/home_gif_button.dart';
import 'package:find_me/app/home/components/home_appbar.dart';
import 'package:find_me/app/home/components/user_card.dart';
import 'package:find_me/routes/app_routes.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';

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
                      Gap(35.h),
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
                                  height: 50.h,
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
                                          child: item.avatarUrl == "2"
                                              ? Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    CircleAvatar(
                                                      backgroundColor:
                                                          Colors.blue,
                                                      radius: 12,
                                                      child: Icon(
                                                        Icons.add,
                                                        color: Colors.white,
                                                        size: 16,
                                                      ),
                                                    ),
                                                    SizedBox(width: 10.w),
                                                    AppText(
                                                      title: 'New Profile 2'.tr,
                                                      color: AppColors
                                                          .primary_color,
                                                      size: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ],
                                                )
                                              : item.avatarUrl == "4"
                                                  ? Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        CircleAvatar(
                                                          backgroundColor:
                                                              Colors.blue,
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
                                                              'Add new profile'
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
                                                        Row(
                                                          children: [
                                                            CircleAvatar(
                                                              backgroundColor:
                                                                  Colors.white,
                                                              radius: 15.r,
                                                              child: ClipOval(
                                                                child: item.avatarUrl !=
                                                                        null
                                                                    ? CachedNetworkImage(
                                                                        imageUrl:
                                                                            item.avatarUrl ??
                                                                                '',
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
                                                            Gap(5.w),
                                                            if (item.verified)
                                                              SvgPicture.asset(
                                                                  'assets/icons/verified.svg'),
                                                          ],
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
                                          if (value.avatarUrl == "2" ||
                                              value.avatarUrl == "4") {
                                            Get.toNamed(AppRoutes.editProfile)!
                                                .then((value) {
                                              controller.getUser();
                                            });
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
                      SizedBox(
                        height: 200,
                        width: 200,
                        child: HomeGif(
                          onTap: () {
                            if (!controller.isSearching) {
                              controller.checkData();
                            }
                          },
                          isSearching: controller.isSearching,
                        ),
                      ),
                      Gap(25.h),
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
                            child: controller.isSearching
                                ? Center(
                                    heightFactor: 10.h,
                                    child: AppText(
                                      title: 'Keep searching..'.tr,
                                      color: AppColors.black,
                                      textAlign: TextAlign.center,
                                      size: 14.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                : GridView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    physics: NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 15.h,
                                      crossAxisSpacing: 36.0,
                                      mainAxisExtent: 100.h,
                                    ),
                                    itemCount: controller.scannedUsers.length,
                                    itemBuilder: (context, index) {
                                      return UserCard(
                                        user: controller.scannedUsers[index],
                                        onTap: () {
                                          if (controller
                                              .scannedUsers[index]
                                              .currentProfile!
                                              .isProfilePublic) {
                                            Get.toNamed(AppRoutes.publicProfile,
                                                arguments: controller
                                                    .scannedUsers[index]
                                                    .currentProfile);
                                          } else {
                                            controller.sendRequest(
                                                controller.scannedUsers[index]);
                                          }
                                        },
                                      );
                                    },
                                  ),
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
