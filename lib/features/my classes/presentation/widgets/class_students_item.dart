import 'package:catalyst/core/utils/routs.dart';
import 'package:catalyst/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ClassStudentsItem extends StatelessWidget {
  const ClassStudentsItem({super.key, required this.student});

  final Map<String, dynamic> student;

  @override
  Widget build(BuildContext context) {
    return Container(
              height: 70,
              margin: const EdgeInsets.only(bottom: 14),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E2F),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: ListTile(
                  
                  leading: CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage(student['image'] as String),
                  ),
                  title: CustomText(
                    text: student['name'] as String,
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  trailing: CustomText(
                    text: student['grade'] as String,
                    color: student['color'] as Color,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  onTap: () {
                    context.push(Routs.studentProfile, extra: 'class');
                  },
                ),
              ),
            );
  }
}