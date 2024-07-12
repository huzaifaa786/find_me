// ignore_for_file: prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';

class TextSwitchButton extends StatelessWidget {
  TextSwitchButton(
      {super.key,
      this.ontoggle,
      this.value,
      this.title,
      this.size = 12,
      this.FontWeight });
  final value;
  final ontoggle;
  final title;
  final size;
  final FontWeight ;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          title: title,
          size: size,
          fontWeight: FontWeight,
        ),
        FlutterSwitch(
            height: 25.h,
            width: 45.w,
            activeColor: AppColors.green,
            inactiveColor: Colors.grey,
            value: value,
            onToggle: ontoggle)
      ],
    );
  }
}
