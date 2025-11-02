import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextformfield extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData? icon;
  final bool isPassword;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;

  const CustomTextformfield({
    super.key,
    required this.controller,
    required this.label,
    this.icon,
    this.isPassword = false,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return isPassword ? buildPasswordTextField() : buildNormalTextField();
  }

  /// ===== Password Field with Glass Effect =====
  Widget buildPasswordTextField() {
    final ValueNotifier<bool> isHidden = ValueNotifier<bool>(true);

    return ValueListenableBuilder<bool>(
      valueListenable: isHidden,
      builder: (context, value, _) {
        return TextFormField(
          cursorColor: Colors.white,
          validator: validator,
          controller: controller,
          obscureText: value,
          style: GoogleFonts.comfortaa(color: Colors.white, fontSize: 14),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.transparent, // شفاف جوه الجلاس
            prefixIcon: Icon(icon, color: Colors.white.withValues(alpha: 0.8)),
            suffixIcon: IconButton(
              onPressed: () => isHidden.value = !isHidden.value,
              icon: Icon(
                value ? Icons.visibility_off : Icons.visibility,
                color: Colors.white.withValues(alpha: 0.8),
              ),
            ),
            labelText: label,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            labelStyle: GoogleFonts.comfortaa(
              color: Colors.white.withValues(alpha: 0.6),
              fontSize: 14,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.white.withValues(alpha: 0.3),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.white, width: 1.2),
            ),
          ),
          onChanged: onChanged,
        );
      },
    );
  }

  /// ===== Normal Field with Glass Effect =====
  Widget buildNormalTextField() {
    return TextFormField(
      validator: validator,
      controller: controller,
      style: GoogleFonts.comfortaa(color: Colors.white, fontSize: 14),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.transparent,
        prefixIcon: Icon(icon, color: Colors.white.withValues(alpha: 0.8)),
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelStyle: GoogleFonts.comfortaa(
          color: Colors.white.withValues(alpha: 0.6),
          fontSize: 14,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.white, width: 1.2),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
