import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ProfileContainer extends StatefulWidget {
  final bool isSelected;
  final bool isDefault;
  final String avatarUrl;
  final bool verified; // Ensure verified is correctly used here
  final Function(bool) onToggle;
  final TextEditingController textController;

  const ProfileContainer({
    Key? key,
    required this.isSelected,
    required this.isDefault,
    required this.avatarUrl,
    required this.verified,
    required this.onToggle,
    required this.textController,
  }) : super(key: key);

  @override
  _ProfileContainerState createState() => _ProfileContainerState();
}

class _ProfileContainerState extends State<ProfileContainer> {
  bool isEditSelected = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Gap(36.w),
        Container(
          height: 68.h,
          width: 290.w,
          decoration: BoxDecoration(
            color: isEditSelected ? AppColors.white : AppColors.profile_grey,
            borderRadius: BorderRadius.circular(40),
            border: Border.all(
              width: 1,
              color: widget.isSelected
                  ? AppColors.primary_color
                  : AppColors.border_grey,
            ),
          ),
          child: Row(
            children: [
              Gap(20.w),
              Checkbox(
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(1),
                ),
                side: BorderSide(
                  color: AppColors.primary_color,
                  width: 0.5,
                ),
                value: widget.isDefault,
                onChanged: (value) {
                  widget.onToggle(value ?? false);
                },
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80.r),
                      border: Border.all(
                        color: AppColors.primary_color,
                        width: 0.5,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(80.r),
                      child: CachedNetworkImage(
                        imageUrl: widget.avatarUrl,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                  if (isEditSelected)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(80.r),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(80.r),
                          ),
                        ),
                      ),
                    ),
                  if (isEditSelected)
                    SvgPicture.asset(
                      'assets/icons/image_upload.svg',
                      color: AppColors.white,
                      height: 21.h,
                      width: 18.w,
                    ),
                ],
              ),
              Gap(10.h),
              Expanded(
                child: isEditSelected
                    ? TextField(
                        controller: widget.textController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 8.h),
                        ),
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    : AppText(
                        title: widget.textController.text,
                        overFlow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,
                        size: 10,
                        fontWeight: FontWeight.w500,
                      ),
              ),
              Gap(10.h),
              if (widget.verified)
                SvgPicture.asset('assets/icons/verified.svg'),
              Gap(40.h)
            ],
          ),
        ),
        Gap(8.w),
        GestureDetector(
          onTap: () {
            setState(() {
              isEditSelected = !isEditSelected;
              if (!isEditSelected) {
                // Save the edited text when exiting edit mode
                widget.onToggle(widget.isDefault);
              }
            });
          },
          child: AppText(
            title: isEditSelected ? 'Save' : 'Edit',
            size: 11,
            color: AppColors.primary_color,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
