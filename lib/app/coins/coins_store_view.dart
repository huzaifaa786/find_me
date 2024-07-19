import 'package:find_me/app/coins/coins_store_controller.dart';
import 'package:find_me/app/languages/language_card.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/components/cards/coins_card.dart';
import 'package:find_me/models/coin_package_model.dart';
import 'package:find_me/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CoinsStoreView extends StatefulWidget {
  const CoinsStoreView({super.key});

  @override
  State<CoinsStoreView> createState() => _CoinsStoreViewState();
}

class _CoinsStoreViewState extends State<CoinsStoreView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoinsStoreController>(
<<<<<<< HEAD
      autoRemove: false,
      builder: (controller) => Scaffold(
        appBar: AppBar(
          toolbarHeight: 83.h,
          title: topBar(name: 'Coins store'),
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
=======
        builder: (controller) => Scaffold(
              appBar: AppBar(
                toolbarHeight: 83.h,
                title: topBar(name: 'Coins store', showBackIcon: false),
                scrolledUnderElevation: 0,
                automaticallyImplyLeading: false,
              ),
              body: SafeArea(
                  child: SingleChildScrollView(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
>>>>>>> 9367269ebe4e0404d72107c0c9691646efe3410f
                  children: [
                    Column(
                      children: [
<<<<<<< HEAD
                        Text(
                          'My coins',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Image.asset(
                          'assets/images/coin_icon.png',
                          width: 87.0,
                          height: 72.0,
                        ),
                        Text(
                          controller.userModel?.wallet?.coins?.toString() ?? "0",
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
=======
                        Column(
                          children: [
                            Text(
                              'My coins',
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
                                    controller.userModel!.wallet!.coins
                                        .toString(),
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
                      'Purchased coins',
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w600),
                    ),
                    Gap(10.h),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: AlwaysScrollableScrollPhysics(),
                        itemCount: controller.coinPackages.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 3.0,
                            mainAxisSpacing: 14.0),
                        itemBuilder: (BuildContext context, int index) {
                          CoinPackageModel coinPackageModel =
                              controller.coinPackages[index];
                          return CardCoins(
                            width: 100.w,
                            height: 100.h,
                            bottomText: '${coinPackageModel.price} AED',
                            img: 'assets/images/coin_icon_big.png',
                            text: '${coinPackageModel.coins} coins',
                            imageHeight: 60.h,
                            imageWidth: 60.w,
                            onTap: () {
                              Get.toNamed(AppRoutes.purchasecoins, arguments: [
                                controller.userModel,
                                coinPackageModel
                              ]);
                            },
                          );
                        },
                      ),
                    ),
                    Gap(10),
                    //  CardCoins(),
>>>>>>> 9367269ebe4e0404d72107c0c9691646efe3410f
                  ],
                ),
                Divider(
                  thickness: 5,
                  color: Colors.grey.withOpacity(0.3),
                ),
                Text(
                  'Purchased coins',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gap(10.h),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemCount: controller.coinPackages.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 3.0,
                      mainAxisSpacing: 14.0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      CoinPackageModel coinPackageModel =
                          controller.coinPackages[index];
                      return CardCoins(
                        width: 100.w,
                        height: 100.h,
                        bottomText: '${coinPackageModel.price} AED',
                        img: 'assets/images/coin_icon.png',
                        text: '${coinPackageModel.coins} coins',
                        onTap: () {
                          Get.toNamed(
                            AppRoutes.purchasecoins,
                            arguments: [controller.userModel, coinPackageModel],
                          );
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
