import 'package:catalyst/core/widgets/app_bar.dart';
import 'package:catalyst/core/widgets/custom_text.dart';
import 'package:catalyst/features/home/presentation/widgets/sections_list.dart';
import 'package:flutter/material.dart';
import 'package:catalyst/core/widgets/base_scaffold.dart';
import 'package:catalyst/features/drawer/drawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: CustomAppBar(actions: [
        IconButton(onPressed: (){}, icon: const Icon(Icons.notifications)),
      ],),
      drawer: const CustomDrawer(),
      child: SafeArea(
        child: Padding(

          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            children: [
              const Divider(),
              Align(alignment: Alignment.centerLeft, child: CustomText(text: 'Next Lesson',fontSize: 29,)),
              const SizedBox(height: 16,),
              ScheduleCard(
                subject: 'Math',
                time: '10:00 AM - 11:00 AM',
                day: 'Monday',
              ),


              //SectionsList(),
            ],
          ),
        ),
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  final String subject;
  final String time;
  final String day;

  const ScheduleCard({
    super.key,
    required this.subject,
    required this.time,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200, // خليها ثابتة عشان الشكل يطلع مضبوط
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E2430),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subject,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          const Divider(
            color: Colors.white24,
            thickness: 1,
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                time,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 13,
                ),
              ),
              Text(
                day,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
