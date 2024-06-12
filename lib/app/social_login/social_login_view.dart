
import 'package:find_me/app/social_login/social_login_controller.dart';
import 'package:find_me/components/appbars/topbar_icon.dart';

import 'package:find_me/components/buttons/app_button.dart';
import 'package:find_me/components/cards/social_card.dart';

import 'package:find_me/components/textfields/app_textfields.dart';
import 'package:find_me/components/textfields/phone_inputfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SocialLoginView extends StatelessWidget {
  const SocialLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SocialLoginController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: topBarWithIcon(
                    name: 'continue with',
                    name2: 'apple',
                    image: 'assets/icons/applelogo copy.svg'
                    ),
                automaticallyImplyLeading: false,
              ),

              body: SafeArea(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 58.w),
                child: Column(
                  children: [
                    Gap(53.h),
                    SocialCard(
                        text: 'Gostemail@icloud.com',
                        image: 'assets/icons/google_img.svg',
                        ontap: () {}),
                    Gap(47.h),
                    AppTextFields(
                      hintText: 'User name',
                    ),
                    Gap(25),
                    PhoneInputField(
                      onCountryChanged: controller.onCountryChanged,
                      errorText: controller.invalidNumberMessage,
                      onChanged: controller.phoneValidation,
                      controller: controller.pcontroller,
                    ),
                    Gap(54),
                     AppButton(
                    title: 'Submit',
                    height: 50.0.h,
                    width: 304.0.w,
                    onTap: () {},
                  ),
                  ],
                ),
              )),
            ));
  }
}