import 'package:catalyst/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:catalyst/core/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, this.onPressed, this.backgroundColor});

  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor??AppColors.button,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        onPressed: onPressed,
        child: CustomText(
          text: text,
          fontSize: 16,
        ),
      ),
    );
  }
}
