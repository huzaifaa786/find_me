import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get_storage/get_storage.dart';

class CardSetting extends StatelessWidget {
  CardSetting({
    Key? key,
    required this.text,
    required this.image,
    required this.ontap,
  }) : super(key: key);
  final String text;
  final String image;
  GetStorage box = GetStorage();
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(54.r),
      onTap: ontap,
      //onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        height: 51.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  image,
                ),
                Gap(14.h),
                Text(
                  text,
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            box.read('locale') != 'ar'
                ? SvgPicture.asset(
                    'assets/icons/arrow_right.svg',
                  )
                : SvgPicture.asset(
                    'assets/icons/arrow_left.svg',
                  ),
          ],
        ),
      ),
    );
  }
}
