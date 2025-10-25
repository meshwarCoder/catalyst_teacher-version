import 'package:catalyst/core/widgets/app_bar.dart';
import 'package:catalyst/core/widgets/base_scaffold.dart';
import 'package:catalyst/features/my%20classes/presentation/widgets/class_students_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ClassStudentsView extends StatelessWidget {
  const ClassStudentsView({super.key});

  @override
  Widget build(BuildContext context) {
    final students = [
      {
        "name": "John Doe",
        "grade": "A-",
        "color": Colors.green,
        "image":
            "https://images.unsplash.com/photo-1607746882042-944635dfe10e?auto=format&fit=crop&w=400&q=80"
      },
      {
        "name": "Jane Smith",
        "grade": "B+",
        "color": Colors.amber,
        "image":
            "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?auto=format&fit=crop&w=400&q=80"
      },
      {
        "name": "Peter Jones",
        "grade": "Not Graded",
        "color": Colors.grey,
        "image":
            "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?auto=format&fit=crop&w=400&q=80"
      },
      {
        "name": "Mary Johnson",
        "grade": "C",
        "color": Colors.red,
        "image":
            "https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=400&q=80"
      },
    ];

    return BaseScaffold(
      appBar: CustomAppBar(
        title: "Grade 10 - English",
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => context.pop(),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: students.length,
          itemBuilder: (context, index) {
            final student = students[index];
            return ClassStudentsItem(student: student);
          },
        ),
      ),
      
    );
  }
}
