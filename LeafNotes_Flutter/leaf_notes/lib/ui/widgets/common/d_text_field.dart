import 'package:flutter/material.dart';
import 'package:leaf_notes/utils/constants/sizes.dart';

class DTextField extends StatelessWidget {
  final String hintText;
  final double borderRadius;
  final IconData icon;
  final double iconSize;
  final TextEditingController controller;
  final bool obscureText;
  final double padding;
  final double margin;
  final TextAlign textAlignment;
  final TextStyle textStyle;
  final double borderWidth;
  final bool isBorderless;
  final Widget leadingWidget;

   DTextField(
      {super.key,
      required this.hintText,
      this.borderRadius = dBorderRadius,
      this.icon = Icons.abc ,
      this.textAlignment = TextAlign.start,
      this.iconSize = dIconSize ,
      this.padding = dPadding,
      this.margin = dPadding,
      required this.controller,
      this.textStyle = const TextStyle(),
      this.obscureText = false,
      this.borderWidth = dBorderWidth,
      this.isBorderless = false,
      this.leadingWidget = const SizedBox(width: 20,),

      });

@override
Widget build(BuildContext context) {
  return Container(
    
    margin: EdgeInsets.symmetric(horizontal: margin! * 2, vertical: margin!),
    padding: EdgeInsets.all(padding!),
    decoration: BoxDecoration(
      borderRadius: isBorderless! ? null : BorderRadius.circular(borderRadius!),
      border: isBorderless! ? null : Border.all(width: borderWidth!),
    ),
    child: TextField(   
      // maxLines: maxLines,
      maxLines: null,
      controller: controller,
      obscureText: obscureText!,
    
      textAlign: textAlignment,
      style: textStyle,
      decoration: InputDecoration(
        
        contentPadding: EdgeInsets.zero, // Remove all padding
        hintStyle: textStyle!,
        hintText: hintText,
        border: InputBorder.none,
      ),
    ),
  );
}
}
