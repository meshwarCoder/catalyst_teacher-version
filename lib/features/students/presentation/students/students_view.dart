import 'package:flutter/material.dart';
import 'package:catalyst/core/widgets/base_scaffold.dart';

class StudentsView extends StatelessWidget {
  const StudentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      child: Center(
        child: Text('Students'),
      ),
    );
  }
}