import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class BusinessCard extends StatelessWidget {
  const BusinessCard({super.key, required this.name, required this.email});
  final String name;
  final String email;
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
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 22),
            width: 312,
            height: 130,
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
                    Text(
                      'Wiliam Smith',
                      style: TextStyle(
                          color: AppColors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                    Gap(5.h),
                    Text(
                      'Ui Designer',
                      style: TextStyle(
                          color: AppColors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w500),
                    ),
                    Gap(8.h),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/home_img.svg',
                        ),
                        Gap(5),
                        Text(name,
                            
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
                        Text(email,
                          
                            style: TextStyle(
                                color: AppColors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w400)),
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'logo',
                      style: TextStyle(
                          color: AppColors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    Gap(13.h),
                    Image.asset('assets/images/person.png'),
                    //
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 35, vertical: 11),
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
                        Text('@wiliamX2',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 7,
                              fontWeight: FontWeight.w400,
                            ))
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
                        Text('@wiliamX2',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 7,
                              fontWeight: FontWeight.w400,
                            ))
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
                        Text('@wiliamX2',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 7,
                              fontWeight: FontWeight.w400,
                            ))
                      ],
                    )
                  ],
                ),
                Gap(7.h),
                Row(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/tiktok_black.svg',
                          color: Colors.black,
                        ),
                        Gap(5.w),
                        Text('@wiliamX2',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 7,
                              fontWeight: FontWeight.w400,
                            ))
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
                        Text('@wiliamX2',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 7,
                              fontWeight: FontWeight.w400,
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
                        Text('@+971 8876 5467',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 7,
                              fontWeight: FontWeight.w400,
                            ))
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
