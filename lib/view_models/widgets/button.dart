import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../../utils/utils.dart';

class MyButton extends StatelessWidget {
  final String label;
  final double width;
  final double height;
  final Function()? onTap;
  final double fontSize;
  const MyButton({super.key, required this.label, required this.onTap, required this.width, required this.height, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: primaryGradient,
        ),
        child: Center(
          child: Text(
            label,
            style: SafeGoogleFont(
              'Poppins',
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),

    );
  }
}
