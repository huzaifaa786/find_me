// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_me/app/home/home_controller.dart';
import 'package:find_me/models/user_model.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class UserCard extends StatelessWidget {
  final UserModel user;

  UserCard({required this.user});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 77.h,
          width: 77.w,
          child: CircleAvatar(
            radius: 40.r,
            backgroundColor: Colors.transparent,
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: user.currentProfile!.imageUrl ?? '',
                fit: BoxFit.cover,
                width: 80.r,
                height: 80.r,
              ),
            ),
          ),
        ),
        Gap(5.w),
        SizedBox(
          height: 10.h,
          child: Row(
            children: [
              Container(
                width: 7.w,
                height: 7.h,
                decoration: BoxDecoration(
                  color: AppColors.green,
                  shape: BoxShape.circle,
                ),
              ),
              Gap(4.w),
              Expanded(
                flex: 2,
                child: AppText(
                  title: user.currentProfile!.name ?? '',
                  overFlow: TextOverflow.visible,
                  textAlign: TextAlign.justify,
                  size: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
