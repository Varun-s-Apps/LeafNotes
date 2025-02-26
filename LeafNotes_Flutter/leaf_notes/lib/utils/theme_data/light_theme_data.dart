import 'package:flutter/material.dart';
import 'package:leaf_notes/utils/constants/colors.dart';
import 'package:leaf_notes/utils/constants/sizes.dart';

final ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch().copyWith(

    primary: dBlackColor,
    secondary: dBlackColor,
    onPrimary: Colors.white, // Color for text/icons on top of the primary color
    surface: dScaffoldLightColor, // Define your background color
  ),
  scaffoldBackgroundColor: dScaffoldLightColor,

  // fontFamily: 'Handwritten 4',
  // fontFamily: 'Roboto',
  fontFamily: 'Montserrat',



  appBarTheme: const AppBarTheme(
    scrolledUnderElevation: 0,
    surfaceTintColor: dScaffoldLightColor
  ),


 textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 18.0),
      
      bodyMedium: TextStyle(fontSize: 16.0),
    
      labelLarge: TextStyle(fontSize: 16.0),
      // and so on for every text style
    ),

  inputDecorationTheme: const InputDecorationTheme(
    hintStyle: TextStyle(color: dHintGreyColor),
  ),


  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: dBlackColor, // Button background color
      foregroundColor: dWhiteColor, // Button text color
    ),
  ),


  outlinedButtonTheme: OutlinedButtonThemeData(style: OutlinedButton.styleFrom(
    backgroundColor: dScaffoldLightColor,
    foregroundColor: dBlackColor,
    side: const BorderSide(color: dBlackColor, width: dBorderWidth*2)


  ))
);
