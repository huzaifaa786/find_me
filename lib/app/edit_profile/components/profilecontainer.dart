import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_me/models/user_model.dart';
import 'package:find_me/models/user_profile_model.dart';
import 'package:find_me/routes/app_routes.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileContainer extends StatefulWidget {
  final bool isSelected;
  final bool isDefault;
  final String? avatarUrl;
  final bool verified;
  final bool isEditable;
  final bool isLocked;
  final UserProfileModel? userModel;
  final Function(bool) onToggle;
  final onNameChange;
  final onImageChange;
  final index;
  final TextEditingController textController;

  const ProfileContainer({
    Key? key,
    required this.isSelected,
    required this.isDefault,
    required this.avatarUrl,
    required this.verified,
    required this.isEditable,
    required this.isLocked,
    required this.onToggle,
    required this.textController,
    required this.onNameChange,
    required this.onImageChange,
    required this.index,
    required this.userModel,
  }) : super(key: key);

  @override
  _ProfileContainerState createState() => _ProfileContainerState();
}

class _ProfileContainerState extends State<ProfileContainer> {
  bool isEditSelected = false;
  final ImagePicker _picker = ImagePicker();
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus && isEditSelected) {
        setState(() {
          isEditSelected = false;
          // Save the edited text when exiting edit mode
          widget.onToggle(widget.isDefault);
        });
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

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
                value: widget.isSelected,
                onChanged: widget.isLocked || widget.userModel == null
                    ? null
                    : (value) {
                        widget.onToggle(value ?? false);
                      },
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  GestureDetector(
                    onTap: widget.isLocked
                        ? null
                        : () async {
                            final pickedFile = await _picker.pickImage(
                                source: ImageSource.gallery);
                            if (pickedFile != null) {
                              widget.onImageChange(widget.index, pickedFile);
                            }
                          },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60.r),
                        border: Border.all(
                          color: AppColors.primary_color,
                          width: 0.5,
                        ),
                      ),
                      child: !widget.isLocked
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(80.r),
                              child: widget.avatarUrl != null
                                  ? CachedNetworkImage(
                                      imageUrl: widget.avatarUrl!,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    )
                                  : SvgPicture.asset(
                                      "assets/images/User.svg",
                                      fit: BoxFit.cover,
                                    ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(80.r),
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                                child: SvgPicture.asset(
                                  "assets/images/User.svg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                    ),
                  ),
                  if (widget.isLocked)
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
                  if (widget.isLocked)
                    SvgPicture.asset(
                      'assets/icons/lock.svg',
                      color: AppColors.white,
                      height: 21.h,
                      width: 18.w,
                    ),
                ],
              ),
              Gap(10.h),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (!widget.isLocked && widget.isEditable) {
                      setState(() {
                        isEditSelected = true;
                        _focusNode.requestFocus();
                      });
                    }
                  },
                  child: isEditSelected && widget.isEditable
                      ? TextField(
                          controller: widget.textController,
                          focusNode: _focusNode,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.borderGrey)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.borderGrey)),
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(vertical: 8.h),
                          ),
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          onEditingComplete: () {
                            if (widget.textController.text.isNotEmpty) {
                              widget.onNameChange(
                                  widget.index, widget.textController.text);
                            } else {
                              widget.textController.text =
                                  widget.userModel?.name ?? '';
                            }

                            setState(() {
                              isEditSelected = false;
                              _focusNode.unfocus();
                              // Save the edited text when exiting edit mode
                              widget.onToggle(widget.isDefault);
                            });
                          },
                        )
                      : AppText(
                          title: widget.textController.text,
                          color: AppColors.primary_color,
                          overFlow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,
                          size: 10,
                          fontWeight: FontWeight.w500,
                        ),
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
        if (widget.userModel != null)
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.profile, arguments: widget.userModel);
            },
            child: AppText(
              title: 'Edit',
              size: 11,
              color: AppColors.primary_color,
              fontWeight: FontWeight.w500,
            ),
          ),
      ],
    );
  }
}
