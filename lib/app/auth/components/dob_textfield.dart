import 'package:find_me/app/account/change_phonenumber/change_phonenumber_binding.dart';
import 'package:find_me/app/auth/signup/signup_controller.dart';
import 'package:find_me/utils/box_decoration/box_decoration.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildDateInputField(TextEditingController controller, BuildContext context,signUpController) {
  return GestureDetector(
    onTap: () => signUpController.openDatePicker(context),
    child: AbsorbPointer(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.datetime,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: '1 January 2001',
            hintStyle: TextStyle(
              color: AppColors.hintGrey,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
            border: inputDecoration,
            enabledBorder: inputDecoration,
            focusedBorder: inputDecoration,
          ),
        ),
      ),
    ),
  );
}
