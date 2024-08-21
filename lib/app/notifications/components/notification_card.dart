// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_me/models/notification_model.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Notificationscard extends StatelessWidget {
  Notificationscard({
    super.key,
    this.item,
  });
  final NotificationModel? item;
  GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(3),
        Container(
          height: Get.height * 0.1,
          // width: Get.width,
          decoration: BoxDecoration(color: AppColors.white),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 7,
                    width: 7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppColors.lightSkyBlue,
                    ),
                  ),
                  Gap(8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(80.r),
                    child: item!.senderProfile!.image != null
                        ? CachedNetworkImage(
                            height: 50,
                            width: 50,
                            imageUrl: item!.senderProfile!.image.toString(),
                            fit: BoxFit.cover,
                            // placeholder: (context, url) =>
                            //     CircularProgressIndicator(),
                            // errorWidget: (context, url, error) =>
                            //     Icon(Icons.error),
                          )
                        : SvgPicture.asset(
                            "assets/icons/card_profile_picture.svg",
                            width: 50,
                            height: 50,
                          ),
                  ),
                  Gap(10.w),
                  Expanded(
                    child: AppText(
                      title: box.read('locale') != 'ar'
                          ? item!.body.toString()
                          : item!.arbody.toString(),
                      maxLines: 2,
                      overFlow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Gap(10.w),
              Divider(
                color: AppColors.light_grey.withOpacity(0.5),
                // indent: 0.5,
                // endIndent: 0.5,
                thickness: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
