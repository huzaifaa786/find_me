// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:find_me/components/buttons/text_switch_button.dart';
import 'package:find_me/models/user_profile_model.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class PrivacyCard extends StatefulWidget {
  PrivacyCard(
      {Key? key,
      this.userProfile,
      this.image,
      this.publicValue,
      this.publicOnTab,
      this.socialOnTab,
      this.socialValue})
      : super(key: key);
  final userProfile;
  final image;
  final publicValue;
  final publicOnTab;
  final socialValue;
  final socialOnTab;

  @override
  State<PrivacyCard> createState() => _PrivacyCardState();
}

class _PrivacyCardState extends State<PrivacyCard> {
 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 34.w, vertical: 20.h),
          child: Row(
            children: [
              AppText(
                title: widget.userProfile,
                fontWeight: FontWeight.w600,
                size: 14.sp,
              ),
              SvgPicture.asset(widget.image),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 34.w),
          decoration: BoxDecoration(
            color: AppColors.white,
          ),
          child: Column(
            children: [
              Gap(30.h),
              Align(
                alignment: Alignment.centerLeft,
                child: AppText(
                  title: "Profile",
                  size: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Gap(27),
              TextSwitchButton(
                title: "Grant access",
                value: widget.publicValue,
                size: 12.sp,
                FontWeight: FontWeight.w400,
                ontoggle:widget.publicOnTab
              ),
              Gap(15.h),
              Align(
                alignment: Alignment.centerLeft,
                child: AppText(
                  title:
                      "When your account is public , your profile can be \n  viewed by anyone on find me .",
                  size: 10,
                  fontWeight: FontWeight.w400,
                  color: AppColors.hintGrey,
                  textAlign: TextAlign.left,
                ),
              ),
              Gap(37.5),
              Divider(
                thickness: 1,
                color: AppColors.black.withOpacity(0.08),
              ),
              Gap(22.5),
              Align(
                alignment: Alignment.centerLeft,
                child: AppText(
                  title: "Social media & Business card",
                  size: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Gap(27),
              TextSwitchButton(
                title: "Grant access",
                size: 12.sp,
                FontWeight: FontWeight.w400,
                value: widget.socialValue,
                ontoggle:widget.socialOnTab,
              ),
              Gap(15.h),
              Align(
                alignment: Alignment.centerLeft,
                child: AppText(
                  title:
                      "When your profile is private , only people you grant \n  access after receiving a request will be able to look \n  into your profile .",
                  size: 10,
                  fontWeight: FontWeight.w400,
                  color: AppColors.hintGrey,
                  textAlign: TextAlign.left,
                ),
              ),
              Gap(54.h),
            ],
          ),
        ),
      ],
    );
  }
}
