import 'package:catalyst/core/utils/app_colors.dart';
import 'package:catalyst/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class AutoGradeButton extends StatelessWidget {
  const AutoGradeButton({super.key, required this.text,required this.icon});

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 180,
      decoration: BoxDecoration(
        color: AppColors.button,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon,color: AppColors.likeWhite,),
          SizedBox(height: 5,),
          CustomText(text: text)          
        ],
      ),
    );
    
  }
}