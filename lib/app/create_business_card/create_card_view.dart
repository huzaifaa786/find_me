// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_me/app/create_business_card/create_card_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/components/buttons/app_button.dart';
import 'package:find_me/components/buttons/prefix_icon_button.dart';
import 'package:find_me/components/textfields/app_textfields.dart';
import 'package:find_me/components/textfields/phone_inputfield.dart';
import 'package:find_me/helpers/validator.dart';
import 'package:find_me/routes/app_routes.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:find_me/utils/images/images.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CreateCardView extends StatefulWidget {
  const CreateCardView({super.key});

  @override
  State<CreateCardView> createState() => _CreateCardViewState();
}

class _CreateCardViewState extends State<CreateCardView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateCardController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                toolbarHeight: 83.h,
                title: topBar(
                    fontSize: 16,
                    name: controller.profileBusinessCardModel != null
                        ? 'Edit business card'.tr
                        : 'Create Business Card'.tr),
                scrolledUnderElevation: 0,
                automaticallyImplyLeading: false,
              ),
              body: SafeArea(
                  child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Gap(23),
                    GestureDetector(
                      onTap: () {
                        controller.pickImageFromGallery();
                      },
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 72.h,
                                width: 79.w,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: AppColors.primary_color,
                                  ),
                                  borderRadius: BorderRadius.circular(11),
                                ),
                                child: Container(
                                  height: 21.h,
                                  width: 27.w,
                                  child: controller.profileImage != null
                                      ? Image.file(
                                          controller.profileImage!,
                                          fit: BoxFit.scaleDown,
                                        )
                                      : controller.profileBusinessCardModel !=
                                                  null &&
                                              controller
                                                      .profileBusinessCardModel!
                                                      .image !=
                                                  null
                                          ? CachedNetworkImage(
                                              imageUrl: controller
                                                  .profileBusinessCardModel!
                                                  .image!,
                                              fit: BoxFit.scaleDown,
                                            )
                                          : SvgPicture.asset(
                                              'assets/icons/image_upload.svg',
                                              fit: BoxFit.scaleDown,
                                            ),
                                ),
                              ),
                            ],
                          ),
                          Gap(16.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppText(
                                title: 'Add photo'.tr,
                                color: AppColors.primary_color,
                                size: 12,
                                fontWeight: FontWeight.w500,
                              )
                            ],
                          ),
                          Gap(7.h),
                        ],
                      ),
                    ),
                    Gap(14.h),
                    Divider(
                      color: AppColors.black.withOpacity(0.11),
                      thickness: 8.0,
                    ),
                    Gap(20.h),
                    Padding(
                      padding: EdgeInsets.only(left: 56.w, right: 56.w),
                      child: Column(
                        children: [
                          AppTextFields(
                            hintText: 'First name'.tr,
                            controller: controller.firstnameController,
                            fieldValidator: (value) =>
                                Validators.emptyStringValidator(
                                    "First name".tr, value),
                          ),
                          Gap(19.h),
                          AppTextFields(
                            hintText: 'Last name'.tr,
                            controller: controller.lastnameController,
                            fieldValidator: (value) =>
                                Validators.emptyStringValidator(
                                    "Last name".tr, value),
                          ),
                          Gap(19.h),
                          AppTextFields(
                            hintText: 'Company name'.tr,
                            controller: controller.companyNameController,
                          ),
                          Gap(19.h),
                          AppTextFields(
                            hintText: 'Job title'.tr,
                            controller: controller.jobTitleController,
                            fieldValidator: (value) =>
                                Validators.emptyStringValidator(
                                    "Job title".tr, value),
                          ),
                          Gap(19.h),
                          PhoneInputField(
                            onCountryChanged: controller.onCountryChanged,
                            errorText: controller.invalidNumberMessage,
                            onChanged: controller.phoneValidation,
                            controller: controller.pcontroller,
                            initialCode: controller.selectedCountry!.code,
                            height: box?.read('locale') != "ar" ? 80 : 50,
                          ),
                          Gap(19.h),
                          AppTextFields(
                            hintText: 'Email'.tr,
                            controller: controller.emailController,
                            fieldValidator: (value) =>
                                Validators.emailValidator(value),
                          ),
                          Gap(25.h),
                          Align(
                            alignment: box?.read('locale') != "ar"
                                ? Alignment.centerLeft
                                : Alignment.centerRight,
                            child: AppText(
                              title: 'Social Media Accounts'.tr,
                              size: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Gap(20.h),
                          Row(
                            children: [
                              SizedBox(
                                width: 135.w,
                                child: AppTextFields(
                                  icon: 'assets/icons/instagram.svg',
                                  hintText: 'Username'.tr,
                                  controller: controller.instagramController,
                                  color: AppColors.black,
                                ),
                              ),
                              Gap(7.h),
                              SizedBox(
                                width: 135.w,
                                child: AppTextFields(
                                  icon: 'assets/icons/twitter-x 1.svg',
                                  hintText: 'Username'.tr,
                                  controller: controller.twitterController,
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                          Gap(25.h),
                          Row(
                            children: [
                              SizedBox(
                                width: 135.w,
                                child: AppTextFields(
                                  icon: 'assets/icons/web.svg',
                                  hintText: 'Username'.tr,
                                  controller: controller.websiteController,
                                  color: AppColors.black,
                                ),
                              ),
                              Gap(7.h),
                              SizedBox(
                                width: 135.w,
                                child: AppTextFields(
                                  icon: 'assets/icons/linkedin.svg',
                                  hintText: 'Username'.tr,
                                  controller: controller.linkedinController,
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                          Gap(25.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 135.w,
                                child: AppTextFields(
                                  icon: 'assets/icons/facebook.svg',
                                  hintText: 'Username'.tr,
                                  controller: controller.facebookController,
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                          Gap(40.h),
                          AppButton(
                            title: controller.profileBusinessCardModel != null
                                ? 'Update'.tr
                                : 'Create'.tr,
                            height: 50.0.h,
                            width: 304.0.w,
                            onTap: () {
                              controller.submitBusinessCard();
                            },
                          ),
                          Gap(20.h),
                          if (controller.profileBusinessCardModel != null)
                            AppButton(
                              title: 'Delete Business Card'.tr,
                              color: AppColors.white,
                              textColors: AppColors.red,
                              borderColor: AppColors.red,
                              height: 50.0.h,
                              width: 304.0.w,
                              onTap: () {
                                UiUtilites.accountAlert(context,
                                    text:
                                        "Are you sure you want to Delete Business Card"
                                            .tr, onTapNo: () {
                                  Get.back();
                                }, onTapYes: () {
                                  controller.deleteBusinessCard(
                                      controller.profileBusinessCardModel?.id);
                                });
                              },
                            ),
                          Gap(30.h),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
            ));
  }
}
