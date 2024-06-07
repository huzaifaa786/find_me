import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SubscriptionNotificationTile extends StatelessWidget {
  const SubscriptionNotificationTile({super.key,this.daycount,this.msg,this.ontap,this.title});
  final daycount;
  final title;
  final msg;
  final ontap;
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
            Gap(12.w),
            Container(
              decoration: BoxDecoration(
                  gradient: AppColors.notification_gradient,
                  borderRadius: BorderRadius.circular(10.r)),
              height: 20,
              width: 20,
              child: Center(
                child: AppText(
                  title: daycount,
                  size: 10.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
        Gap(8.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(5.h),
              AppText(
                title: title,
                size: 10,
                fontWeight: FontWeight.w600,
              ),
              Gap(8.h),
              AppText(
                title:
                    msg,
                size: 10.sp,
                fontWeight: FontWeight.w400,
              ),
              Gap(7.h),
              GestureDetector(
                onTap: ontap,
                child: AppText(
                  title: 'View Subscription',
                  size: 8.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary_color,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
