import 'package:flutter/material.dart';
import 'package:leaf_notes/utils/constants/colors.dart';

final ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch().copyWith(

    primary: dBlackColor,
    secondary: dBlackColor,
    onPrimary: Colors.white, // Color for text/icons on top of the primary color
    surface: dScaffoldLightColor, // Define your background color
  ),
  scaffoldBackgroundColor: dScaffoldLightColor,

  fontFamily: 'Handwritten 3',

  inputDecorationTheme: const InputDecorationTheme(
    hintStyle: TextStyle(color: dHintGreyColor),
  ),


  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: dBlackColor, // Button background color
      foregroundColor: dWhiteColor, // Button text color
    ),
  ),
);