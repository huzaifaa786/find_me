// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_me/models/user_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Emojiscard extends StatefulWidget {
  Emojiscard({super.key, });

  @override
  State<Emojiscard> createState() => _EmojiscardState();
}

class _EmojiscardState extends State<Emojiscard> {
  UserProfileModel? profile;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: profile!.emojis!.length,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              profile!.types == "free"
                  ? Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl: profile!.emojis![index].image.toString(),
                          height: 50.h,
                          width: 50.w,
                        ),
                        Text(
                          profile!.emojis![index].giftCount.toString(),
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/coins.svg",
                                height: 23.23.h,
                                width: 23.09.w,
                              ),
                              Text(
                                profile!.emojis![index].coins.toString(),
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            CachedNetworkImage(
                              imageUrl: profile!.emojis![index].image.toString(),
                              width: 50.w,
                              height: 50.h,
                            ),
                            if (profile!.emojis![index].giftCount.toString() != '0')
                              Text(
                                profile!.emojis![index].giftCount
                                    .toString(),
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
            ],
          );
        });
  }
}
