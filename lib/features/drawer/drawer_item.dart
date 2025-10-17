import 'package:catalyst/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool hasDropdown;
  final VoidCallback onTap;
  final Color color;

  const DrawerItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.hasDropdown = false,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF00BCD4)),
      title: CustomText(
        text: label, 
        
      
      ),
      trailing: hasDropdown
          ? const Icon(Icons.keyboard_arrow_down, color: Colors.white70)
          : null,
      onTap: onTap,
    );
  }
}
