
import 'package:catalyst/features/auto%20grade/presentation/views/auto_grade_view.dart';
import 'package:catalyst/features/home/presentation/views/home_view.dart';
import 'package:catalyst/features/schedule/presentation/views/schedule_view.dart';
import 'package:catalyst/features/students/presentation/students/students_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:catalyst/core/utils/app_colors.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

late PageController pageController;
late List<Widget> views;

int currentScreen = 0;


class _RootState extends State<Root> {

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentScreen);
    views = [
      HomeView(),
      ScheduleView(),
      StudentsView(),  
      AutoGradeView(),

    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: views,
        onPageChanged: (value) {
          setState(() {
            currentScreen = value;
          });
        },
      ),


    bottomNavigationBar: BottomNavigationBar(
      elevation: 0,
      backgroundColor: AppColors.scaffoldBackground,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.button,
      unselectedItemColor: Colors.grey.shade400,
      currentIndex: currentScreen,
      onTap: (value) {
        setState(() {
          currentScreen = value;
          pageController.jumpToPage(
            value,
          );
        });
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.home),
          label: 'Home',
        ),
       
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.person),
          label: 'Students',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Schedule',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.grade),
          label: 'Grades',
        ),
      ],
    ),
    );
  }
}