import 'package:find_me/app/coins/purchase_coins/purchase_coins_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/components/buttons/app_button.dart';
import 'package:find_me/components/cards/coins_card.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
                title: topBar(name: 'Purchase Coins'.tr),
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
                        width: 180.w,
                        bottomText: controller
                                .coinPackageModel?.storeProduct.priceString ??
                            "",
                        img: 'assets/images/coin_icon_big.png',
                        text: controller.displayText,
                        imageHeight: 120.h,
                        imageWidth: 120.w,
                        textSize: 16.sp,
                        bottomTextSize: 20.sp,
                      ),
                    ],
                  ),
                  Gap(270),
                  AppButton(
                    height: 60.0.h,
                    width: 304.0.w,
                    title: 'Checkout'.tr,
                    onTap: () {
                      controller.buyCoins(
                          context, controller.coinPackageModel!);
                    },
                  )
                ],
              )),
            ));
  }
}
