import 'package:flutter/material.dart';
import 'package:leaf_notes/utils/constants/colors.dart';

TextStyle boldHeading(
    {double size = 31,
    FontStyle style = FontStyle.normal,
    FontWeight weight = FontWeight.w600,
    Color color = dBlackColor,
    Color bgColor = Colors.transparent}) {
  return TextStyle(
      fontSize: size,
      fontStyle: style,
      fontWeight: weight,
      color: color,
      backgroundColor: bgColor);
}