import 'package:catalyst/core/utils/app_colors.dart';
import 'package:catalyst/features/auto%20grade/presentation/widgets/auto_grade_button.dart';
import 'package:catalyst/features/drawer/drawer.dart';
import 'package:flutter/material.dart';

class AutoGradeView extends StatelessWidget {
  const AutoGradeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: CustomDrawer(),
      backgroundColor: AppColors.scaffoldBackground,
      body: Column(
        children: [

          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AutoGradeButton(text: 'Upload', icon: Icons.upload),
              AutoGradeButton(text: 'Take Photo', icon: Icons.photo),
            ],
          ),
          SizedBox(height: 50,)
        ],
      ),
    );
  }
}