import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class ExamsPage extends StatelessWidget {
  static const String routeName = '/exams';

  const ExamsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Exams",
        subtitle: "Examination Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Exams Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
