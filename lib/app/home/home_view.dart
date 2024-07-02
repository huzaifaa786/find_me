// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, deprecated_member_use, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_me/app/home/components/swipe.dart';
import 'package:find_me/app/home/components/home_gif_button.dart';
import 'package:find_me/app/home/components/home_appbar.dart';
import 'package:find_me/app/home/components/user_card.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      autoRemove: false,
      builder: (controller) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          title: homeAppBar(),
        ),
        body: SafeArea(
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
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.shadow_black.withOpacity(0.25),
                                spreadRadius: 1,
                                blurRadius: 10.7,
                                offset: Offset(0, 0),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(80.r),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(80.r),
                            child: CachedNetworkImage(
                              imageUrl: controller.selectedItem.avatarUrl ?? '',
                              fit: BoxFit.cover,
                            ),
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
                                child: DropdownButton<DropdownItem>(
                                  icon: SvgPicture.asset(
                                    'assets/icons/arrow_down.svg',
                                    color: Colors.transparent,
                                  ),
                                  elevation: 1,
                                  hint: AppText(
                                    title:
                                        "Appears as  ${controller.userModel!.name ?? ''}",
                                    color: AppColors.primary_color,
                                    size: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  borderRadius: BorderRadius.circular(20.r),
                                  items: controller.dropdownItems.map((item) {
                                    return DropdownMenuItem<DropdownItem>(
                                      value: item,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 15.r,
                                                child: ClipOval(
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                        item.avatarUrl ?? '',
                                                    fit: BoxFit.cover,
                                                    width: 30.r,
                                                    height: 30.r,
                                                  ),
                                                ),
                                              ),
                                              Gap(10.w),
                                              Text(
                                                item.text ?? '',
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.justify,
                                              ),
                                              Gap(5.w),
                                              if (item.verified)
                                                SvgPicture.asset(
                                                    'assets/icons/verified.svg'),
                                            ],
                                          ),
                                          Divider(
                                            thickness: 0.3,
                                            color: Color(0x13000000),
                                            indent: 16.0,
                                            endIndent: 16.0,
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    if (value != null) {
                                      controller.selectItem(value);
                                    }
                                  },
                                  underline: Container(),
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
                                  SvgPicture.asset('assets/icons/verified.svg')
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
                            controller.initFlutterBlue();
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
                                    title: 'Keep searching..',
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
                                    return GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              surfaceTintColor: AppColors.white
                                                  .withOpacity(0.25),
                                              alignment: Alignment.bottomCenter,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(38.0)),
                                              ),
                                              title: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    height: 30.h,
                                                    width: 100.w,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10.0,
                                                              right: 10.0),
                                                      child: DropdownButton<
                                                          String>(
                                                        hint: AppText(
                                                          title: 'Send',
                                                          size: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        alignment: Alignment
                                                            .bottomCenter,
                                                        isExpanded: true,
                                                        iconEnabledColor:
                                                            AppColors
                                                                .primary_color,
                                                        iconDisabledColor:
                                                            AppColors
                                                                .primary_color,
                                                        iconSize: 30,
                                                        underline: Container(),
                                                        style: TextStyle(
                                                          fontSize: 8,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColors
                                                              .primary_color,
                                                        ),
                                                        icon: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  top: 15.0),
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/icons/arrow_down.svg',
                                                            color:
                                                                AppColors.black,
                                                            fit: BoxFit
                                                                .scaleDown,
                                                          ),
                                                        ),
                                                        onChanged:
                                                            (String? newValue) {
                                                          print(
                                                              'Selected: $newValue');
                                                        },
                                                        items: <String>[
                                                          'Send document',
                                                          'Send photo',
                                                          'Send emoji'
                                                        ].map<
                                                            DropdownMenuItem<
                                                                String>>(
                                                          (String value) {
                                                            return DropdownMenuItem<
                                                                String>(
                                                              onTap: () {},
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              value: value,
                                                              child: Row(
                                                                children: [
                                                                  GestureDetector(
                                                                    onTap:
                                                                        () {},
                                                                    child: Row(
                                                                      children: [
                                                                        if (value ==
                                                                            'Send document')
                                                                          SvgPicture
                                                                              .asset(
                                                                            'assets/icons/file-text_icon.svg',
                                                                            height:
                                                                                13,
                                                                            width:
                                                                                13,
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      // controller
                                                                      //     .getImage();
                                                                    },
                                                                    child: Row(
                                                                      children: [
                                                                        if (value ==
                                                                            'Send photo')
                                                                          SvgPicture
                                                                              .asset(
                                                                            'assets/icons/camera.svg',
                                                                            height:
                                                                                13,
                                                                            width:
                                                                                13,
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  GestureDetector(
                                                                    onTap:
                                                                        () {},
                                                                    child: Row(
                                                                      children: [
                                                                        if (value ==
                                                                            'Send emoji')
                                                                          SvgPicture
                                                                              .asset(
                                                                            'assets/icons/emoji_icon.svg',
                                                                            height:
                                                                                13,
                                                                            width:
                                                                                13,
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      width: 8),
                                                                  AppText(
                                                                    title:
                                                                        value,
                                                                    color: AppColors
                                                                        .primary_color,
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        ).toList(),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              content: ConstrainedBox(
                                                constraints: BoxConstraints(
                                                    maxHeight: 260.h,
                                                    minHeight: 150.h),
                                                child: Container(
                                                  width: 420.w,
                                                  // padding:EdgeInsets.symmetric(horizontal: 20),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Gap(10.h),
                                                      ConstrainedBox(
                                                        constraints:
                                                            BoxConstraints(
                                                          minHeight: 75,
                                                          minWidth: 75,
                                                          maxHeight: 100,
                                                          maxWidth: 100,
                                                        ),
                                                        child: SizedBox(
                                                          child: CircleAvatar(
                                                            backgroundColor: Colors
                                                                .transparent, // To avoid any background color issues
                                                            child: ClipOval(
                                                              child:
                                                                  CachedNetworkImage(
                                                                imageUrl: controller
                                                                        .scannedUsers[
                                                                            index]
                                                                        .currentProfile!
                                                                        .imageUrl ??
                                                                    '',
                                                                fit: BoxFit
                                                                    .cover,
                                                                width: 100,
                                                                height: 100,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(height: 10.h),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          if (controller
                                                              .dropdownItems[
                                                                  index]
                                                              .verified)
                                                            Container(
                                                              width: 7.w,
                                                              height: 7.h,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: AppColors
                                                                    .green,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                          Gap(5.w),
                                                          AppText(
                                                            title: controller
                                                                .scannedUsers[
                                                                    index]
                                                                .currentProfile!
                                                                .name!,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            size: 10.sp,
                                                          ),
                                                        ],
                                                      ),
                                                      Gap(17.h),
                                                      Container(
                                                        height: 43.h,
                                                        width: 183.w,
                                                        decoration: BoxDecoration(
                                                            color: AppColors
                                                                .light_blue
                                                                .withOpacity(
                                                                    0.25),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        11)),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SvgPicture.asset(
                                                                'assets/icons/emoji_icon.svg',
                                                                height: 10,
                                                                width: 10),
                                                            Gap(5.w),
                                                            AppText(
                                                              title: controller
                                                                      .scannedUsers[
                                                                          index]
                                                                      .currentProfile!
                                                                      .name ??
                                                                  '',
                                                              size: 8,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Gap(5.h),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              actions: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SwipeToSendButton(
                                                      onSend: () {
                                                        controller.showPopUp(
                                                            controller
                                                                .scannedUsers[
                                                                    index]
                                                                .beaconId!);
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: UserCard(
                                        user: controller.scannedUsers[index],
                                      ),
                                    );
                                  },
                                ),
                        ),
                      ),
                    ),
                    Gap(25.h),
                  ],
                )
              : CircularProgressIndicator(),
        ),
      ),
    );
  }
}
