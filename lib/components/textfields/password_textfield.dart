import 'package:find_me/utils/box_decoration/box_decoration.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:find_me/utils/images/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PasswordTextFields extends StatefulWidget {
  const PasswordTextFields({
    Key? key,
    this.controller,
    this.hintText,
    this.obscure,
    this.toggle,
    this.fieldValidator,
    this.type,
    this.readOnly,
    this.autovalidateMode,
  }) : super(key: key);

  final controller;
  final hintText;
  final type;
  final toggle;
  final obscure;
  final autovalidateMode;
  final readOnly;
  final FormFieldValidator<String>? fieldValidator;

  @override
  _PasswordTextFieldsState createState() => _PasswordTextFieldsState();
}

class _PasswordTextFieldsState extends State<PasswordTextFields> {
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
      obscureText: widget.obscure,
      controller: widget.controller,
      focusNode: _focusNode, // Add the focus node
      keyboardType: widget.type,
      validator: widget.fieldValidator,
      autovalidateMode: widget.autovalidateMode ??
          (widget.fieldValidator == true.obs
              ? AutovalidateMode.always
              : AutovalidateMode.onUserInteraction),
      style: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        filled: true,
        hintText: _currentHintText, // Use the dynamic hint text
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
        suffixIcon: GestureDetector(
          onTap: () {
            widget.toggle();
          },
          child: widget.obscure
              ? SvgPicture.asset(
                  ImagesConst.eyeOff,
                  height: 24,
                  fit: BoxFit.scaleDown,
                )
              : SvgPicture.asset(
                  ImagesConst.eye,
                  height: 24,
                  fit: BoxFit.scaleDown,
                ),
        ),
      ),
    );
  }
}
