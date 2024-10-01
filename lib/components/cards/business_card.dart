// ignore_for_file: prefer_const_constructors

import 'package:blur/blur.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

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
      required this.website,
      required this.linkedin,
      required this.facebook,
      required this.blur,
      this.premission,
      this.radius,
      required this.phone});
  final String name;
  final String email;
  final String jobTitle;
  final String company;
  final String image;
  final String instagram;
  final String x;
  final String website;
  final String facebook;
  final String linkedin;
  final String phone;
  final premission;
  final blur;
  final radius;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(19.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 22),
            width: 339.w,
            constraints: BoxConstraints(
              minHeight: 140.h,
            ),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.vertical(top: Radius.circular(19.0)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          premission == true
                              ? Blur(
                                  blur: blur!,
                                  borderRadius: radius,
                                  child: Text(
                                    name,
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              : Text(
                                  name,
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                        ],
                      ),
                      Gap(5.h),
                      premission == true
                          ? Blur(
                              blur: blur!,
                              borderRadius: radius,
                              child: Text(
                                jobTitle,
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          : Text(
                              jobTitle,
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                      Gap(8.h),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/home_img.svg',
                            height: 11.h,
                            width: 11.w,
                          ),
                          Gap(5),
                          premission == true
                              ? Blur(
                                  blur: blur!,
                                  borderRadius: radius,
                                  child: Text(
                                    company,
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 9,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              : Text(
                                  company,
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 9,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                        ],
                      ),
                      Gap(8.h),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/mail.svg',
                            height: 11.h,
                            width: 11.w,
                          ),
                          Gap(5),
                          premission == true
                              ? Blur(
                                  blur: blur!,
                                  borderRadius: radius,
                                  child: Text(
                                    email,
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )
                              : Text(
                                  email,
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/LogoHome.svg',
                      height: 15,
                      width: 68,
                    ),
                    Gap(8),
                    image.isNotEmpty
                        ? premission == true
                            ? Blur(
                                borderRadius: radius,
                                blur: blur!,
                                child: CachedNetworkImage(
                                  imageUrl: image,
                                  height: 50.h,
                                  width: 50.w,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : CachedNetworkImage(
                                imageUrl: image,
                                height: 50.h,
                                width: 50.w,
                                fit: BoxFit.cover,
                              )
                        : Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.Icon_grey),
                            ),
                            height: 50.h,
                            width: 50.w,
                          ),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 26, vertical: 11),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(19.0))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/instagram_black.svg',
                            height: 12,
                            width: 12,
                            //color: Colors.black,
                          ),
                          Gap(5.w),
                          premission
                              ? Blur(
                                  blur: blur,
                                  borderRadius: radius,
                                  child: Text(instagram,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 9,
                                        fontWeight: FontWeight.w600,
                                      )),
                                )
                              : Text(instagram,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 9,
                                    fontWeight: FontWeight.w600,
                                  )),
                        ],
                      ),
                    ),

                    /// Gap(31.w),
                    Flexible(
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/xtwitter.svg',
                            height: 12,
                            width: 12,
                          ),
                          Gap(5.w),
                          premission
                              ? Blur(
                                  borderRadius: radius,
                                  blur: blur,
                                  child: Text(x,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 9,
                                        fontWeight: FontWeight.w600,
                                      )),
                                )
                              : Text(x,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 9,
                                    fontWeight: FontWeight.w600,
                                  )),
                        ],
                      ),
                    ),

                    ///   Gap(31.w),
                    Flexible(
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/website.svg',
                            height: 12,
                            width: 12,
                            // color: Colors.black,
                          ),
                          Gap(5.w),
                          premission
                              ? Blur(
                                  borderRadius: radius,
                                  blur: blur,
                                  child: Text(website,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 9,
                                        fontWeight: FontWeight.w600,
                                      )),
                                )
                              : Text(website,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 9,
                                    fontWeight: FontWeight.w600,
                                  )),
                        ],
                      ),
                    )
                  ],
                ),
                Gap(9.h),
                Padding(
                  padding: const EdgeInsets.only(left: 3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/linkedin.svg',
                              height: 12,
                              width: 12,
                              color: Colors.black,
                            ),
                            Gap(5.w),
                            premission
                                ? Blur(
                                    borderRadius: radius,
                                    blur: blur,
                                    child: Text(linkedin,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 9,
                                          fontWeight: FontWeight.w600,
                                        )))
                                : Text(linkedin,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 9,
                                      fontWeight: FontWeight.w600,
                                    )),
                          ],
                        ),
                      ),

                      ///   Gap(31.w),
                      Flexible(
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/facebook_black.svg',
                              height: 12,
                              width: 12,
                              //color: Colors.black,
                            ),
                            Gap(5.w),
                            premission
                                ? Blur(
                                    borderRadius: radius,
                                    blur: blur,
                                    child: Text(facebook,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 9,
                                          fontWeight: FontWeight.w600,
                                        )))
                                : Text(facebook,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 9,
                                      fontWeight: FontWeight.w600,
                                    ))
                          ],
                        ),
                      ),

                      ///  Gap(31.w),
                      Flexible(
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/smartphone.svg',
                              height: 12,
                              width: 12,
                              // color: Colors.black,
                            ),
                            Gap(5.w),
                            premission
                                ? Blur(
                                    borderRadius: radius,
                                    blur: blur,
                                    child: Text(phone,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 9,
                                          fontWeight: FontWeight.w600,
                                        )),
                                  )
                                : Text(phone,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 9,
                                      fontWeight: FontWeight.w600,
                                    )),
                          ],
                        ),
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
