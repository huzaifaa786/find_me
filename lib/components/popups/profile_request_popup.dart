// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_me/components/buttons/app_button.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProfileRequestPopup extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String requestMessage;
  final onAcceptTap;
  final onRejectTap;

  ProfileRequestPopup({
    required this.name,
    required this.imageUrl,
    required this.requestMessage,
    required this.onAcceptTap,
    required this.onRejectTap,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        width: 300,
        height: 320,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/cancel.svg',
                      height: 20,
                      width: 20,
                    ),
                  ],
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: CachedNetworkImageProvider(imageUrl),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                requestMessage,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppButton(
                    height: 48,
                    width: 104,
                    title: "Reject".tr,
                    textColors: AppColors.red,
                    borderColor: AppColors.red,
                    color: AppColors.white,
                    onTap: onRejectTap,
                  ),
                  SizedBox(width: 20),
                  AppButton(
                    height: 48,
                    width: 104,
                    title: "Accept".tr,
                    textColors: AppColors.white,
                    borderColor: AppColors.green,
                    color: AppColors.green,
                    onTap: onAcceptTap,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
