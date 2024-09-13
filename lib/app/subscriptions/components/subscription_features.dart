import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:find_me/utils/colors/app_colors.dart';

class SubscriptionFeatures extends StatelessWidget {
  const SubscriptionFeatures({
    super.key,
    required this.subtitle,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  final String title;
  final String subtitle;
  final int value;
  final int groupValue;
  final ValueChanged<int?> onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
                Gap(6),
                Text(
                  subtitle,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black),
                ),
              ],
            ),
          ),
          value == groupValue
              ? SvgPicture.asset(
                  "assets/icons/check-circle.svg",
                  color: AppColors.primary_color,
                )
              : SvgPicture.asset(
                  "assets/icons/check-circle.svg",
                ),
        ],
      ),
    );
  }
}
