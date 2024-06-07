import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class NotificationPermissionTile extends StatelessWidget {
  const NotificationPermissionTile({
    super.key,
    this.img,
    this.msg,
    this.onAccepttap,
    this.onRejecttap,
  });
  final img;
  final msg;
  final onRejecttap;
  final onAccepttap;
  @override
  Widget build(BuildContext context) {
    return Row(
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
                imageUrl: img,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
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
                title: msg,
                size: 10.sp,
                fontWeight: FontWeight.w500,
              ),
              Gap(10.h),
              Row(
                children: [
                  GestureDetector(
                    onTap: onRejecttap,
                    child: Container(
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
                  ),
                  Gap(9.w),
                  GestureDetector(
                    onTap: onAccepttap,
                    child: Container(
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
