// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:find_me/app/home/components/home_gif_button.dart';
import 'package:find_me/app/subscriptions/components/subscription_features.dart';
import 'package:find_me/app/subscriptions/subscriptions_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/components/buttons/app_button.dart';
import 'package:find_me/components/buttons/gif_button.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/cupertino.dart';
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
            height: Get.height,
            width: Get.width,
            padding: EdgeInsets.symmetric(horizontal: 43.w),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
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
                  Gap(30.h),
                  SizedBox(
                      height: 110.h,
                      width: 110.w,
                      child: GifButton(onTap: () {}, showOpacity: true)),
                  Gap(24),
                  Text(
                    "Find Me Premium",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                  ),
                  Gap(20),
                  Text(
                    "Try Find Me+ for 5.99 AED/ mo!",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  Gap(6),
                  Center(
                      child: Text(
                    "1-month free trial \n then AED 4.99/month .cancle any time",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    textAlign: TextAlign.center,
                  )),
                  Gap(42),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Subscription Features:",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16.sp),
                      )),
                  Gap(30),
                  SubscriptionFeatures(
                    title: "Unlock User Frequency:",
                    subtitle: "View more than 8 users.",
                    value: 1,
                    groupValue: controller.selectedOption,
                    onChanged: (value) => controller.selectOption(value!),
                  ),
                  Gap(27),
                  SubscriptionFeatures(
                    title: "Additional Profiles:",
                    subtitle: "Create 2 additional profiles.",
                    value: 2,
                    groupValue: controller.selectedOption,
                    onChanged: (value) => controller.selectOption(value!),
                  ),
                  Gap(32),
                  SubscriptionFeatures(
                    title: "Unlimited name changes:",
                    subtitle: "Get unlimited name changes for your account.",
                    value: 3,
                    groupValue: controller.selectedOption,
                    onChanged: (value) => controller.selectOption(value!),
                  ),
                  Gap(44),
                  InkWell(
                    onTap: () {},
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
                            text: "Try for  ",
                            style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp),
                            children: const <TextSpan>[
                              TextSpan(
                                text: 'AED 14.99 /mo',
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: AppColors.dark_blue,
                                    decorationThickness: 4),
                              ),
                              TextSpan(
                                text: ' AED 5.99 /mo',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
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
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text:
                            "Recurring billing .By continuing , you verify that you are at least \n",
                        style: TextStyle(
                          color: AppColors.hintGrey,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                        children: const <TextSpan>[
                          TextSpan(
                            text: '18 years old and agree to these',
                            style: TextStyle(
                              color: AppColors.hintGrey,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: ' terms.',
                            style: TextStyle(
                              color: AppColors.primary_color,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: 'See the',
                            style: TextStyle(
                              color: AppColors.hintGrey,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: ' Privacy \n',
                            style: TextStyle(
                              color: AppColors.primary_color,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text:
                                'statment and retriction .no refunds for partial biling periods.\n',
                            style: TextStyle(
                              color: AppColors.hintGrey,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: 'Restrictions apply.',
                            style: TextStyle(
                              color: AppColors.dark_blue,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
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