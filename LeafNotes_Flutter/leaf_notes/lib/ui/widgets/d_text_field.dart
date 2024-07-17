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

  const DTextField(
      {super.key,
      required this.hintText,
      this.borderRadius = dBorderRadius,
      this.icon ,
      this.iconSize = dIconSize ,
      required this.controller,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: dPadding*2, vertical: dPadding),
      padding: const EdgeInsets.all(dPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius!),
        border: Border.all(width: dBorderWidth)

      ),
      child: TextField(
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
