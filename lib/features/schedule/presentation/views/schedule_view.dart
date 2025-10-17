import 'package:catalyst/core/widgets/base_scaffold.dart';
import 'package:flutter/material.dart';

class ScheduleView extends StatelessWidget {
  const ScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      child: Center(
        child: Text('Schedule'),
      ),
    );
  }
}