import 'package:find_me/app/edit_profile/components/profilecontainer.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/models/user_profile_model.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'edit_profile_controller.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        toolbarHeight: 83.h,
        title: topBar(name: 'My profiles'.tr, showBackIcon: false),
      ),
      body: SafeArea(
        child: GetBuilder<EditProfileController>(
          autoRemove: false,
          builder: (controller) {
            return Column(
              children: [
                Gap(53.h),
                Row(
                  children: [
                    Gap(49.h),
                    AppText(
                      title: 'Mark as default'.tr,
                      size: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                Gap(10.w),
                Expanded(
                  child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      final profile = controller.profiles[index];
                      UserProfileModel? userProfile;
                      if (controller.userProfiles.asMap().containsKey(index)) {
                        userProfile = controller.userProfiles[index];
                      }
                      final textController = TextEditingController(
                          text: userProfile != null
                              ? profile.name
                              : "+ New Profile ${index + 1}");
                      return Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.w),
                          child: ProfileContainer(
                            userModel: userProfile,
                            isSelected:
                                controller.selectedProfileIndex == index,
                            isDefault:
                                userProfile?.id == controller.currentProfile?.id
                                    ? true
                                    : false,
                            avatarUrl: profile.image,
                            verified: false, // Add logic for verified if needed
                            isEditable: profile.isEditable,
                            isLocked: profile.isLocked,
                            index: index,
                            onImageChange: controller.updateProfileImage,
                            onNameChange: controller.updateProfileName,
                            onToggle: (isDefault) {
                              if (isDefault) {
                                controller.selectProfile(index);
                              }
                            },
                            textController: textController,
                          ));
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
