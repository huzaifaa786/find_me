// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_me/app/auth/components/auth_rich_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile(
      {super.key,
      this.isrejected,
      this.buttonclr,
      this.img,
      this.msg,
      this.ontap,
      this.status});
  final isrejected;
  final img;
  final msg;
  final ontap;
  final status;
  final buttonclr;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: isrejected ? AppColors.primary_color : AppColors.red,
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
        Gap(5.w),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: AuthRichText(
                title: msg,
                titlesize: 11.sp,
                titlefontweight: FontWeight.w500,
                descriptionfontweight: FontWeight.w600,
                descriptiosize: 11.sp,
                description: status == 1
                    ? 'View file'
                    : status == 2
                        ? 'View emoji'
                        : 'Rejected',
                descriptionColor:
                    buttonclr ? AppColors.primary_color : AppColors.red,
                onTap: ontap),
          ),
        )
      ],
    );
  }
}
