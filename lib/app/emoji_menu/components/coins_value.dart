// ignore_for_file: prefer_const_constructors

import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CoinsValue extends StatelessWidget {
  const CoinsValue({
    super.key,
    this.value,
    this.item,
  });
  final value;
  final item;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(item["emjoi"]),
        Row(
          children: [
            SvgPicture.asset(
              "assets/icons/coins.svg",
              height: 19.23.h,
              width: 20.09.w,
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
