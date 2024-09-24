// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_me/models/user_model.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class UserCard extends StatelessWidget {
  final UserModel user;
  final onTap;
  final bool isBlur;

  UserCard({required this.user, this.onTap, this.isBlur = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 77.h,
              width: 77.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey, width: 0.1),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(38.5.h),
                child: !isBlur
                    ? user.currentProfile!.imageUrl != null
                        ? CachedNetworkImage(
                            imageUrl: user.currentProfile!.imageUrl ?? '',
                            fit: BoxFit.cover,
                            width: 77.h,
                            height: 77.h,
                          )
                        : SvgPicture.asset(
                            "assets/images/User.svg",
                            fit: BoxFit.cover,
                            width: 77.h,
                            height: 77.h,
                          )
                    : ImageFiltered(
                        imageFilter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                        child: user.currentProfile!.imageUrl != null
                            ? CachedNetworkImage(
                                imageUrl: user.currentProfile!.imageUrl ?? '',
                                fit: BoxFit.cover,
                                width: 77.h,
                                height: 77.h,
                              )
                            : SvgPicture.asset(
                                "assets/images/User.svg",
                                fit: BoxFit.cover,
                                width: 77.h,
                                height: 77.h,
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
                    child: Row(
                      children: [
                        AppText(
                          title: user.currentProfile!.name ?? '',
                          overFlow: TextOverflow.visible,
                          textAlign: TextAlign.justify,
                          size: 10,
                          fontWeight: FontWeight.w500,
                        ),
                        if(user.currentProfile!.isVerified)
                        SvgPicture.asset('assets/icons/verified.svg'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
