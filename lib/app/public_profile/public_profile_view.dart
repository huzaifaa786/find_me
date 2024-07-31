// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, avoid_unnecessary_containers

import 'dart:developer';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_me/app/account/components/social_media_icon.dart';
import 'package:find_me/app/account/profile/profile_controller.dart';
import 'package:find_me/app/edit_profile/edit_profile_controller.dart';
import 'package:find_me/app/gifted_emoji/components/emojis_card.dart';
import 'package:find_me/app/public_profile/public_profile_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/components/cards/business_card.dart';

import 'package:find_me/routes/app_routes.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/box_decoration/box_decoration.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class PublicProfileView extends StatelessWidget {
  const PublicProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PublicProfileController>(
      autoRemove: false,
      builder: (controller) => controller.userModel != null
          ? Scaffold(
              appBar: AppBar(
                scrolledUnderElevation: 0,
                automaticallyImplyLeading: false,
                title: topBar(
                    name: "@${controller.userModel!.name}", showBackIcon: true),
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 44.w),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: 77,
                            width: 77,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(
                                        0x66000000), // #00000040 with 40 being the alpha value in hexadecimal
                                    blurRadius: 1.2,
                                    spreadRadius: 0,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(40.r),
                                image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                        controller.profile?.imageUrl ?? ''),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        Gap(8),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppText(
                                  title: controller.profile!.name!,
                                  size: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                Gap(15),
                                controller.profile!.isVerified
                                    ? SvgPicture.asset(
                                        'assets/icons/verified.svg')
                                    : SizedBox(),
                              ],
                            ),
                            Gap(15.h),
                            AppText(
                                title: controller.profile!.bio!,
                                size: 11.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.hintGrey),
                            Gap(21.h),
                            Divider(
                              thickness: 1,
                              color: AppColors.black.withOpacity(0.08),
                              height: 1,
                            ),
                            Gap(21.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Find me on:",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Gap(27.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SocialMediaIcon(
                                  socialMediaIcon:
                                      "assets/icons/tiktok_black.svg",
                                  isEmpty: controller.profileUrlModel!.tiktok ==
                                      null,
                                  ontap: () {
                                    if (controller.profileUrlModel!.tiktok !=
                                            null &&
                                        controller.hasSocialAccess) {
                                      controller.launchSocialUrl(
                                          controller.profileUrlModel!.tiktok!);
                                    } else if (!controller.hasSocialAccess) {
                                      controller
                                          .sendRequest(controller.userModel!);
                                    }
                                  },
                                ),
                                SocialMediaIcon(
                                  socialMediaIcon: "assets/icons/xtwitter.svg",
                                  isEmpty:
                                      controller.profileUrlModel!.x == null,
                                  ontap: () {
                                    if (controller.profileUrlModel!.x != null &&
                                        controller.hasSocialAccess) {
                                      controller.launchSocialUrl(
                                          controller.profileUrlModel!.x!);
                                    } else if (!controller.hasSocialAccess) {
                                      controller
                                          .sendRequest(controller.userModel!);
                                    }
                                  },
                                ),
                                SocialMediaIcon(
                                  socialMediaIcon:
                                      "assets/icons/instagram_black.svg",
                                  isEmpty:
                                      controller.profileUrlModel!.instagram ==
                                          null,
                                  ontap: () {
                                    if (controller.profileUrlModel!.instagram !=
                                            null &&
                                        controller.hasSocialAccess) {
                                      controller.launchSocialUrl(controller
                                          .profileUrlModel!.instagram!);
                                    } else if (!controller.hasSocialAccess) {
                                      controller
                                          .sendRequest(controller.userModel!);
                                    }
                                  },
                                ),
                                SocialMediaIcon(
                                  socialMediaIcon: "assets/icons/snapchat.svg",
                                  isEmpty:
                                      controller.profileUrlModel!.snapchat ==
                                          null,
                                  ontap: () {
                                    if (controller.profileUrlModel!.snapchat !=
                                            null &&
                                        controller.hasSocialAccess) {
                                      controller.launchSocialUrl(controller
                                          .profileUrlModel!.snapchat!);
                                    } else if (!controller.hasSocialAccess) {
                                      controller
                                          .sendRequest(controller.userModel!);
                                    }
                                  },
                                ),
                                SocialMediaIcon(
                                  socialMediaIcon:
                                      "assets/icons/facebook_black.svg",
                                  isEmpty:
                                      controller.profileUrlModel!.facebook ==
                                          null,
                                  ontap: () {
                                    if (controller.profileUrlModel!.facebook !=
                                            null &&
                                        controller.hasSocialAccess) {
                                      controller.launchSocialUrl(controller
                                          .profileUrlModel!.facebook!);
                                    } else if (!controller.hasSocialAccess) {
                                      controller
                                          .sendRequest(controller.userModel!);
                                    }
                                  },
                                ),
                                SocialMediaIcon(
                                  socialMediaIcon: "assets/icons/youtube.svg",
                                  isEmpty:
                                      controller.profileUrlModel!.youtube ==
                                          null,
                                  ontap: () {
                                    if (controller.profileUrlModel!.youtube !=
                                            null &&
                                        controller.hasSocialAccess) {
                                      controller.launchSocialUrl(
                                          controller.profileUrlModel!.youtube!);
                                    } else if (!controller.hasSocialAccess) {
                                      controller
                                          .sendRequest(controller.userModel!);
                                    }
                                  },
                                ),
                              ],
                            ),
                            Gap(15.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SocialMediaIcon(
                                  socialMediaIcon: "assets/icons/whatsapp1.svg",
                                  isEmpty:
                                      controller.profileUrlModel!.whatsapp ==
                                          null,
                                  ontap: () {
                                    if (controller.profileUrlModel!.whatsapp !=
                                            null &&
                                        controller.hasSocialAccess) {
                                      controller.launchSocialUrl(controller
                                          .profileUrlModel!.whatsapp!);
                                    } else if (!controller.hasSocialAccess) {
                                      controller
                                          .sendRequest(controller.userModel!);
                                    }
                                  },
                                ),
                                SocialMediaIcon(
                                  socialMediaIcon: "assets/icons/gmail.svg",
                                  isEmpty:
                                      controller.profileUrlModel!.email == null,
                                  ontap: () {
                                    if (controller.profileUrlModel!.email !=
                                            null &&
                                        controller.hasSocialAccess) {
                                      controller.launchSocialUrl(
                                          controller.profileUrlModel!.email!);
                                    } else if (!controller.hasSocialAccess) {
                                      controller
                                          .sendRequest(controller.userModel!);
                                    }
                                  },
                                ),
                                SocialMediaIcon(
                                  socialMediaIcon:
                                      "assets/icons/telegram-plane.svg",
                                  isEmpty:
                                      controller.profileUrlModel!.telegram ==
                                          null,
                                  ontap: () {
                                    if (controller.profileUrlModel!.telegram !=
                                            null &&
                                        controller.hasSocialAccess) {
                                      controller.launchSocialUrl(controller
                                          .profileUrlModel!.telegram!);
                                    } else if (!controller.hasSocialAccess) {
                                      controller
                                          .sendRequest(controller.userModel!);
                                    }
                                  },
                                ),
                                SocialMediaIcon(
                                  socialMediaIcon: "assets/icons/linkedin.svg",
                                  isEmpty:
                                      controller.profileUrlModel!.linkedin ==
                                          null,
                                  ontap: () {
                                    if (controller.profileUrlModel!.linkedin !=
                                            null &&
                                        controller.hasSocialAccess) {
                                      controller.launchSocialUrl(controller
                                          .profileUrlModel!.linkedin!);
                                    } else if (!controller.hasSocialAccess) {
                                      controller
                                          .sendRequest(controller.userModel!);
                                    }
                                  },
                                ),
                              ],
                            ),
                            Gap(20.h),
                            Divider(
                              thickness: 1,
                              color: AppColors.black.withOpacity(0.08),
                            ),
                            Gap(20.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "My business card",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Gap(22),
                            controller.businessCardModel != null
                                ? GestureDetector(
                                    onTap: () {
                                      if (!controller.hasSocialAccess) {
                                        controller
                                            .sendRequest(controller.userModel!);
                                      }
                                    },
                                    child: BusinessCard(
                                        blur: 5.0,
                                        radius: BorderRadius.circular(5),
                                        premission:
                                            controller.profile!.isSocialPublic ||
                                                    controller.hasSocialAccess
                                                ? false
                                                : true,
                                        name:
                                            "${controller.businessCardModel!.firstName} ${controller.businessCardModel!.lastName}",
                                        email: controller
                                                .businessCardModel!.email ??
                                            '',
                                        jobTitle:
                                            controller.businessCardModel!.job ??
                                                '',
                                        company: controller
                                                .businessCardModel!.company ??
                                            '',
                                        image:
                                            controller.businessCardModel!.image ??
                                                '',
                                        instagram: controller
                                                .businessCardModel!.instagram ??
                                            '',
                                        x: controller.businessCardModel!.x ??
                                            '',
                                        tiktok: controller
                                                .businessCardModel!.tiktok ??
                                            '',
                                        facebook:
                                            controller.businessCardModel!.facebook ?? '',
                                        snapchat: controller.businessCardModel!.snapchat ?? '',
                                        phone: controller.businessCardModel!.phone ?? ''),
                                  )
                                : Container(
                                    height: 192.8.h,
                                    width: 312.w,
                                    child: Column(
                                      children: [
                                        Gap(31.h),
                                        SizedBox(
                                            height: 78.h,
                                            width: 78.w,
                                            child: SvgPicture.asset(
                                              "assets/icons/card_profile_picture.svg",
                                              height: 65.h,
                                              width: 65.w,
                                            )),
                                        Gap(9.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Container(
                                              height: 72.h,
                                              width: 299.8.w,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  // SvgPicture.asset(
                                                  //     "assets/icons/business_card.svg"),
                                                  Text(
                                                    "No business card exist",
                                                    style: TextStyle(
                                                        color: AppColors
                                                            .primary_color,
                                                        fontSize: 10.sp,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                              decoration: BoxDecoration(
                                                  color: AppColors.light_white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  18),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  16))),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(19),
                                      border: Border.all(
                                          color: AppColors.lightSkyBlue),
                                    ),
                                  ),
                          ],
                        ),
                        Gap(32.h),
                        Divider(
                          thickness: 1,
                          color: AppColors.black.withOpacity(0.08),
                          height: 1,
                        ),
                        Gap(27.h),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Favorites ",
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Gap(21),
                        if (controller.profile!.emojis != null &&
                            controller.profile!.emojis!.isNotEmpty)
                          GridView.builder(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemCount: controller.profile!.emojis!.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 2.0,
                                crossAxisSpacing: 2.0,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: (){
                                    controller.giftEmoji(controller
                                            .profile!.emojis![index].id);
                                  },
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: controller
                                            .profile!.emojis![index].image,
                                        placeholder: (context, url) =>
                                            CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                        width: 55,
                                        height: 55,
                                      ),
                                      if (controller
                                              .profile!.emojis![index].type ==
                                          "paid")
                                        Positioned(
                                          top: 19,
                                          left: -1,
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                "assets/images/gift_coin.png",
                                                height: 22.23.h,
                                                width: 22.09.w,
                                              ),
                                              Text(
                                                controller
                                                    .profile!.emojis![index].coins
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      if (controller.profile!.emojis![index]
                                              .giftCount !=
                                          "0")
                                        Positioned(
                                          bottom: 0,
                                          child: Text(
                                            controller.profile!.emojis![index]
                                                    .giftCount ??
                                                "",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                );
                                // return controller
                                //             .profile!.emojis![index].type ==
                                //         "free"
                                //     ? Column(
                                //         children: [
                                //           CachedNetworkImage(
                                //             imageUrl: controller
                                //                 .profile!.emojis![index].image,
                                //             height: 50.h,
                                //             width: 50.w,
                                //           ),
                                //           if (controller.profile!.emojis![index]
                                //                   .giftCount !=
                                //               '0')
                                //             Text(
                                //               controller.profile!.emojis![index]
                                //                   .giftCount
                                //                   .toString(),
                                //               style: TextStyle(
                                //                 fontSize: 10.sp,
                                //                 fontWeight: FontWeight.w600,
                                //               ),
                                //             ),
                                //         ],
                                //       )
                                //     : Row(
                                //         children: [
                                //           Column(
                                //             children: [
                                //               SvgPicture.asset(
                                //                 "assets/icons/coins.svg",
                                //                 height: 23.23.h,
                                //                 width: 23.09.w,
                                //               ),
                                //               Text(
                                //                 controller.profile!
                                //                     .emojis![index].coins
                                //                     .toString(),
                                //                 style: TextStyle(
                                //                   fontSize: 10.sp,
                                //                   fontWeight: FontWeight.w600,
                                //                 ),
                                //               ),
                                //             ],
                                //           ),
                                //           Column(
                                //             children: [
                                //               CachedNetworkImage(
                                //                 imageUrl: controller.profile!
                                //                     .emojis![index].image,
                                //                 width: 50.w,
                                //                 height: 50.h,
                                //               ),
                                //               Text(
                                //                 controller.profile!
                                //                     .emojis![index].giftCount
                                //                     .toString(),
                                //                 style: TextStyle(
                                //                   fontSize: 10.sp,
                                //                   fontWeight: FontWeight.w600,
                                //                 ),
                                //               ),
                                //             ],
                                //           ),
                                //         ],
                                //       );
                              }),
                        Gap(28.h),
                      ],
                    ),
                  ),
                ),
              ))
          : Scaffold(body: Text('')),
    );
  }
}
