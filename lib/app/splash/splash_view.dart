import 'package:find_me/app/splash/splash_controller.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:find_me/utils/images/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      autoRemove: false,
      builder: (controller) => Scaffold(
        appBar: AppBar(automaticallyImplyLeading: false),
        body: Center(
          child: AppText(
                title: 'Find Me!',
                size: 36.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
        ),
      ),
    );
  }
}
