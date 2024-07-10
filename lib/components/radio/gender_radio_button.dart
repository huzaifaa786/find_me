import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenderRadioButtons extends StatefulWidget {
  final Function(String) onGenderSelected;

  const GenderRadioButtons({Key? key, required this.onGenderSelected})
      : super(key: key);

  @override
  _GenderRadioButtonsState createState() => _GenderRadioButtonsState();
}

class _GenderRadioButtonsState extends State<GenderRadioButtons> {
  String? selectedGender = "Male";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Radio<String>(
                  value: 'Male',
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value;
                    });
                    widget.onGenderSelected(value!);
                  },
                ),
                AppText(
                  title: 'Male',
                  size: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
                Icon(
                  Icons.male,
                  color: Colors.blue,
                  size: 20,
                ),
              ],
            ),
            SizedBox(width: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Radio<String>(
                  value: 'Female',
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value;
                    });
                    widget.onGenderSelected(value!);
                  },
                ),
                AppText(
                  title: 'Female',
                  size: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
                Icon(Icons.female, color: AppColors.pink),
              ],
            ),
          ],
        ),
        SizedBox(height: 10),
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Radio<String>(
                value: 'Other',
                groupValue: selectedGender,
                onChanged: (value) {
                  setState(() {
                    selectedGender = value;
                  });
                  widget.onGenderSelected(value!);
                },
              ),
              AppText(
                title: 'Prefer not to say',
                size: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
