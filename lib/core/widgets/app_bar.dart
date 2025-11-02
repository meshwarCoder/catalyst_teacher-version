import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:catalyst/core/utils/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.centerTitle = true,
  });

  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool centerTitle;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: AppBar(
          backgroundColor: Colors.white.withOpacity(0.0), // 🔹 لمسة شفافية
          elevation: 0,
          centerTitle: centerTitle,
          leading: leading,
          title: Text(
            title ?? '',
            style: const TextStyle(
              color: AppColors.likeWhite,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: actions,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
