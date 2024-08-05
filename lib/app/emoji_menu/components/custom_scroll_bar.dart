// ignore_for_file: use_key_in_widget_constructors

import 'package:find_me/app/emoji_menu/components/custom_scrollbar_thumb_painter.dart';
import 'package:flutter/material.dart';

class CustomScrollbar extends StatelessWidget {
  final Widget child;

  const CustomScrollbar({required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          child: CustomPaint(
            painter:CustomScrollbarThumbPainter(),
            child: Container(width: 5), // Customize scrollbar width
          ),
        ),
      ],
    );
  }
}
