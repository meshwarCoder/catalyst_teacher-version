import 'package:catalyst/core/widgets/app_bar.dart';
import 'package:catalyst/features/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:catalyst/core/widgets/base_scaffold.dart';
import 'package:catalyst/features/student requests/presentation/widgets/student_request_item.dart';

class StudentRequestsView extends StatelessWidget {
  const StudentRequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    final requests = [
      {
        "name": "Jessica Miller",
        "class": "Grade 8 Science",
        "date": "Oct 26, 2023",
        "image":
            "https://lh3.googleusercontent.com/aida-public/AB6AXuD5dFezxlqDZ6lAtI0jPlHFoUTNfeVJx8iYbh4FysFtXitjRpwg3cazxbgA86Ahx_MxIa6jjW6nxR3F5LP6ax-WFobzdTokVrU4srygHPo84d8ytGnuxGGdW8gu27zLzIUiLzAUFdbeV12t_xUlNAVpBE5t8tI09-6AjZEXXEfx480EW8GBqggBjL1Ppsz4l5mcZ21Z64vlsd_9KSlgCDmDwTkpEB2cvrDDZkCbdU83zUNruTFAMr5TJxcIbfhIqa4xz7slVvQ66w18",
      },
      {
        "name": "John Smith",
        "class": "Grade 10 History",
        "date": "Oct 25, 2023",
        "image":
            "https://lh3.googleusercontent.com/aida-public/AB6AXuA1cOB--EqNHvXdgKKGymBNXaXi8Yc6KKBYovsiFfZAPG9jFJkhIwwBfe1Cr5sKXJxsO_7DkonQqcHkLjt9o6spbaI0cOaZVG7T2Zwz-XtHP3UvEQ9flbwqmSiS_XSEB2FjfuXNIl_u4SOINhqSZ3gGjEYiL2gNzkdpqkcI6LDf7lQpeZkwDJaRS5KxsBT1wD4PjDRXnpUa0AKbx_mGbW-hIvfneVhF6kBfywIiXE10ee9JTTIcTjZ0VmxLlfC85rVAyXWcMA6oRAA5",
      },
      {
        "name": "Emily White",
        "class": "Grade 9 Math",
        "date": "Oct 24, 2023",
        "image":
            "https://lh3.googleusercontent.com/aida-public/AB6AXuAXnfQKXuYef1Ku-dVXWWp0cnQbiTJomHGhfShYUfXT8g7L9m3aufFfSbDkW3OmgVo1wVg5F00o89gB89CyHWpy0p0ZO7jj2zBE4vGdBWw6d-dnWzKntMxEo6_v8Dk0QHZqXTLvbscFqPmj5E5ro-IThaUoGL1yI9SWvwt6_qah8PCX-uvFEOTHuyu2QsVtb2hE-D-sZB2lmfL4gUqBX1m4SbxFOvzXi0Xoar868lbztFqIa22DiKSQnrqalGK2Tdq-Tl_pX94lgH4d",
      },
    ];

    return BaseScaffold(
      appBar: const CustomAppBar(title: 'Student Requests'),
      drawer: const CustomDrawer(),

      child: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: requests.length,
          itemBuilder: (context, index) {
            final student = requests[index];
            return StudentRequestItem(student: student);
          },
        ),
      ),
    );
  }
}
