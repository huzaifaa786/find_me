// import 'package:find_me/utils/colors/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:intl_phone_field/phone_number.dart';

// class PhoneTextField extends StatelessWidget {
//   const PhoneTextField({super.key, required this.onChange});
//   final Function(PhoneNumber phone)? onChange;

//   @override
//   Widget build(BuildContext context) {
//     return IntlPhoneField(
//       keyboardType:
//           const TextInputType.numberWithOptions(signed: true, decimal: true),
//       textInputAction: TextInputAction.done,
//       inputFormatters: [
//         FilteringTextInputFormatter.digitsOnly,
//       ],
//       decoration: InputDecoration(
//         fillColor: Colors.white,
//         filled: true,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30.r),
//           borderSide: BorderSide(width: 1, color: AppColors.borderGrey),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30.r),
//           borderSide: BorderSide(width: 1, color: AppColors.borderGrey),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30.r),
//           borderSide:
//               const BorderSide(width: 1, color: AppColors.primary_color),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30.r),
//           borderSide: const BorderSide(width: 1, color: AppColors.red),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30.r),
//           borderSide: const BorderSide(width: 1, color: AppColors.red),
//         ),
//         counterStyle: TextStyle(fontSize: 10.sp),
//         errorStyle: TextStyle(fontSize: 10.sp),
//         errorMaxLines: 1,
//         contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 14.w),
//       ),
//       languageCode: "en",
//       onChanged: onChange,
//     );
//   }
// }
