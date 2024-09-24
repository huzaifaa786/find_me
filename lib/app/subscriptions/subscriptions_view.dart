// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:find_me/app/home/components/home_gif_button.dart';
import 'package:find_me/app/subscriptions/components/subscription_features.dart';
import 'package:find_me/app/subscriptions/subscriptions_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/components/buttons/app_button.dart';
import 'package:find_me/components/buttons/gif_button.dart';
import 'package:find_me/services/revenue_cat_service.dart';
import 'package:find_me/utils/base_url.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:find_me/utils/images/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SubscriptionsView extends StatefulWidget {
  const SubscriptionsView({super.key});

  @override
  State<SubscriptionsView> createState() => _SubscriptionsViewState();
}

class _SubscriptionsViewState extends State<SubscriptionsView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubscriptionsController>(
      builder: (controller) => Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 43.w),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: [
                  AppColors.shadepurple,
                  AppColors.shadeblue,
                  AppColors.shadeLightCyan1,
                  AppColors.shade_light_cyan2,
                  AppColors.shadelightcyan3,
                ],
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Gap(28.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: SvgPicture.asset(
                          ImagesConst.backIcon,
                          height: 28.h,
                          width: 28.w,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      SizedBox(
                          height: 95.h,
                          width: 95.w,
                          child: GifButton(onTap: () {}, showOpacity: true)),
                      Text(""),
                    ],
                  ),
                  Gap(20.h),

                  Gap(24),
                  Center(
                    child: Text(
                      "Try Find Me Premium for".tr,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                    ),
                  ),
                  Center(
                    child: Text(
                      "${controller.package?.storeProduct.priceString} / month"
                          .tr,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                    ),
                  ),

                  Gap(30),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Features:".tr,
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16.sp),
                      )),
                  Gap(10),
                  SubscriptionFeatures(
                    title: "Expanded User View".tr,
                    subtitle:
                        "Upgrade to view more than 6 users in your proximity."
                            .tr,
                    value: 1,
                    groupValue: controller.selectedOption,
                    onChanged: (value) => controller.selectOption(value!),
                  ),
                  Gap(27),
                  SubscriptionFeatures(
                    title: "Unlock User Profile 3 and Profile 4".tr,
                    subtitle: "Create 2 additional profiles.".tr,
                    value: 2,
                    groupValue: controller.selectedOption,
                    onChanged: (value) => controller.selectOption(value!),
                  ),
                  Gap(32),
                  SubscriptionFeatures(
                    title: "Unlimited name changes".tr,
                    subtitle:
                        "Change the name of profile 2, 3 and 4 at any time.".tr,
                    value: 3,
                    groupValue: controller.selectedOption,
                    onChanged: (value) => controller.selectOption(value!),
                  ),
                  Gap(32),
                  SubscriptionFeatures(
                    title: "Find Out Who Sent Request".tr,
                    subtitle:
                        "Receive notifications with the username and profile image of users who request to view your profile, social media accounts, or digital business card."
                            .tr,
                    value: 4,
                    groupValue: controller.selectedOption,
                    onChanged: (value) => controller.selectOption(value!),
                  ),
                  Gap(24),
                  Center(
                    child: Text(
                      "1 month free trial. Then monthly plan for".tr,
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                  ),
                  Center(
                    child: Text(
                      "${controller.package?.storeProduct.priceString} .Cancel anytime."
                          .tr,
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                  ),
                  Gap(24),
                  InkWell(
                    onTap: () async {
                      if (controller.package != null) {
                        await purchaseSubscription(
                            context, controller.package!);
                      }
                    },
                    child: Container(
                      height: 60.12.h,
                      width: 285.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.r),
                          color: AppColors.primary_color,
                          border: Border.all(color: AppColors.primary_color)),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            text: "Try 1 month for ".tr,
                            style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp),
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    '${controller.package?.storeProduct.currencyCode} 0'
                                        .tr,
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    decorationThickness: 4),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  //
                  Gap(24),
                  Center(
                    child: RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        text:
                            "Recurring Billing: By proceeding, you confirm that you are at "
                                .tr,
                        style: TextStyle(
                          color: AppColors.hintGrey,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'least 17 years old and agree to the '.tr,
                            style: TextStyle(
                              color: AppColors.hintGrey,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: ' terms. '.tr,
                            style: TextStyle(
                              color: AppColors.primary_color,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                controller.launchWebUrl(termsUrl);
                              },
                          ),
                          TextSpan(
                            text: 'Please review the '.tr,
                            style: TextStyle(
                              color: AppColors.hintGrey,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: 'Privacy Policy '.tr,
                            style: TextStyle(
                              color: AppColors.primary_color,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                controller.launchWebUrl(privacyUrl);
                              },
                          ),
                          TextSpan(
                            text:
                                'and applicable restrictions. Note that refunds\n'
                                    .tr,
                            style: TextStyle(
                              color: AppColors.hintGrey,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text:
                                'are not available for partial billing periods.'
                                    .tr,
                            style: TextStyle(
                              color: AppColors.hintGrey,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: 'End User License Agreement.'.tr,
                            style: TextStyle(
                              color: AppColors.primary_color,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                controller.launchWebUrl(restrictionUrl);
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(30),
                ],
              ),
            )),
      ))),
    );
  }
}
