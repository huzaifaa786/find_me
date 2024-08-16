// ignore_for_file: prefer_const_constructors

import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SwipeToSendButton extends StatefulWidget {
  final VoidCallback onSend;
  final bool isFileSelected;

  const SwipeToSendButton({
    Key? key,
    required this.onSend,
    this.isFileSelected = false,
  }) : super(key: key);

  @override
  _SwipeToSendButtonState createState() => _SwipeToSendButtonState();
}

class _SwipeToSendButtonState extends State<SwipeToSendButton> {
  double _dragPosition = 0.0;
  bool _isSent = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (!_isSent) {
          setState(() {
            _dragPosition =
                (_dragPosition + details.delta.dx).clamp(0.0, 213.w - 49.w);
          });
        }
      },
      onHorizontalDragEnd: (details) {
        if (_dragPosition >= 213.w - 49.w) {
          widget.onSend();
          setState(() {
            _dragPosition = 213.w - 49.w; // Stay at the end
            _isSent = true;
          });
        } else {
          setState(() {
            _dragPosition = 0.0;
            _isSent = false;
          });
        }
      },
      child: Container(
        height: 55.h,
        width: 213.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: widget.isFileSelected
              ? AppColors.primary_color
              : AppColors.light_grey,
        ),
        child: Stack(
          children: [
            Positioned(
              left: _isSent ? 213.w - 49.w : _dragPosition,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 5.0),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: 49.w,
                  height: 46.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppColors.white,
                  ),
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    'assets/icons/swipe_arrows.svg',
                    height: 12.h,
                    width: 15.w,
                  ),
                ),
              ),
            ),
            Center(
              child: AnimatedOpacity(
                opacity: _dragPosition > 0 && !_isSent ? 0.0 : 1.0,
                duration: Duration(milliseconds: 300),
                child: Text(
                  _isSent ? 'Sent'.tr : 'Swipe to send'.tr,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
