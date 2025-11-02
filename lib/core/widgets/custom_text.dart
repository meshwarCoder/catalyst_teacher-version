import 'package:catalyst/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text,this.fontSize, this.fontWeight, this.color,this.letterSpacing});

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final double? letterSpacing;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.comfortaa(
        color: color??AppColors.likeWhite,
        fontSize: fontSize??16,
        fontWeight: fontWeight??FontWeight.normal,
        letterSpacing: letterSpacing??0,
      ),
    );
  }
}