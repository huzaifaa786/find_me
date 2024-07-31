// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:find_me/utils/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmojisCard extends StatelessWidget {
  const EmojisCard({super.key, this.picture, this.value});
  final picture;
  final String? value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          picture,
          height: 46.h,
          width: 4.w,
        ),
        AppText(
          title: value.toString(),
          size: 15,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }
}
