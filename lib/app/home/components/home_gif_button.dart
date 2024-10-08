import 'package:find_me/components/buttons/gif_button.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:find_me/utils/images/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeGif extends StatelessWidget {
  HomeGif({Key? key,this.onTap,this.isSearching = false}) : super(key: key);
  
  bool isSearching;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 200,
          width: 200,
          child: ClipRRect(
            child: isSearching
                ? Image.asset(
                    ImagesConst.homeGif,
                    height: 200,
                    width: 200,
                  )
                : Container(),
          ),
        ),
        Stack(
          alignment: Alignment.topCenter,
          children: [
          
            Positioned(
              child: Align(
                alignment: Alignment.topCenter,
                child: GestureDetector( 
                  onTap: onTap,
                  child: isSearching
                      ? Container()
                      : Image.asset(
                          'assets/images/searching.png',
                        ),
                ),
              ),
            ),
          ],
        ),
        // isSearching
        //     ? Container()
        //     : Positioned(
        //         bottom: 1,
        //         child: AppText(
        //           title: 'Click the bubble to activate'.tr,
        //           color: AppColors.primary_color,
        //           textAlign: TextAlign.center,
        //           size: 12.sp,
        //           fontWeight: FontWeight.w400,
        //         ),
        //       ),
      ],
    );
  }
}
