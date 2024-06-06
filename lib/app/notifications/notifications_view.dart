// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_me/app/auth/components/auth_appbar.dart';
import 'package:find_me/app/notifications/notifications_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationsController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          forceMaterialTransparency: true,
          title: topBar(name: 'Notifications'),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: Column(
              children: [
                Gap(15.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.primary_color,
                              borderRadius: BorderRadius.circular(6.r)),
                          height: 6.h,
                          width: 6.w,
                        ),
                        Gap(3.w),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(34.r),
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://as1.ftcdn.net/v2/jpg/03/46/83/96/1000_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg',
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                            height: 34.h,
                            width: 34.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    Gap(3.w),
                    Expanded(
                      child: Column(
                        children: [
                          Gap(8.h),
                          AppText(
                            title: 'Ahmed mohammed wants to send you a file',
                            size: 10.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          Gap(10.h),
                          Row(
                            children: [
                              Container(
                                height: 24.h,
                                width: 80.w,
                                decoration: BoxDecoration(
                                    border: Border.all(color: AppColors.red),
                                    borderRadius: BorderRadius.circular(66.r)),
                                child: Center(
                                  child: AppText(
                                    title: 'Reject',
                                    size: 8.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.red,
                                  ),
                                ),
                              ),
                              Gap(9.w),
                              Container(
                                height: 24.h,
                                width: 80.w,
                                decoration: BoxDecoration(
                                    color: AppColors.green,
                                    borderRadius: BorderRadius.circular(66.r)),
                                child: Center(
                                  child: AppText(
                                    title: 'Accept',
                                    size: 8.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 1,
                  color: AppColors.black.withOpacity(0.08),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
