import 'package:catalyst/core/utils/app_colors.dart';
import 'package:catalyst/core/utils/routs.dart';
import 'package:catalyst/core/widgets/app_bar.dart';
import 'package:catalyst/core/widgets/base_scaffold.dart';
import 'package:catalyst/core/widgets/glass_books.dart';
import 'package:catalyst/features/auth/presentation/widgets/custom_button.dart';
import 'package:catalyst/features/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _pickDateTime() async {
    final d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
    );
    if (d == null) return;
    final t = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (t == null) return;
    setState(() {
      _dateTime = DateTime(d.year, d.month, d.day, t.hour, t.minute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: const CustomAppBar(title: 'Exam Details'),
      drawer: const CustomDrawer(),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            children: [
              const SizedBox(height: 12),
              Form(
                key: _formKey,
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
                                    items:
                                        [
                                              'Class 10-A',
                                              'Class 10-B',
                                              'Class 11-A',
                                            ]
                                            .map(
                                              (c) => DropdownMenuItem(
                                                value: c,
                                                child: Text(c),
                                              ),
                                            )
                                            .toList(),
                                    onChanged: (v) =>
                                        setState(() => _selectedClass = v!),
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
                                        .map(
                                          (c) => DropdownMenuItem(
                                            value: c,
                                            child: Text(c),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (v) =>
                                        setState(() => _examType = v!),
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
                      child: GlassBox(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 18,
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
                            const Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.white60,
                            ),
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

                              _filledTextField(
                                controller: _durationController,
                                hint: 'e.g. 60',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _label('Total Marks'),
                              _filledTextField(
                                controller: _marksController,
                                hint: 'e.g. 100',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          GoRouter.of(context).push(Routs.examQuestions);
                        }
                      },
                      child: CustomButton(text: 'NEXT'),
                    ),
                    const SizedBox(height: 12),
                  ],
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
    child: Text(
      text,
      style: const TextStyle(
        color: Colors.white70,
        fontWeight: FontWeight.w600,
      ),
    ),
  );

  Widget _filledTextField({
    required TextEditingController controller,
    required String hint,
    int maxLines = 1,
  }) {
    return GlassBox(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
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
    return GlassBox(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: child,
    );
  }
}
