import 'package:catalyst/core/widgets/app_bar.dart';
import 'package:catalyst/core/widgets/base_scaffold.dart';
import 'package:catalyst/features/my%20classes/presentation/widgets/my_classes_item.dart';
import 'package:flutter/material.dart';

class MyClassesView extends StatelessWidget {
  const MyClassesView({super.key});

  @override
  Widget build(BuildContext context) {
    final classes = [
      {
        "title": "Mathematics 101",
        "students": "25 students",
        "schedule": "Mon, Wed, Fri at 10:00 AM",
        "color": Colors.deepPurple,
        "icon": Icons.calculate,
        "teacherImage":
            "https://images.unsplash.com/photo-1607746882042-944635dfe10e?auto=format&fit=crop&w=400&q=80"
      },
      {
        "title": "History 202",
        "students": "30 students",
        "schedule": "Tue, Thu at 1:00 PM",
        "color": Colors.purple,
        "icon": Icons.menu_book,
        "teacherImage":
            "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?auto=format&fit=crop&w=400&q=80"
      },
      {
        "title": "Science 303",
        "students": "28 students",
        "schedule": "Mon, Wed at 2:00 PM",
        "color": Colors.green,
        "icon": Icons.science,
        "teacherImage":
            "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?auto=format&fit=crop&w=400&q=80"
      },
      {
        "title": "English 101",
        "students": "22 students",
        "schedule": "Fri at 12:00 PM",
        "color": Colors.red,
        "icon": Icons.menu_book_rounded,
        "teacherImage":
            "https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=400&q=80"
      },
         {
        "title": "English 101",
        "students": "22 students",
        "schedule": "Fri at 12:00 PM",
        "color": Colors.red,
        "icon": Icons.menu_book_rounded,
        "teacherImage":
            "https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=400&q=80"
      },   {
        "title": "English 101",
        "students": "22 students",
        "schedule": "Fri at 12:00 PM",
        "color": Colors.red,
        "icon": Icons.menu_book_rounded,
        "teacherImage":
            "https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=400&q=80"
      },
    ];

    return BaseScaffold(
      appBar: CustomAppBar(
        title: "",
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add, color: Colors.white),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: classes.length,
          itemBuilder: (context, index) {
            final item = classes[index];
            return ClassItem(item: item);
          },
        ),
      ),
      
    );
  }
}

