import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class LessonPlansPage extends StatelessWidget {
  static const String routeName = '/lesson-plans';

  const LessonPlansPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Lesson Plans",
        subtitle: "Academic Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Lesson Plans Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
