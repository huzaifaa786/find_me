import 'package:find_me/app/coins/purchase_coins/purchase_coins_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/components/buttons/app_button.dart';
import 'package:find_me/components/cards/coins_card.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class PurchaseCoinsView extends StatefulWidget {
  const PurchaseCoinsView({super.key});

  @override
  State<PurchaseCoinsView> createState() => _PurchaseCoinsViewState();
}

class _PurchaseCoinsViewState extends State<PurchaseCoinsView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PurchaseCoinsController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                toolbarHeight: 83.h,
                title: topBar(name: 'Purchase Coins'),
                scrolledUnderElevation: 0,
                automaticallyImplyLeading: false,
              ),
              body: SafeArea(
                  child: Column(
                children: [
                  Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CardCoins(
                        height: 180.h,
                        width: 140.w,
                        bottomText: '20 AED',
                        img: 'assets/images/coin_icon.png',
                        text: '1000 coins',
                        imageHeight: 100.h,
                        imageWidth: 100.w,
                        textSize: 16.sp,
                        bottomTextSize: 20.sp,
                      ),
                    ],
                  ),
                  Gap(270),
                  AppButton(
                    height: 60.0.h,
                    width: 304.0.w,
                    title: 'Checkout',
                    onTap: () {
                       
                      UiUtilites.coinsAlert(
                          context, 'xxxxxxxxxxxxxxxx');

                         
                    },
                  )
                ],
              )),
            ));
  }
}