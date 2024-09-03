// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

// import 'package:blur/blur.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_me/app/account/components/social_media_icon.dart';
import 'package:find_me/app/account/profile/profile_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/components/cards/business_card.dart';
import 'package:find_me/routes/app_routes.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/box_decoration/box_decoration.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool permission = true;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                scrolledUnderElevation: 0,
                automaticallyImplyLeading: false,
                title: topBar(name: 'Account'.tr, showBackIcon: true),
              ),
              body: controller.userModel != null
                  ? SafeArea(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 34.w),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  height: 77,
                                  width: 77,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                  child: Stack(
                                    children: [
                                      if (controller.profile?.imageUrl != null)
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                          child: Image(
                                            image: CachedNetworkImageProvider(
                                                controller.profile!.imageUrl!),
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                            height: double.infinity,
                                          ),
                                        )
                                      // Display SVG if no URL is available
                                      else
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                          child: SvgPicture.asset(
                                            "assets/images/User.svg",
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                            height: double.infinity,
                                          ),
                                        ),
                                    ],
                                  ),
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
                                  Gap(7.h),
                                  AppText(
                                      title: '@${controller.userModel!.name}',
                                      size: 11.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.hintGrey),
                                  Gap(15.h),
                                  controller.isEditSelected
                                      ? TextField(
                                          controller: controller.bioController,
                                          focusNode: controller.focusNode,
                                          maxLength: 100,
                                          decoration: InputDecoration(
                                            filled: true,
                                            hintStyle: TextStyle(
                                              color: AppColors.hintGrey,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 16.h,
                                                    horizontal: 20.w),
                                            fillColor: AppColors.white,
                                            border: bioInputDecoration,
                                            enabledBorder: bioInputDecoration,
                                            focusedBorder: bioInputDecoration,
                                            errorBorder: inputErrorDecoration,
                                            focusedErrorBorder:
                                                inputErrorDecoration,
                                          ),
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          onEditingComplete: () {
                                            controller.updateProfileBio();
                                            controller.isEditSelected = false;
                                            controller.focusNode.unfocus();
                                            controller.update();
                                          },
                                        )
                                      : AppText(
                                          title: controller.profile!.bio!,
                                          size: 11.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.hintGrey),
                                  Gap(15.h),
                                  if (!controller.isEditSelected)
                                    GestureDetector(
                                      onTap: () {
                                        controller.isEditSelected =
                                            !controller.isEditSelected;
                                        controller.focusNode.requestFocus();
                                        controller.update();
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          AppText(
                                              title: 'Edit bio'.tr,
                                              size: 11.sp,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.primary_color),
                                          Gap(2),
                                          SvgPicture.asset(
                                              "assets/icons/edit.svg"),
                                        ],
                                      ),
                                    ),
                                  Gap(21.h),
                                  Divider(
                                    thickness: 1,
                                    color: AppColors.black.withOpacity(0.08),
                                    height: 1,
                                  ),
                                  Gap(21.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Find me on:".tr,
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            Get.toNamed(AppRoutes.editurl,
                                                    arguments:
                                                        controller.profile)!
                                                .then((value) {
                                              controller.getUser();
                                            });
                                          },
                                          child: Row(
                                            children: [
                                              AppText(
                                                  title: 'Edit'.tr,
                                                  size: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color:
                                                      AppColors.primary_color),
                                              Gap(5.w),
                                              SvgPicture.asset(
                                                  "assets/icons/edit.svg"),
                                            ],
                                          )),
                                    ],
                                  ),
                                  Gap(27.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SocialMediaIcon(
                                        socialMediaIcon:
                                            "assets/icons/tiktok_black.svg",
                                        isEmpty: controller
                                                .profileUrlModel!.tiktok ==
                                            null,
                                      ),
                                      SocialMediaIcon(
                                        socialMediaIcon:
                                            "assets/icons/xtwitter.svg",
                                        isEmpty:
                                            controller.profileUrlModel!.x ==
                                                null,
                                      ),
                                      SocialMediaIcon(
                                        socialMediaIcon:
                                            "assets/icons/instagram_black.svg",
                                        isEmpty: controller
                                                .profileUrlModel!.instagram ==
                                            null,
                                      ),
                                      SocialMediaIcon(
                                        socialMediaIcon:
                                            "assets/icons/snapchat.svg",
                                        isEmpty: controller
                                                .profileUrlModel!.snapchat ==
                                            null,
                                      ),
                                      SocialMediaIcon(
                                        socialMediaIcon:
                                            "assets/icons/facebook_black.svg",
                                        isEmpty: controller
                                                .profileUrlModel!.facebook ==
                                            null,
                                      ),
                                      SocialMediaIcon(
                                          socialMediaIcon:
                                              "assets/icons/youtube.svg",
                                          isEmpty: controller
                                                  .profileUrlModel!.youtube ==
                                              null),
                                    ],
                                  ),
                                  Gap(15.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SocialMediaIcon(
                                        socialMediaIcon:
                                            "assets/icons/whatsapp1.svg",
                                        isEmpty: controller
                                                .profileUrlModel!.whatsapp ==
                                            null,
                                      ),
                                      SocialMediaIcon(
                                          socialMediaIcon:
                                              "assets/icons/gmail.svg",
                                          isEmpty: controller
                                                  .profileUrlModel!.email ==
                                              null),
                                      SocialMediaIcon(
                                        socialMediaIcon:
                                            "assets/icons/telegram-plane.svg",
                                        isEmpty: controller
                                                .profileUrlModel!.telegram ==
                                            null,
                                      ),
                                      SocialMediaIcon(
                                        socialMediaIcon:
                                            "assets/icons/linkedin.svg",
                                        isEmpty: controller
                                                .profileUrlModel!.linkedin ==
                                            null,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "My business card".tr,
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      controller.businessCardModel != null
                                          ? GestureDetector(
                                              onTap: () {
                                                Get.toNamed(
                                                        AppRoutes.createcard,
                                                        arguments: [
                                                      controller.profile,
                                                      controller
                                                          .businessCardModel,
                                                    ])!
                                                    .then((value) {
                                                  controller.getUser();
                                                });
                                              },
                                              child: Row(
                                                children: [
                                                  AppText(
                                                      title: 'Edit'.tr,
                                                      size: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: AppColors
                                                          .primary_color),
                                                  Gap(5.w),
                                                  SvgPicture.asset(
                                                      "assets/icons/edit.svg"),
                                                ],
                                              ),
                                            )
                                          : Text(
                                              "",
                                            ),
                                    ],
                                  ),
                                  Gap(22),
                                  controller.businessCardModel != null
                                      ? BusinessCard(
                                          blur: 3.0,
                                          premission: false,
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
                                          image: controller
                                                  .businessCardModel!.image ??
                                              '',
                                          instagram: controller
                                                  .businessCardModel!
                                                  .instagram ??
                                              '',
                                          x: controller.businessCardModel!.x ??
                                              '',
                                          tiktok: controller
                                                  .businessCardModel!.tiktok ??
                                              '',
                                          facebook: controller
                                                  .businessCardModel!
                                                  .facebook ??
                                              '',
                                          snapchat: controller
                                                  .businessCardModel!
                                                  .snapchat ??
                                              '',
                                          phone: controller
                                                  .businessCardModel!.phone ??
                                              '')
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
                                                    width: 309.8.w,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Get.toNamed(
                                                                AppRoutes
                                                                    .createcard,
                                                                arguments: [
                                                              controller
                                                                  .profile,
                                                              null
                                                            ])!
                                                            .then((value) {
                                                          controller.getUser();
                                                        });
                                                      },
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          SvgPicture.asset(
                                                              "assets/icons/business_card.svg"),
                                                          Text(
                                                            "Create business card"
                                                                .tr,
                                                            style: TextStyle(
                                                                color: AppColors
                                                                    .primary_color,
                                                                fontSize: 10.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                        color: AppColors
                                                            .light_white,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        18),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        16))),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(19),
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
                                  "Favorites ".tr,
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Gap(21),
                              GridView.builder(
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                itemCount: 6,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 2.0,
                                  crossAxisSpacing: 2.0,
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  if (index >=
                                      (controller.profile?.emojis?.length ??
                                          0)) {
                                    return SizedBox.shrink();
                                  }

                                  return GestureDetector(
                                    onTap: () {
                                      // controller.profile!.emojis![index]
                                      //             .giftCount ==
                                      //         "0"
                                      //     ? controller.giftEmoji(
                                      //         controller
                                      //             .profile!.emojis![index].id!,
                                      //       )
                                      //     : Gap(1);
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
                                                  controller.profile!
                                                      .emojis![index].coins
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
                                },
                              ),
                              Gap(28.h),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Text(''),
            ));
  }
}
