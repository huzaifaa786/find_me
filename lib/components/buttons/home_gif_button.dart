import 'package:find_me/components/buttons/gif_button.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:find_me/utils/images/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeGif extends StatefulWidget {
  HomeGif({Key? key}) : super(key: key);

  @override
  _HomeGifState createState() => _HomeGifState();
}

class _HomeGifState extends State<HomeGif> {
  bool isClicked = false;

  void _toggleClicked() {
    setState(() {
      isClicked = !isClicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 200,
          width: 200,
          child: ClipRRect(
            child: isClicked
                ? Image.asset(
                    ImagesConst.homeGif,
                    height: 200,
                    width: 200,
                  )
                : Container(),
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 77,
                  width: 77,
                  child: GestureDetector(
                    child: GifButton(
                      onTap: () {
                        _toggleClicked();
                      },
                      showOpacity: isClicked ? true : false,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              child: Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: _toggleClicked,
                  child: SizedBox(
                    height: 77,
                    width: 77,
                    child: isClicked
                        ? Container()
                        : SvgPicture.asset(
                            'assets/icons/shadow_darkcircle.svg',
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
        isClicked
            ? Container()
            : Positioned(
                bottom: 1,
                child: AppText(
                  title: 'Click the bubble to activate',
                  color: AppColors.primary_color,
                  textAlign: TextAlign.center,
                  size: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
      ],
    );
  }
}
