import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({
    Key? key,
    required this.text,
    required this.image,
    required this.ontap,
    
  }) : super(key: key);
  final String text;
  final String image;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      //onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: AppColors.inputBorderColor.withOpacity(0.1),
                width: 1.5.w),
            borderRadius: BorderRadius.circular(12.r)),

        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 7),

        // height: 71.h,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  image,
                ),
                Gap(22.h),
                Text(
                  text,
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            // SvgPicture.asset(
            //   'assets/icons/arrow_right.svg',
            // ),
          ],
        ),
      ),
    );
  }
}