// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:io';

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
                    name: controller.profileBusinessCardModel != null
                        ? 'Edit business card'
                        : 'Create business card'),
                scrolledUnderElevation: 0,
                automaticallyImplyLeading: false,
              ),
              body: SafeArea(
                  child: Padding(
                padding: EdgeInsets.only(left: 56.w, right: 56.w),
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
                                  title: 'Add photo',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                            title: '*Optional',
                            color: AppColors.light_grey,
                            size: 10,
                            fontWeight: FontWeight.w400,
                          )
                        ],
                      ),
                      Gap(24.h),
                      Divider(
                        color: AppColors.border_grey,
                        height: 1.h,
                        indent: 10.w,
                        endIndent: 10.w,
                      ),
                      Gap(20.h),
                      Row(
                        children: [
                          SizedBox(
                            width: 135.w,
                            child: AppTextFields(
                              hintText: 'First name',
                              controller: controller.firstnameController,
                              fieldValidator: (value) =>
                                  Validators.emptyStringValidator(
                                      "First name", value),
                            ),
                          ),
                          Gap(7.h),
                          SizedBox(
                            width: 135.w,
                            child: AppTextFields(
                              hintText: 'Last name',
                              controller: controller.lastnameController,
                              fieldValidator: (value) =>
                                  Validators.emptyStringValidator(
                                      "Last name", value),
                            ),
                          ),
                        ],
                      ),
                      Gap(20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Gap(25.h),
                          AppText(
                            title: '*Optional',
                            color: AppColors.light_grey,
                            size: 10,
                            fontWeight: FontWeight.w400,
                          )
                        ],
                      ),
                      Gap(10.h),
                      AppTextFields(
                        hintText: 'Company name',
                        controller: controller.companyNameController,
                      ),
                      Gap(19.h),
                      AppTextFields(
                        hintText: 'Job title',
                        controller: controller.jobTitleController,
                        fieldValidator: (value) =>
                            Validators.emptyStringValidator("Job title", value),
                      ),
                      Gap(19.h),
                      PhoneInputField(
                        onCountryChanged: controller.onCountryChanged,
                        errorText: controller.invalidNumberMessage,
                        onChanged: controller.phoneValidation,
                        controller: controller.pcontroller,
                        initialCode: controller.selectedCountry!.code,
                      ),
                      Gap(19.h),
                      AppTextFields(
                        hintText: 'Email',
                        controller: controller.emailController,
                        fieldValidator: (value) =>
                            Validators.emailValidator(value),
                      ),
                      Gap(19.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Gap(25.h),
                          AppText(
                            title: 'Social media accounts',
                            size: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          Gap(8.w),
                          AppText(
                            title: '*Optional',
                            color: AppColors.light_grey,
                            size: 10,
                            fontWeight: FontWeight.w400,
                          )
                        ],
                      ),
                      Gap(20.h),
                      Row(
                        children: [
                          SizedBox(
                            width: 135.w,
                            child: AppTextFields(
                              icon: 'assets/icons/Instagram.svg',
                              hintText: ' Instagram',
                              controller: controller.instagramController,
                              color: AppColors.primary_color,
                            ),
                          ),
                          Gap(7.h),
                          SizedBox(
                            width: 135.w,
                            child: AppTextFields(
                              icon: 'assets/icons/twitter-x 1.svg',
                              hintText: 'Twitter',
                              controller: controller.twitterController,
                              color: AppColors.primary_color,
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
                              icon: 'assets/icons/tiktok.svg',
                              hintText: 'Tiktok',
                              controller: controller.tiktokController,
                              color: AppColors.primary_color,
                            ),
                          ),
                          Gap(7.h),
                          SizedBox(
                            width: 135.w,
                            child: AppTextFields(
                              icon: 'assets/icons/snapchat.svg',
                              hintText: 'Snapchat',
                              controller: controller.snapchatController,
                              color: AppColors.primary_color,
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
                              hintText: 'Facebook',
                              controller: controller.facebookController,
                              color: AppColors.primary_color,
                            ),
                          ),
                          Gap(7.h),
                          SizedBox(
                            width: 135.w,
                            child: AppTextFields(
                              icon: 'assets/icons/linkedin-blue.svg',
                              hintText: 'Linkedin',
                              controller: controller.linkedinController,
                              color: AppColors.primary_color,
                            ),
                          ),
                        ],
                      ),
                      Gap(30.h),
                      AppButton(
                        title: 'Submit',
                        height: 50.0.h,
                        width: 304.0.w,
                        onTap: () {
                          controller.submitBusinessCard();
                          // UiUtilites.showBusinessCardDialog(
                          //     context, 'aaaaaahwt', 'email@yagoooooo','');
                          // UiUtilites.showBusinessCardDialog(
                          //     context: context,
                          //     name: 'usama',
                          //     email: 'ali@gmail.com',
                          //     image: 'assets/images/person.png',
                          //     instagram: '@wiliamX2',
                          //     twitter: '@wiliamX2',
                          //     facebook: '@wiliamX2',
                          //     tiktok: '@wiliamX2',
                          //     notification: '@wiliamX2',
                          //     smartphoneNumber: '@+971 8876 5467');
                        },
                      ),
                      Gap(30.h),
                    ],
                  ),
                ),
              )),
            ));
  }
}

  // PrefixIconButton(
  //                           title: 'Download',
  //                           height: 53.0.h,
  //                           width: 268.0.w,
  //                           color: AppColors.primary_color,
  //                           textColors: AppColors.white,
  //                           image: ImagesConst.mail,
  //                           onTap: () {},
  //                         );