import 'package:flutter/material.dart';
import 'package:leaf_notes/utils/constants/colors.dart';
import 'package:leaf_notes/utils/constants/sizes.dart';

class DButton extends StatelessWidget {
  final String text;
  final double? borderRadius;
  final VoidCallback? onPressed;
  final bool? isInverted;

  const DButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.borderRadius = dBorderRadius,
    this.isInverted = false,
  
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: dPadding*2, vertical: dPadding),
      child: SizedBox(
        
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(dBorderRadius))
          ),
          //  CHILD COMPONENT
          child: Text(text), 
        
        
        ),
      ),
    );
  }
}