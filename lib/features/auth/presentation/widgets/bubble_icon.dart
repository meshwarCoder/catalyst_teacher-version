import 'package:flutter/material.dart';

/// ==== Icon (Teacher / Student) ====
class BubbleIcon extends StatelessWidget {
  final IconData icon;
  final bool active;
  const BubbleIcon({super.key, required this.icon, required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: active ? Colors.white.withValues(alpha: 0.1) : null,
        
      ),
      child: Icon(
        icon,
        color: Colors.white.withValues(alpha: active ? 1 : 0.5),
        size: 35,
      ),
    );
  }
}
