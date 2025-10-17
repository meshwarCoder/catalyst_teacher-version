import 'package:catalyst/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextformfield extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final IconData icon;
  final bool isPassword;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;

  const CustomTextformfield({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
    this.validator,
    this.onChanged,
      });

  @override
  Widget build(BuildContext context) {
    if (isPassword) {
      
      return buildPasswordTextField();
    } else {
      
      return buildNormalTextField();
    }
  }

  Widget buildPasswordTextField() {
  final ValueNotifier<bool> isHidden = ValueNotifier<bool>(true);
    return ValueListenableBuilder<bool>(
      valueListenable: isHidden,
      builder: (context, value, _) {
        return TextFormField(
          validator: validator,
          controller: controller,
          obscureText: value,
          style: GoogleFonts.comfortaa(
            color: AppColors.likeBlack,
            fontSize: 14,
          ),
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                isHidden.value = !isHidden.value;
              },
              icon: Icon(value ? Icons.visibility_off : Icons.visibility),
            ),
            filled: true,
            fillColor: AppColors.likeWhite,
            hintText: hintText,
            hintStyle: GoogleFonts.comfortaa(
              color: AppColors.likeBlack,
              fontSize: 14,
            ),
            prefixIcon: Icon(icon, color: AppColors.likeBlack),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
              borderSide: BorderSide.none,
            ),
          ),
          onChanged: onChanged,
        );
      },
    );
  }

  Widget buildNormalTextField() {
    return TextFormField(
      validator: validator,
      controller: controller,
      style: GoogleFonts.comfortaa(
        color: AppColors.likeBlack,
        fontSize: 14,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.likeWhite,
        hintText: hintText,
        hintStyle: GoogleFonts.comfortaa(
          color: AppColors.likeBlack,
          fontSize: 14,
        ),
        prefixIcon: Icon(icon, color: AppColors.likeBlack),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
          borderSide: BorderSide.none,
        ),
      ),
      onChanged: onChanged,
    );
  }
}
