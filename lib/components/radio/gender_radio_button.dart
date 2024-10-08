import 'dart:developer';

import 'package:find_me/utils/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GenderRadioButtons extends StatefulWidget {
  final Function(String) onGenderSelected;
  final String? gender;

  const GenderRadioButtons(
      {Key? key, required this.onGenderSelected, this.gender})
      : super(key: key);

  @override
  _GenderRadioButtonsState createState() => _GenderRadioButtonsState();
}

class _GenderRadioButtonsState extends State<GenderRadioButtons> {
  String? selectedGender = "";
  @override
  void initState() {
  
    selectedGender = widget.gender;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Theme(
            data: Theme.of(context).copyWith(
              listTileTheme: const ListTileThemeData(
                horizontalTitleGap: 2,
              ),
            ),
            child: RadioListTile<String>(
              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
              dense: true,
              contentPadding: EdgeInsets.zero,
              title: AppText(
                title: 'Male'.tr,
                size: 12.sp,
                fontWeight: FontWeight.w400,
              ),
              value: 'Male',
              groupValue: selectedGender,
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                });
                widget.onGenderSelected(value!);
              },
            ),
          ),
        ),
        Expanded(
          child: Theme(
            data: Theme.of(context).copyWith(
              listTileTheme: const ListTileThemeData(
                horizontalTitleGap: 2,
              ),
            ),
            child: RadioListTile<String>(
              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
              dense: true,
              contentPadding: EdgeInsets.zero,
              title: AppText(
                title: 'Female'.tr,
                size: 12.sp,
                fontWeight: FontWeight.w400,
              ),
              value: 'Female',
              groupValue: selectedGender,
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                });
                widget.onGenderSelected(value!);
              },
            ),
          ),
        ),
        Expanded(
          child: Theme(
            data: Theme.of(context).copyWith(
              listTileTheme: const ListTileThemeData(
                horizontalTitleGap: 2,
              ),
            ),
            child: RadioListTile<String>(
              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
              dense: true,
              contentPadding: EdgeInsets.zero,
              title: AppText(
                title: 'Prefer not to say'.tr,
                size: 12.sp,
                fontWeight: FontWeight.w400,
              ),
              value: 'Other',
              groupValue: selectedGender,
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                });
                widget.onGenderSelected(value!);
              },
            ),
          ),
        ),
      ],
    );
  }
}
