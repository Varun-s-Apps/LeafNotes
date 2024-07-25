import 'package:flutter/material.dart';
import 'package:leaf_notes/utils/constants/colors.dart';

TextStyle boldHeading(
    {double size = 28,
    FontStyle style = FontStyle.normal,
    FontWeight weight = FontWeight.w600,
    Color color = dBlackColor,
    Color bgColor = Colors.transparent}) {
  return TextStyle(
      fontSize: size,
      fontStyle: style,
      fontFamily: 'Montserrat',
      fontWeight: weight,
      color: color,
      backgroundColor: bgColor);
}

TextStyle headline(
    {double size = 17,
    FontStyle style = FontStyle.normal,
    FontWeight weight = FontWeight.w600,
    Color color = dBlackColor,
    Color bgColor = Colors.transparent}) {
  return TextStyle(
      fontSize: size,
      fontFamily: 'Montserrat',
      fontStyle: style,
      fontWeight: weight,
      color: color,
      backgroundColor: bgColor);
}

TextStyle body(
    {double size = 17,
    FontStyle style = FontStyle.normal,
    FontWeight weight = FontWeight.w400,
    Color color = dTextGreyColor,
    Color bgColor = Colors.transparent}) {
  return TextStyle(
      fontSize: size,
      fontStyle: style,
      fontWeight: weight,
      
      fontFamily: 'Roboto',
      color: color,
      backgroundColor: bgColor);
}

TextStyle caption(
    {double size = 13,
    FontStyle style = FontStyle.normal,
    FontWeight weight = FontWeight.w400,
    Color color = dHintGreyColor,
    Color bgColor = Colors.transparent}) {
  return TextStyle(
      fontSize: size,
      fontStyle: style,
      fontWeight: weight,
      fontFamily: 'Roboto',

      color: color,
      backgroundColor: bgColor);
}