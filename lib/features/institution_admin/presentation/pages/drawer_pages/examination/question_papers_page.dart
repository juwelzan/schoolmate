import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class QuestionPapersPage extends StatelessWidget {
  static const String routeName = '/question-papers';

  const QuestionPapersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Question Papers",
        subtitle: "Examination Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Question Papers Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
