import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class LanguageOption extends StatelessWidget {
  final String languageName;
  final String languageDescription;
  final int value;
  final int groupValue;
  final ValueChanged<int?> onChanged;

  const LanguageOption({
    Key? key,
    required this.languageName,
    required this.languageDescription,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color radioColor = AppColors.primary_color;
    return GestureDetector(
      onTap: () {
        onChanged(value);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  languageName,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  languageDescription,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    
                    color: AppColors.borderGreyLight,
                  ),
                ),
              ],
            ),
            Radio(
              value: value,
              groupValue: groupValue,
              fillColor: MaterialStateProperty.all(radioColor),
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
