import 'package:catalyst/core/widgets/app_bar.dart';
import 'package:catalyst/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:catalyst/core/widgets/base_scaffold.dart';
import 'package:catalyst/features/drawer/drawer.dart';
import 'package:catalyst/core/widgets/glass_books.dart';

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
    return GlassBox(
      child: SizedBox(
        height: 150,
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
      ),
    );
  }
}
