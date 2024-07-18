import 'package:flutter/material.dart';
import 'package:leaf_notes/utils/constants/colors.dart';
import 'package:leaf_notes/utils/constants/sizes.dart';

class DTextField extends StatelessWidget {
  final String hintText;
  final double? borderRadius;
  final IconData? icon;
  final double? iconSize;
  final TextEditingController controller;
  final bool? obscureText;
  final double padding;
  final int maxLines;

  const DTextField(
      {super.key,
      required this.hintText,
      this.borderRadius = dBorderRadius,
      this.icon ,
      this.iconSize = dIconSize ,
      this.padding = dPadding,
      required this.controller,
      this.maxLines = 1,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(horizontal: padding*2, vertical: padding),
      padding:  EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius!),
        border: Border.all(width: dBorderWidth)

      ),
      child: TextField(
        maxLines: maxLines,
        controller: controller,
        obscureText: obscureText!,
        decoration: InputDecoration(
          
          prefixIcon: Icon(icon, size: iconSize),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
