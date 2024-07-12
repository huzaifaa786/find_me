import 'package:find_me/app/coins/coins_store_controller.dart';
import 'package:find_me/app/languages/language_card.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/components/cards/coins_card.dart';
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
        builder: (controller) => Scaffold(
              appBar: AppBar(
                toolbarHeight: 83.h,
                title: topBar(name: 'Coins store'),
                scrolledUnderElevation: 0,
                automaticallyImplyLeading: false,
              ),
              body: SafeArea(
                  child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            'My coins',
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.w600),
                          ),
                          Image.asset(
                            'assets/images/coin_icon.png',
                            //  coin_icon
                            width: 87.0,
                            height: 72.0,
                          ),
                          Text(
                            '0.0',
                            style: TextStyle(
                                fontSize: 24.sp, fontWeight: FontWeight.w400),
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
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  ),
                  // Gap(5.h),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        fit: FlexFit.loose,
                        child: GridView.builder(
                          padding:
                              EdgeInsets.only(left: 17, right: 17, top: 15),
                          shrinkWrap: true,
                          physics: AlwaysScrollableScrollPhysics(),
                          itemCount: 9,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 4.0,
                                  mainAxisSpacing: 4.0),
                          itemBuilder: (BuildContext context, int index) {
                            return CardCoins(
                              height: 120.h,
                              width: 100.w,
                              bottomText: '20 AED',
                              img: 'assets/images/coin_icon.png',
                              text: '1000 coins',
                    
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Gap(10),
                  //  CardCoins(),
                ],
              )),
            ));
  }
}
