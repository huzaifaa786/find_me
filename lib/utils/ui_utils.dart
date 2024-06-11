import 'dart:ui';

import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/images/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class UiUtilites {
  static registerSuccessAlert(context, title) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        // Future.delayed(Duration(seconds: 2), () {
        //   Get.back();
        // });

        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: AlertDialog(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            shape: RoundedRectangleBorder(
                side: BorderSide(
                  //color: Colors.transparent, style: BorderStyle.solid
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            // contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Gap(10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(ImagesConst.tickicon),
                      AppText(
                        title: 'Thank You!',
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  Gap(30),
                  AppText(
                    title: 'Your feedback helps make the app\n better for everyone. ',
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w400,
                    size: 10.sp,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
