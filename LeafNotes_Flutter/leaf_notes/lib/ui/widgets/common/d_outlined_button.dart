import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:leaf_notes/utils/constants/colors.dart';
import 'package:leaf_notes/utils/constants/sizes.dart';

class DOutlinedButton extends StatelessWidget {
  final String text;
  final double? borderRadius;
  final VoidCallback? onPressed;
  final bool? isInverted;
  final FaIcon? icon;

  const DOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.borderRadius = dBorderRadius,
    this.isInverted = false,
    this.icon
  
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: dPadding*2, vertical: dPadding),
      child: SizedBox(
        
        width: double.infinity,
        child: OutlinedButton.icon(
          icon: icon,
          label: Text(text),
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            
            
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(dBorderRadius),)
          ),
        
        ),
      ),
    );
  }
}