import 'package:catalyst/core/widgets/app_bar.dart';
import 'package:catalyst/core/widgets/base_scaffold.dart';
import 'package:catalyst/core/widgets/custom_text.dart';
import 'package:catalyst/core/widgets/glass_books.dart';
import 'package:flutter/material.dart';

class ExamQuestions extends StatefulWidget {
  const ExamQuestions({super.key});

  @override
  State<ExamQuestions> createState() => _ExamQuestionsState();
}

class _ExamQuestionsState extends State<ExamQuestions> {
  final List<Map<String, String>> _questions = [
    {'q': 'Q1: What is the powerhouse of the cell?', 'type': 'MCQ'},
    {'q': "Q2: Explain Newton's First Law of Motion.", 'type': 'Short Answer'},
  ];

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: CustomAppBar(
        title: 'Questions',
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: Colors.white, size: 24),
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 12),

                // Add Question dotted box
                GestureDetector(
                  onTap: () {
                    // add dummy question
                    setState(() {
                      _questions.add({
                        'q': 'Q${_questions.length + 1}: New Question',
                        'type': 'MCQ',
                      });
                    });
                  },
                  child: GlassBox(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.add_circle_outline,
                            size: 26,
                            color: Colors.white,
                          ),
                          SizedBox(height: 6),
                          CustomText(text: 'Add Question', color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // list of questions
                Column(
                  children: _questions
                      .asMap()
                      .entries
                      .map(
                        (entry) => Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: GlassBox(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: entry.value['q']!,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      const SizedBox(height: 8),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white10,
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: CustomText(
                                          text: entry.value['type']!,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Column(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.edit,
                                        size: 18,
                                        color: Colors.white70,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _questions.removeAt(entry.key);
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.delete_outline,
                                        size: 18,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 20),
                GlassBox(
                  child: const Center(
                    child: CustomText(text: 'Create Exam', color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
