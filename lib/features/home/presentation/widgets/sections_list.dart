import 'package:catalyst/core/utils/assets.dart';
import 'package:catalyst/features/home/presentation/widgets/section_list_item.dart';
import 'package:flutter/material.dart';

class SectionsList extends StatelessWidget {
  const SectionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return SectionListItem(
          title: 'Section',
          imagePath: Assets.sectionImage,
          onTap: () {},
        );
      },
    );
  }
}