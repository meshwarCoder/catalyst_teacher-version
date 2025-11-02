import 'package:catalyst/core/utils/routs.dart';
import 'package:catalyst/core/widgets/custom_text.dart';
import 'package:catalyst/core/widgets/glass_books.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ClassStudentsItem extends StatelessWidget {
  const ClassStudentsItem({super.key, required this.student});

  final Map<String, dynamic> student;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GlassBox(
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
    ),);
  }
}