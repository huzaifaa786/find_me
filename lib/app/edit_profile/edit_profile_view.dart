import 'package:find_me/app/edit_profile/components/profilecontainer.dart';
import 'package:find_me/components/appbars/topbar.dart';
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
        title: topBar(name: 'My profiles', showBackIcon: false),
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
                      title: 'Mark as default',
                      size: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                Gap(10.w),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.profiles.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.w),
                        child: ProfileContainer(
                          isSelected: controller.profiles[index].isSelected,
                          isDefault: controller.profiles[index].isDefault,
                          avatarUrl: controller.profiles[index].avatarUrl,
                          verified: true,
                          onToggle: (value) {
                            controller.toggleDefault(index);
                          },
                          textController: controller.profiles[index].controller,
                        ),
                      );
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
