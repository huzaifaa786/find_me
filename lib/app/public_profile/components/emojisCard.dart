// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_me/models/user_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Emojiscard extends StatefulWidget {
  Emojiscard({
    super.key,
  });

  @override
  State<Emojiscard> createState() => _EmojiscardState();
}

class _EmojiscardState extends State<Emojiscard> {
  UserProfileModel? profile;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: profile!.emojis!.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 2.0,
          crossAxisSpacing: 2.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              // controller.giftEmoji(profile!.emojis![index].id);
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                CachedNetworkImage(
                  imageUrl: profile!.emojis![index].image,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  width: 55,
                  height: 55,
                ),
                if (profile!.emojis![index].type == "paid")
                  Positioned(
                    top: 19,
                    left: -1,
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/gift_coin.png",
                          height: 22.23.h,
                          width: 22.09.w,
                        ),
                        Text(
                          profile!.emojis![index].coins.toString(),
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                if (profile!.emojis![index].giftCount != "0")
                  Positioned(
                    bottom: 0,
                    child: Text(
                      profile!.emojis![index].giftCount ?? "",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
              ],
            ),
          );
          // return controller
          //             .profile!.emojis![index].type ==
          //         "free"
          //     ? Column(
          //         children: [
          //           CachedNetworkImage(
          //             imageUrl: controller
          //                 .profile!.emojis![index].image,
          //             height: 50.h,
          //             width: 50.w,
          //           ),
          //           if (controller.profile!.emojis![index]
          //                   .giftCount !=
          //               '0')
          //             Text(
          //               controller.profile!.emojis![index]
          //                   .giftCount
          //                   .toString(),
          //               style: TextStyle(
          //                 fontSize: 10.sp,
          //                 fontWeight: FontWeight.w600,
          //               ),
          //             ),
          //         ],
          //       )
          //     : Row(
          //         children: [
          //           Column(
          //             children: [
          //               SvgPicture.asset(
          //                 "assets/icons/coins.svg",
          //                 height: 23.23.h,
          //                 width: 23.09.w,
          //               ),
          //               Text(
          //                 controller.profile!
          //                     .emojis![index].coins
          //                     .toString(),
          //                 style: TextStyle(
          //                   fontSize: 10.sp,
          //                   fontWeight: FontWeight.w600,
          //                 ),
          //               ),
          //             ],
          //           ),
          //           Column(
          //             children: [
          //               CachedNetworkImage(
          //                 imageUrl: controller.profile!
          //                     .emojis![index].image,
          //                 width: 50.w,
          //                 height: 50.h,
          //               ),
          //               Text(
          //                 controller.profile!
          //                     .emojis![index].giftCount
          //                     .toString(),
          //                 style: TextStyle(
          //                   fontSize: 10.sp,
          //                   fontWeight: FontWeight.w600,
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ],
          //       );
        });
  }
}
