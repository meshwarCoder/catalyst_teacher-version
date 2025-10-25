import 'package:catalyst/core/utils/app_colors.dart';
import 'package:catalyst/core/widgets/app_bar.dart';
import 'package:catalyst/core/widgets/base_scaffold.dart';
import 'package:catalyst/core/widgets/custom_text.dart';
import 'package:catalyst/features/drawer/drawer.dart';
import 'package:flutter/material.dart';

class CreateExamPage extends StatefulWidget {
  const CreateExamPage({super.key});

  @override
  State<CreateExamPage> createState() => _CreateExamPageState();
}

class _CreateExamPageState extends State<CreateExamPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _marksController = TextEditingController();
  DateTime? _dateTime;

  String _selectedClass = 'Class 10-A';
  String _examType = 'Mid-Term';

  final List<Map<String, String>> _questions = [
    {
      'q': 'Q1: What is the powerhouse of the cell?',
      'type': 'MCQ',
    },
    {
      'q': "Q2: Explain Newton's First Law of Motion.",
      'type': 'Short Answer',
    }
  ];

  Future<void> _pickDateTime() async {
    final d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
    );
    if (d == null) return;
    final t = await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (t == null) return;
    setState(() {
      _dateTime = DateTime(d.year, d.month, d.day, t.hour, t.minute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: const CustomAppBar(title: ''),
      drawer: const CustomDrawer(),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [    
              const SizedBox(height: 12),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _label('Exam Title'),
                      _filledTextField(
                        controller: _titleController,
                        hint: 'e.g. Mid-Term Biology Test',
                      ),

                      const SizedBox(height: 12),
                      _label('Description'),
                      _filledTextField(
                        controller: _descController,
                        hint: 'Enter a brief description of the exam',
                        maxLines: 4,
                      ),

                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _label('Select Class'),
                                _decoratedDropdown(
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      style: const TextStyle(color: Colors.white),
                                      value: _selectedClass,
                                      items: [
                                        'Class 10-A',
                                        'Class 10-B',
                                        'Class 11-A',
                                      ]
                                          .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                                          .toList(),
                                      onChanged: (v) => setState(() => _selectedClass = v!),
                                      dropdownColor: AppColors.primary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _label('Exam Type'),
                                _decoratedDropdown(
                                  child: DropdownButtonHideUnderline(
                                    
                                    child: DropdownButton<String>(
                                      style: const TextStyle(color: Colors.white),
                                      value: _examType,
                                      items: ['Mid-Term', 'Final', 'Quiz']
                                          .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                                          .toList(),
                                      onChanged: (v) => setState(() => _examType = v!),
                                      dropdownColor: AppColors.primary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),
                      _label('Date & Time'),
                      GestureDetector(
                        onTap: _pickDateTime,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  _dateTime == null
                                      ? 'mm/dd/yyyy, --:--'
                                      : '${_dateTime!.month}/${_dateTime!.day}/${_dateTime!.year}, ${_dateTime!.hour.toString().padLeft(2, '0')}:${_dateTime!.minute.toString().padLeft(2, '0')}',
                                  style: const TextStyle(color: Colors.white60),
                                ),
                              ),
                              const Icon(Icons.calendar_month_outlined, color: Colors.white60),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _label('Duration (mins)'),
                                _filledTextField(controller: _durationController, hint: 'e.g. 60'),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _label('Total Marks'),
                                _filledTextField(controller: _marksController, hint: 'e.g. 100'),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 18),
                      CustomText(
                        text: 'Questions',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
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
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: const Color(0xFF6C2A9A),
                              width: 1.5,
                              style: BorderStyle.solid,
                            ),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(Icons.add_circle_outline, size: 26, color: Color(0xFF8A3EF2)),
                                SizedBox(height: 6),
                                Text('Add Question', style: TextStyle(color: Color(0xFF8A3EF2))),
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
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            CustomText(text: entry.value['q']!, fontWeight: FontWeight.w600),
                                            const SizedBox(height: 8),
                                            Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                                              decoration: BoxDecoration(
                                                color: AppColors.likeBlack,
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              child: CustomText(text: entry.value['type']!, fontSize: 12),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Column(
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.edit, size: 18, color: Colors.white70),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              setState(() {
                                                _questions.removeAt(entry.key);
                                              });
                                            },
                                            icon: const Icon(Icons.delete_outline, size: 18, color: Colors.white70),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xFF7B2CF6),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(child: CustomText(text: 'Create Exam', fontWeight: FontWeight.bold,fontSize: 25,)),
                          
                        ),
                      ),
                      const SizedBox(height: 12,)

                    ],
                  ),
                ),
              ),

             
            ],
          ),
        ),
      ),
    );
  }

  Widget _label(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 6.0),
        child: Text(text, style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.w600)),
      );

  Widget _filledTextField({
    required TextEditingController controller,
    required String hint,
    int maxLines = 1,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white38),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _decoratedDropdown({required Widget child}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(14),
      ),
      child: child,
    );
  }
}
