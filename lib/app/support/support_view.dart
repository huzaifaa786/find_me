// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:find_me/app/support/support_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/components/buttons/app_button.dart';
import 'package:find_me/components/buttons/prefix_icon_button.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:find_me/utils/images/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class SupportView extends StatelessWidget {
  const SupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SupportController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                toolbarHeight: 83.h,
                title: topBar(name: 'Support'),
                automaticallyImplyLeading: false,
                scrolledUnderElevation: 0,
              ),
              body: SafeArea(
                  child: Column(
                children: [
                  Gap(149.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PrefixIconButton(
                        title: 'Contact via email',
                        height: 53.0.h,
                        width: 268.0.w,
                        color: AppColors.primary_color,
                        textColors: AppColors.white,
                        image: ImagesConst.mail,
                        onTap: () async {
                          try {
                            await controller.sendEmail();
                          } catch (e) {
                            // Handle the error
                            print('Error: $e');
                          }
                        },
                      ),
                    ],
                  ),
                  Gap(202.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/find_me.svg'),
                    ],
                  ),
                ],
              )),
            ));
  }
}
