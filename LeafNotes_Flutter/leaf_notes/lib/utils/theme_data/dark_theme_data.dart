import 'package:flutter/material.dart';
import 'package:leaf_notes/utils/constants/colors.dart';

final ThemeData darkTheme = ThemeData(
  primaryColor: dWhiteColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: dWhiteColor,
    secondary: dHintGreyColor,
    onPrimary: dBlackColor, // Color for text/icons on top of the primary color
    surface: dBlackColor, // Define your background color
  ),
  // primaryColor: dBlackColor,

  
  scaffoldBackgroundColor: dScaffoldDarkColor,
  
  fontFamily: 'Handwritten 3',

  inputDecorationTheme: const InputDecorationTheme(
    hintStyle: TextStyle(color: dHintGreyColor),
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: dBlackColor,
    foregroundColor: dWhiteColor,
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: dWhiteColor, // Button background color
      foregroundColor: dBlackColor, // Button text color
    ),
  ),

);