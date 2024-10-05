import 'package:find_me/utils/box_decoration/box_decoration.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class UrlTextFields extends StatefulWidget {
  const UrlTextFields({
    Key? key,
    required this.defaultText, // Non-removable default text
    this.icon,
    this.controller,
    this.prefixText, // New parameter for non-editable URL prefix
    this.type,
    this.fieldValidator,
    this.onChanged,
    this.onEditingComplete,
    this.onSuffixTap,
    this.enabled,
    this.hintText,
    this.color = AppColors.black,
    this.height = 20.0,
    this.width = 20.0,
  }) : super(key: key);

  final String defaultText;
  final icon;
  final width;
  final height;
  final controller;
  final String? prefixText; // Define the prefixText parameter
  final type;
  final fieldValidator;
  final ValueChanged<String>? onChanged;
  final Function()? onEditingComplete;
  final Function()? onSuffixTap;
  final bool? enabled;
  final String? hintText;
  final color;

  @override
  _UrlTextFieldsState createState() => _UrlTextFieldsState();
}

class _UrlTextFieldsState extends State<UrlTextFields> {
  late FocusNode _focusNode;
  late TextEditingController _controller;
  String? _currentHintText;
  bool _isClearing = false; // Flag to control clearing

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _controller =
        widget.controller ?? TextEditingController(text: widget.defaultText);
    _currentHintText = widget.hintText;

    // Listen for text changes to enforce non-removable default text unless it's being cleared via onSuffixTap.
    _controller.addListener(() {
      if (!_isClearing && !_controller.text.startsWith(widget.defaultText)) {
        // Ensure the default text is always present at the start unless in clear mode
        _controller.text = widget.defaultText;
        _controller.selection = TextSelection.fromPosition(
          TextPosition(offset: widget.defaultText.length),
        );
      }
    });

    // Listen to focus changes to update the hint text.
    _focusNode.addListener(() {
      setState(() {
        if (_focusNode.hasFocus) {
          _currentHintText = ''; // Clear hint when focused.
        } else {
          // Restore hint when unfocused.
        }
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.primary_color,
      focusNode: _focusNode,
      controller: _controller,
      keyboardType: widget.type,
      autovalidateMode: widget.fieldValidator == true
          ? AutovalidateMode.always
          : AutovalidateMode.onUserInteraction,
      style: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
      ),
      
      decoration: InputDecoration(
        hintText: widget.hintText,
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
        suffixIcon: _controller.text.isNotEmpty
            ? GestureDetector(
                onTap: () {
                  // Clear the controller and unfocus the field on suffix tap
                  setState(() {
                    _isClearing = true;
                    _controller.clear();
                    FocusScope.of(context).unfocus(); // Unfocus the text field
                    if (widget.onSuffixTap != null) {
                      widget.onSuffixTap!();
                    }
                    _isClearing = false;
                  });
                },
                child: const Icon(Icons.cancel, color: Colors.red),
              )
            : null,
        filled: true,
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
      onTap: () {
        // Ensure cursor is always placed after the default text unless clearing is allowed.
        if (_controller.selection.start < widget.defaultText.length) {
          _controller.selection = TextSelection.fromPosition(
            TextPosition(offset: widget.defaultText.length),
          );
        }
      },
    );
  }
}
