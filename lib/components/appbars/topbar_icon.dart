import 'package:find_me/utils/images/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

Widget topBarWithIcon({String? name,String? name2,String? image}) {
  
  return Padding(
      padding: EdgeInsets.only(left: 25.w),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: SvgPicture.asset(
                  ImagesConst.backIcon,
                  height: 28.h,
                  width: 28.w,
                  fit: BoxFit.scaleDown,
                ),
              ),
              Gap(68.w),
              Row(
                children: [
                  Text(name!,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                  // 'continue with'
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name2!,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
            //  'apple'
             Gap(3.w),
              SvgPicture.asset(image!
                ,
              //  'assets/icons/apple.svg'
              ),
            ],
          )
        ],
      ));
}
