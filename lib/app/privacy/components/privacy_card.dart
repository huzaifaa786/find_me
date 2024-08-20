// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:find_me/components/buttons/text_switch_button.dart';
import 'package:find_me/models/user_profile_model.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class PrivacyCard extends StatefulWidget {
  PrivacyCard({
    Key? key,
    this.userProfile,
    this.image,
    this.publicValue,
    this.publicOnTab,
    this.socialOnTab,
    this.socialValue,
  }) : super(key: key);

  final String? userProfile;
  final String? image;
  final bool? publicValue;
  final Function(bool)? publicOnTab;
  final Function(bool)? socialOnTab;
  final bool? socialValue;

  @override
  State<PrivacyCard> createState() => _PrivacyCardState();
}

class _PrivacyCardState extends State<PrivacyCard> {
  @override
  Widget build(BuildContext context) {
    bool isInactive = widget.publicOnTab == null || widget.socialOnTab == null;
    return Opacity(
      opacity: isInactive ? 0.5 : 1.0,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 34.w, vertical: 20.h),
            child: Row(
              children: [
                AppText(
                  title: widget.userProfile ?? '',
                  fontWeight: FontWeight.w600,
                  size: 14.sp,
                ),
                if (widget.image != null && widget.image!.isNotEmpty)
                  SvgPicture.asset(widget.image!),
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
                    title: "Profile".tr,
                    size: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Gap(27),
                TextSwitchButton(
                  title: "Grant access".tr,
                  value: widget.publicValue ?? false,
                  size: 12.sp,
                  FontWeight: FontWeight.w400,
                  ontoggle: widget.publicOnTab ?? (value) {},
                ),
                Gap(15.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: AppText(
                    title:
                        "When your account is public, your profile can be viewed by anyone on find me.".tr,
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
                    title: "Social media & Business card".tr,
                    size: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Gap(27),
                TextSwitchButton(
                  title: "Grant access".tr,
                  size: 12.sp,
                  FontWeight: FontWeight.w400,
                  value: widget.socialValue ?? false,
                  ontoggle: widget.socialOnTab ?? (value) {},
                ),
                Gap(15.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: AppText(
                    title:
                        "When your profile is private, only people you grant access after receiving a request will be able to look into your profile.".tr,
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
      ),
    );
  }
} 