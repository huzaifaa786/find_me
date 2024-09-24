// ignore_for_file: prefer_typing_uninitialized_variables, unused_field, unused_element, deprecated_member_use, prefer_const_constructors

import 'dart:io';

import 'package:find_me/app/account/profile/profile_view.dart';
import 'package:find_me/app/auth/signup/signup_view.dart';
import 'package:find_me/app/coins/coins_store_view.dart';
import 'package:find_me/app/edit_profile/edit_profile_view.dart';
import 'package:find_me/app/emoji_store/emoji_store_view.dart';
import 'package:find_me/app/home/home_controller.dart';
import 'package:find_me/app/home/home_view.dart';
import 'package:find_me/app/main_view/main_controller.dart';
import 'package:find_me/app/notifications/notifications_view.dart';
import 'package:find_me/app/report/report_view.dart';
import 'package:find_me/components/buttons/gif_button.dart';
import 'package:find_me/components/cards/custom_navbar.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart' as badges;
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final List<Widget> _fragments = [
    HomeView(),
    CoinsStoreView(),
    EmojiStoreView(),
    EditProfileView(),
  ];
  static HomeController homeController = Get.find();

  Widget _buildNavigationBarItem(MainController controller, int index,
      String iconPath, String label, int cartLength) {
        
    return InkWell(
      onTap: () {
        setState(() {
          controller.navigationMenuIndex = index;
        });
      },
      // child: Icon(Icons.abc, color: Colors.white,),
      child: Container(
        width: 50,
        padding: EdgeInsets.only(bottom: 13),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            index == 1
                ? badges.Badge(
                    badgeStyle: const badges.BadgeStyle(
                        badgeColor: AppColors.primary_color),
                    showBadge: cartLength > 0,
                    position: badges.BadgePosition.topStart(top: -10.h),
                    badgeContent: AppText(
                      title: '$cartLength',
                      color: AppColors.white,
                      overFlow: TextOverflow.ellipsis,
                    ),
                    child: SvgPicture.asset(
                      iconPath,
                      fit: BoxFit.scaleDown,
                      height: 27.h,
                      width: 27.w,
                      color: controller.navigationMenuIndex == index
                          ? AppColors.primary_color
                          : AppColors.black,
                    ),
                  )
                : index == 2
                    ? SvgPicture.asset(
                        iconPath,
                        fit: BoxFit.scaleDown,
                        height: 27.h,
                        width: 27.w,
                        color: controller.navigationMenuIndex == index
                            ? AppColors.primary_color
                            : AppColors.black,
                      )
                    : SvgPicture.asset(
                        iconPath,
                        fit: BoxFit.scaleDown,
                        height: 27.h,
                        width: 27.w,
                        color: controller.navigationMenuIndex == index
                            ? AppColors.primary_color
                            : AppColors.black,
                      ),
            Gap(4.h),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: Get.width),
              child: AppText(
                title: label,
                overFlow: TextOverflow.ellipsis,
                color: controller.navigationMenuIndex == index
                    ? AppColors.primary_color
                    : AppColors.black,
                size: 10.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: GetBuilder<MainController>(
        autoRemove: false,
        builder: (controller) {
          return Directionality(
            textDirection: box.read('locale') != 'ar'
                ? TextDirection.ltr
                : TextDirection.rtl,
            child: Scaffold(
              body: SafeArea(
                child: _fragments[controller.navigationMenuIndex],
              ),
              bottomNavigationBar: CustomPaint(
                size: Size(120, 150),
                painter: RPSCustomPainter(),
                child: Container(
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: Platform.isIOS ? 7 : 0),
                  height: 134.h,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: _buildNavigationBarItem(controller, 0,
                            'assets/icons/home.svg', 'Home'.tr, 0),
                      ),
                      Flexible(
                        child: _buildNavigationBarItem(controller, 1,
                            'assets/icons/coin.svg', 'Coins'.tr, 0),
                      ),

                      Container(
                          margin: EdgeInsets.only(bottom: 20, right: 5),
                          height: 80,
                          width: 80,
                          child: GifButton(
                            onTap: () {
                              controller.onChange(0, isScan: true);
                            },
                            showOpacity: true,
                            isActive: homeController.isSearching,
                          )),

                      Flexible(
                        child: _buildNavigationBarItem(controller, 2,
                            'assets/icons/emojis.svg', 'Emojis'.tr, 1),
                      ),
                      Flexible(
                        child: _buildNavigationBarItem(controller, 3,
                            'assets/icons/profile.svg', 'Profile'.tr, 0),
                      ),

                      //  coins
                    ],
                  ),
                ),
                // child: BottomAppBar(
                //   shape: const CircularNotchedRectangle(),
                //   notchMargin: 5,
                //   elevation: 30.0,
                //   surfaceTintColor: AppColors.white,
                //   color: AppColors.white,
                //   shadowColor: AppColors.black,
                //   child: SizedBox(
                //     height: 50.h,
                //     child: Row(
                //       mainAxisSize: MainAxisSize.max,
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: <Widget>[
                //         _buildNavigationBarItem(controller, 0,
                //             'assets/icons/home.svg', 'Home'.tr, 0),
                //         _buildNavigationBarItem(controller, 1,
                //             'assets/icons/coin.svg', 'Coins Store'.tr, 0),
                //         // _buildNavigationBarItem(
                //         //     2, 'assets/icons/add.svg', 'Add'.tr, 0),
                //         _buildNavigationBarItem(controller, 2,
                //             'assets/icons/cart.svg', 'Emoji Store'.tr, 1),
                //         _buildNavigationBarItem(controller, 3,
                //             'assets/icons/profile.svg', 'Profile'.tr, 0),

                //         //  coins
                //       ],
                //     ),
                //   ),
                // ),
              ),
            ),
          );
        },
      ),
    );
  }
}
