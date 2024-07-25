import 'package:flutter/material.dart';
import 'package:leaf_notes/utils/constants/colors.dart';
import 'package:leaf_notes/utils/constants/sizes.dart';

class DDivider extends StatelessWidget {
  final double? height;
  final Color? color;
  final double? thickness;

  const DDivider({super.key, this.height = dDividerHeight, this.color, this.thickness =  dDividerThickness});

  @override
  Widget build(BuildContext context) {
    return const Padding(
            padding: EdgeInsets.symmetric(horizontal: dPadding*2),
            child: Divider(height: 0.6,color: dBlackColor,),
          );
  }
}