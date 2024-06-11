import 'package:find_me/app/setting/setting_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/components/buttons/prefix_icon_button.dart';
import 'package:find_me/components/cards/settings_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: topBar(name: 'Settings'),
                automaticallyImplyLeading: false,
              ),
              body: SafeArea(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 34.w),
                child: Column(
                  children: [
                    Gap(4.h),
                  
                    //Gap(12.h),
                   
                   CardSetting(text: 'Subscriptions', image: 'assets/icons/star.svg', ontap: (){}),
                    Gap(12.h),
                     CardSetting(text: 'Account', image: 'assets/icons/user.svg', ontap: (){}),
                    Gap(12.h),
                     CardSetting(text: 'Privacy', image: 'assets/icons/lock (1).svg', ontap: (){}),
                    Gap(12.h),
                     CardSetting(text: 'Notifications', image: 'assets/icons/bell (1).svg', ontap: (){}),
                    Gap(12.h),
                     CardSetting(text: 'Language', image: 'assets/icons/globe.svg', ontap: (){}),
                    Gap(12.h),
                     CardSetting(text: 'Report a problem', image: 'assets/icons/help-circle.svg', ontap: (){}),
                    Gap(12.h),
                     CardSetting(text: 'Location', image: 'assets/icons/map-pin.svg', ontap: (){}),
                    Gap(12.h),
                     CardSetting(text: 'Support', image: 'assets/icons/headphones.svg', ontap: (){}),
                    Gap(12.h),
                     CardSetting(text: 'Terms & Policies', image: 'assets/icons/shield.svg', ontap: (){}),
                    Gap(90.h),
                    PrefixIconButton(height: 50.h, width: 304.w, title:'Log out',textColors: Colors.red,borderColor: Colors.red,image:'assets/icons/log-out.svg' ,)
                    
                 
                    
                    
                  ],
                ),
              )),
            ));
  }
}