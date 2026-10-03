import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class ExamTermsPage extends StatelessWidget {
  static const String routeName = '/exam-terms';

  const ExamTermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Exam Terms",
        subtitle: "Examination Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Exam Terms Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
