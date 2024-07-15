// ignore_for_file: prefer_typing_uninitialized_variables, unused_field, unused_element, deprecated_member_use, prefer_const_constructors

import 'package:find_me/app/account/profile/profile_view.dart';
import 'package:find_me/app/auth/signup/signup_view.dart';
import 'package:find_me/app/coins/coins_store_view.dart';
import 'package:find_me/app/edit_profile/edit_profile_view.dart';
import 'package:find_me/app/emoji_store/emoji_store_view.dart';
import 'package:find_me/app/home/home_controller.dart';
import 'package:find_me/app/home/home_view.dart';
import 'package:find_me/app/notifications/notifications_view.dart';
import 'package:find_me/app/report/report_view.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart' as badges;
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with RouteAware {
  int _navigationMenuIndex = 0;

  final List<Widget> _fragments = [
    HomeView(),
    CoinsStoreView(),
    EmojiStoreView(),
    ProfileView(),
    EditProfileView(),
    
  ];

  Widget _buildNavigationBarItem(
      int index, String iconPath, String label, int cartLength) {
    return InkWell(
      onTap: () {
        setState(() {
          _navigationMenuIndex = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          // border: Border.all(),
          color: AppColors.white,
        ),
        width: 70.w,
        child: Center(
          child: InkWell(
            onTap: () {
              setState(() {
                _navigationMenuIndex = index;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                index == 1
                    ? badges.Badge(
                        badgeStyle: const badges.BadgeStyle(
                            badgeColor: AppColors.primary_color),
                        showBadge: cartLength > 0,
                        position: badges.BadgePosition.topStart(top: -10.h),
                        badgeContent: AppText(
                            title: '$cartLength', color: AppColors.white),
                        child: SvgPicture.asset(
                          iconPath,
                          fit: BoxFit.scaleDown,
                          height: 27.h,
                          width: 27.w,
                          color: _navigationMenuIndex == index
                              ? AppColors.primary_color
                              : AppColors.black,
                        ),
                      )
                    : index == 2
                        ? SvgPicture.asset(
                            _navigationMenuIndex == index
                                ? 'assets/icons/addicon.svg'
                                : iconPath,
                            fit: BoxFit.scaleDown,
                            height: 27.h,
                            width: 27.w,
                          )
                        : SvgPicture.asset(
                            iconPath,
                            fit: BoxFit.scaleDown,
                            height: 27.h,
                            width: 27.w,
                            color: _navigationMenuIndex == index
                                ? AppColors.primary_color
                                : AppColors.black,
                          ),
                Gap(4.h),
                AppText(
                  title: label,
                  color: _navigationMenuIndex == index
                      ? AppColors.primary_color
                      : AppColors.black,
                  size: 10.sp,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: GetBuilder<HomeController>(
        autoRemove: false,
        builder: (controller) {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: Scaffold(
              body: SafeArea(
                child: _fragments[_navigationMenuIndex],
              ),
              bottomNavigationBar: BottomAppBar(
                elevation: 30.0,
                surfaceTintColor: AppColors.white,
                color: AppColors.white,
                shadowColor: AppColors.black,
                child: SizedBox(
                  height: 50.h,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                       _buildNavigationBarItem(
                          0, 'assets/icons/home.svg', 'Home'.tr, 0),
                      _buildNavigationBarItem(
                          1, 'assets/icons/coin.svg', 'Coins Store'.tr, 0),
                      _buildNavigationBarItem(
                          2, 'assets/icons/add.svg', 'Add'.tr, 0),
                      _buildNavigationBarItem(
                          3, 'assets/icons/cart.svg', 'Emoji Store'.tr, 1),
                      _buildNavigationBarItem(
                          4, 'assets/icons/profile.svg', 'Profile'.tr, 0),

                      //  coins
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
