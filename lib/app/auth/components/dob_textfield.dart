import 'package:find_me/app/auth/signup/signup_controller.dart';
import 'package:find_me/utils/box_decoration/box_decoration.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildTextField(TextEditingController controller, String hint,
    BuildContext context, SignUpController signUpController) {
  return Expanded(
    child: GestureDetector(
      onTap: () => signUpController.selectDate(context),
      child: AbsorbPointer(
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: AppColors.hintGrey,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
            contentPadding:
                EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
            border: inputDecoration,
            enabledBorder: inputDecoration,
            focusedBorder: inputDecoration,
          ),
        ),
      ),
    ),
  );
}
