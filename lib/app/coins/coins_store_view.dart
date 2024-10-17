import 'dart:io';

import 'package:find_me/app/coins/coins_store_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/components/cards/coins_card.dart';
import 'package:find_me/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class CoinsStoreView extends StatefulWidget {
  const CoinsStoreView({super.key});

  @override
  State<CoinsStoreView> createState() => _CoinsStoreViewState();
}

class _CoinsStoreViewState extends State<CoinsStoreView> {
  GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoinsStoreController>(
      initState: (state) {
        Future.delayed(Duration(milliseconds: 100), () {
          state.controller!.getUser();
          state.controller!.getCoinPackages();
        });
      },
      autoRemove: false,
      builder: (controller) => Scaffold(
        appBar: AppBar(
          toolbarHeight: 83.h,
          title: topBar(name: 'Coins store'.tr, showBackIcon: false),
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Column(
                      children: [
                        Text(
                          'My Coins'.tr,
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w600),
                        ),
                        Image.asset(
                          'assets/images/coin_icon_big.png',
                          //  coin_icon
                          width: 87.0,
                          height: 72.0,
                        ),
                        controller.userModel != null
                            ? Text(
                                controller.userModel!.wallet!.coins.toString(),
                                style: TextStyle(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w600),
                              )
                            : Text(
                                "0",
                                style: TextStyle(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                      ],
                    )
                  ],
                ),
                Divider(
                  thickness: 5,
                  color: Colors.grey.withOpacity(0.3),
                ),
                Text(
                  'Purchased Coins'.tr,
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
                Gap(10.h),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: controller.packages!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 3.0,
                            mainAxisSpacing: 14.0),
                    itemBuilder: (BuildContext context, int index) {
                      Package package = controller.packages![index];
                      StoreProduct coinPackageModel = package.storeProduct;
                      String displayText;
                      if (box.read('locale') == 'ar') {
                        String title = package.storeProduct.title
                            .replaceFirst("coins", "عملات");
                        String description = package.storeProduct.description
                            .replaceFirst("Coins", "عملات");
                        displayText = Platform.isIOS ? title : description;
                      } else {
                        displayText = Platform.isIOS
                            ? package.storeProduct.title
                            : package.storeProduct.description;
                      }
                      return CardCoins(
                        width: 100.w,
                        height: 100.h,
                        bottomText: coinPackageModel.priceString,
                        img: 'assets/images/coin_icon_big.png',
                        text: displayText,
                        imageHeight: 60.h,
                        imageWidth: 60.w,
                        onTap: () async {
                          Get.toNamed(AppRoutes.purchasecoins,
                                  arguments: [controller.userModel, package])!
                              .then((value) {
                            controller.getUser();
                            controller.getCoinPackages();
                          });
                        },
                      );
                    },
                  ),
                ),
                Gap(10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
