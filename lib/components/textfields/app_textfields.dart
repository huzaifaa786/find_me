import 'package:find_me/utils/box_decoration/box_decoration.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppTextFields extends StatefulWidget {
  const AppTextFields({
    Key? key,
    this.icon,
    this.controller,
    this.hintText,
    this.type,
    this.fieldValidator,
    this.onChanged,
    this.onEditingComplete,
    this.enabled,
    this.color = AppColors.black,
    this.height = 20.0,
    this.width = 20.0,
  }) : super(key: key);

  final icon;
  final width;
  final height;
  final controller;
  final hintText;
  final type;
  final fieldValidator;
  final ValueChanged<String>? onChanged;
  final Function()? onEditingComplete;
  final bool? enabled;
  final color;

  @override
  _AppTextFieldsState createState() => _AppTextFieldsState();
}

class _AppTextFieldsState extends State<AppTextFields> {
  late FocusNode _focusNode;
  String? _currentHintText;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _currentHintText = widget.hintText;

    // Listen to focus changes to update the hint text.
    _focusNode.addListener(() {
      setState(() {
        if (_focusNode.hasFocus) {
          _currentHintText = ''; // Clear hint when focused.
        } else {
          _currentHintText = widget.hintText; // Restore hint when unfocused.
        }
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.primary_color,
      focusNode: _focusNode,
      controller: widget.controller,
      keyboardType: widget.type,
      autovalidateMode: widget.fieldValidator == true
          ? AutovalidateMode.always
          : AutovalidateMode.onUserInteraction,
      style: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        prefixIcon: widget.icon != null
            ? Padding(
                padding: EdgeInsets.only(left: 23.w, right: 14),
                child: SvgPicture.asset(
                  widget.icon!,
                  width: widget.width,
                  height: widget.height,
                  color: widget.color,
                ),
              )
            : null,
        filled: true,
        hintText: _currentHintText,
        hintStyle: TextStyle(
          color: AppColors.hintGrey,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
        fillColor: AppColors.white,
        border: inputDecoration,
        enabledBorder: inputDecoration,
        focusedBorder: focusedInputDecoration,
        errorBorder: inputErrorDecoration,
        focusedErrorBorder: inputErrorDecoration,
      ),
      enabled: widget.enabled,
      validator: widget.fieldValidator,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
    );
  }
}
