// ignore_for_file: prefer_const_constructors

import 'package:blur/blur.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class BusinessCard extends StatelessWidget {
  const BusinessCard(
      {super.key,
      required this.name,
      required this.email,
      required this.jobTitle,
      required this.company,
      required this.image,
      required this.instagram,
      required this.x,
      required this.tiktok,
      required this.facebook,
      required this.snapchat,
      required this.blur,
      this.premission,
      required this.phone});
  final String name;
  final String email;
  final String jobTitle;
  final String company;
  final String image;
  final String instagram;
  final String x;
  final String tiktok;
  final String facebook;
  final String snapchat;
  final String phone;
  final premission;
  final blur;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(19.0),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 22),
            width: 339.w,
            height: 140.h,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(19.0))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    premission
                        ? Blur(
                            blur: blur,
                            child: Text(
                              name,
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        : Text(
                            name,
                            style: TextStyle(
                                color: AppColors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                    Gap(5.h),
                    premission
                        ? Blur(
                            blur: blur,
                            child: Text(
                              jobTitle,
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        : Text(
                            jobTitle,
                            style: TextStyle(
                                color: AppColors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                    Gap(8.h),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/home_img.svg',
                        ),
                        Gap(5),
                        premission
                            ? Blur(
                                blur: blur,
                                child: Text(company,
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 8,
                                        fontWeight: FontWeight.w500)),
                              )
                            : Text(company,
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w500)),
                      ],
                    ),
                    Gap(8.h),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/mail.svg',
                        ),
                        Gap(5),
                        premission
                            ? Blur(
                                child: Text(email,
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600)),
                              )
                            : Text(email,
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600)),
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    premission
                        ? Blur(
                            blur: blur,
                            child: Text(
                              'logo',
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        : Text(
                            'logo',
                            style: TextStyle(
                                color: AppColors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                    Gap(13.h),
                    image.isNotEmpty
                        ? CachedNetworkImage(
                            imageUrl: image,
                            height: 60.h,
                            width: 60.w,
                          )
                        : Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.Icon_grey)),
                            height: 60.h,
                            width: 60.w,
                          )
                    //
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 26, vertical: 11),
            width: 312,
            height: 60,
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(19.0))),
            child: Column(
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/instagram_black.svg',
                          //color: Colors.black,
                        ),
                        Gap(5.w),
                        premission
                            ? Blur(
                                blur: blur,
                                child: Text(instagram,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 7,
                                      fontWeight: FontWeight.w600,
                                    )),
                              )
                            : Text(instagram,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 7,
                                  fontWeight: FontWeight.w600,
                                )),
                      ],
                    ),
                    Gap(31.w),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/twitter_black.svg',
                          //color: Colors.black,
                        ),
                        Gap(5.w),
                        premission
                            ? Blur(
                                child: Text(x,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 7,
                                      fontWeight: FontWeight.w600,
                                    )),
                              )
                            : Text(x,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 7,
                                  fontWeight: FontWeight.w600,
                                )),
                      ],
                    ),
                    Gap(31.w),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/facebook_black.svg',
                          // color: Colors.black,
                        ),
                        Gap(5.w),
                        premission
                            ? Blur(
                                blur: blur,
                                child: Text(facebook,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 7,
                                      fontWeight: FontWeight.w600,
                                    )),
                              )
                            : Text(facebook,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 7,
                                  fontWeight: FontWeight.w600,
                                )),
                      ],
                    )
                  ],
                ),
                Gap(7.h),
                Padding(
                  padding: const EdgeInsets.only(left: 3.0),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/tiktok_black.svg',
                            color: Colors.black,
                          ),
                          Gap(5.w),
                          premission
                              ? Blur(
                                  blur: blur,
                                  child: Text(tiktok,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 7,
                                        fontWeight: FontWeight.w600,
                                      )))
                              : Text(tiktok,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 7,
                                    fontWeight: FontWeight.w600,
                                  )),
                        ],
                      ),
                      Gap(31.w),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/notification.svg',
                            //color: Colors.black,
                          ),
                          Gap(5.w),
                          premission
                              ? Blur(
                                  blur: blur,
                                  child: Text(snapchat,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 7,
                                        fontWeight: FontWeight.w600,
                                      )))
                              : Text(snapchat,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 7,
                                    fontWeight: FontWeight.w600,
                                  ))
                        ],
                      ),
                      Gap(31.w),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/smartphone.svg',
                            // color: Colors.black,
                          ),
                          Gap(5.w),
                          premission
                              ? Blur(
                                  blur: blur,
                                  child: Text(phone,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 7,
                                        fontWeight: FontWeight.w600,
                                      )),
                                )
                              : Text(phone,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 7,
                                    fontWeight: FontWeight.w600,
                                  )),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
