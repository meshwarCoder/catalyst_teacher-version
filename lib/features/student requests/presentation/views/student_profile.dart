import 'package:catalyst/core/widgets/app_bar.dart';
import 'package:catalyst/core/widgets/base_scaffold.dart';
import 'package:catalyst/core/widgets/custom_text.dart';
import 'package:catalyst/core/widgets/glass_books.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StudentProfile extends StatelessWidget {
  const StudentProfile({super.key, required this.from});

  final String from; // 'requests' OR 'classes'

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: CustomAppBar(
        title: from == 'requests' ? 'Join Request' : 'Student Profile',
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      child: from == 'requests'
          ? const _JoinRequestView()
          : const _ClassStudentView(),
    );
  }
}

//
// ========== 1️⃣ واجهة طلب الانضمام ==========
class _JoinRequestView extends StatelessWidget {
  const _JoinRequestView();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// ===== Scrollable Student Info =====
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 45,
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1607746882042-944635dfe10e?auto=format&fit=crop&w=500&q=80',
                  ),
                ),
                const SizedBox(height: 12),
                CustomText(
                  text: "Jessica Miller",
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
                const SizedBox(height: 4),
                CustomText(
                  text: 'Request to join "Advanced Algebra"',
                  color: Colors.grey[400],
                  fontSize: 14,
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2ECC71).withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: CustomText(
                    text: "Pending Review",
                    color: const Color(0xFF2ECC71),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 24),

                // Info card
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF2C3240),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      _InfoItem(Icons.email, "Email", "jessica.m@email.com"),
                      _InfoItem(
                        Icons.school,
                        "Grade & School",
                        "Grade 10 - Northwood High",
                      ),
                      _InfoItem(
                        Icons.class_,
                        "Class Requested",
                        "Advanced Algebra",
                      ),
                      _InfoItem(
                        Icons.calendar_today,
                        "Date of Request",
                        "October 26, 2023",
                      ),
                      _InfoItem(
                        Icons.notes,
                        "Reason for joining",
                        '"I’m really passionate about math and want to challenge myself with more advanced topics to prepare for college."',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Student Performance Preview
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF2C3240),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 12,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _PerformanceItem("GPA", "3.8"),
                      _PerformanceItem("Assignments", "92%"),
                      _PerformanceItem("Attendance", "96%"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        /// ===== Fixed Bottom Section (Buttons) =====
        Container(
          height: 90,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            color: const Color(0xFF1E2230),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 8,
                offset: const Offset(0, -2),
              ),
            ],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 20),
                  ),
                  child: const CustomText(
                    text: "Reject",
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 20),
                  ),
                  child: const CustomText(
                    text: "Accept",
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ClassStudentView extends StatelessWidget {
  const _ClassStudentView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 45,
            backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1607746882042-944635dfe10e?auto=format&fit=crop&w=500&q=80',
            ),
          ),
          const SizedBox(height: 12),
          const CustomText(
            text: "Jessica Miller",
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
          const SizedBox(height: 6),
          const CustomText(
            text: "Grade 10 - Northwood High",
            color: Colors.grey,
            fontSize: 14,
          ),
          const SizedBox(height: 24),

          // Student performance stats
          GlassBox(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _PerformanceItem("GPA", "3.8"),
                _PerformanceItem("Assignments", "92%"),
                _PerformanceItem("Attendance", "96%"),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Additional info section
          GlassBox(
            padding: const EdgeInsets.all(16),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _InfoItem(Icons.mail, "Email", "jessica.m@email.com"),
                _InfoItem(Icons.phone, "Phone", "+1 (555) 123-4567"),
                _InfoItem(
                  Icons.note,
                  "Last Feedback",
                  "Doing great in assignments, needs improvement in attendance.",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//
// ========== Widgets مشتركة ==========
class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoItem(this.icon, this.title, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.grey[400], size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: title, color: Colors.grey[400], fontSize: 13),
                const SizedBox(height: 2),
                CustomText(text: value, color: Colors.white, fontSize: 14),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PerformanceItem extends StatelessWidget {
  final String label;
  final String value;

  const _PerformanceItem(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(text: label, color: Colors.grey[400], fontSize: 13),
        const SizedBox(height: 4),
        CustomText(
          text: value,
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }
}
