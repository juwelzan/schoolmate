import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class QuestionBankPage extends StatelessWidget {
  static const String routeName = '/question-bank';

  const QuestionBankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Question Bank",
        subtitle: "Examination Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Question Bank Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
