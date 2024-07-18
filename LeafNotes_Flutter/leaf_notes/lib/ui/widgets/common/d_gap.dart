import 'package:flutter/material.dart';
import 'package:leaf_notes/utils/constants/sizes.dart';

class DGap extends StatelessWidget {

  final double? gap;
  final bool? isHorizontal;


  const DGap({
    super.key,
    this.gap = dMargin,
    this.isHorizontal = false
  
  });

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: isHorizontal! ? 0.0 : gap,
      width: !isHorizontal! ? gap: 0.0,
    );
  }
}