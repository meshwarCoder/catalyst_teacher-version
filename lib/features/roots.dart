import 'package:catalyst/features/home/presentation/views/home_view.dart';
import 'package:catalyst/features/my%20classes/presentation/views/my_classes_view.dart';
import 'package:catalyst/features/student%20requests/presentation/views/student_requests.dart';
import 'package:catalyst/features/students/presentation/students/create_exam_Page.dart';
import 'package:flutter/material.dart';
import 'package:liquid_glass_navbar/liquid_glass_navbar.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int _index = 0;

  final items = [
    LiquidGlassNavItem(icon: Icons.home, label: "Page1"),
    LiquidGlassNavItem(icon: Icons.class_, label: "Page2"),
    LiquidGlassNavItem(icon: Icons.person, label: "Page3"),
    LiquidGlassNavItem(icon: Icons.add, label: "Page4"),
  ];

  final pages = [
    const HomeView(),
    const MyClassesView(),
    const StudentRequestsView(),
    const CreateExamPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return LiquidGlassNavBar(
      
      currentIndex: _index,
      onPageChanged: (i) => setState(() => _index = i),
      pages: pages,
      items: items,
      bottomPadding: 25,
      horizontalPadding: 25,
      bubbleBorderWidth: 2,
      

    );
  }
}