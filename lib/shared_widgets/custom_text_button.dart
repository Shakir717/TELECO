import 'package:flutter/material.dart';

import '../constants/app_size.dart';


/// Custom text button with a fixed height
class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key, required this.text, this.style, this.onPressed, this.height, this.width, this.textStyle});
  final String text;
  final TextStyle? textStyle;
  final ButtonStyle? style;
  final VoidCallback? onPressed;
  final double? height,width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextButton(
        style: style,
        onPressed: onPressed,
        child: Text(
          text,
          style: textStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
