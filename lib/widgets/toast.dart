import 'package:flutter/material.dart';

class CustomToast extends StatelessWidget {
  final String message;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final TextAlign textAlign;

  const CustomToast({
    required this.message,
    this.backgroundColor = Colors.red,
    this.textColor = Colors.white,
    this.fontSize = 16.0,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        message,
        textAlign: textAlign,
        style: TextStyle(color: textColor,),
      ),
    );
  }
}
