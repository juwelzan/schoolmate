import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class BacklogImprovementRulesPage extends StatelessWidget {
  static const String routeName = '/backlog-improvement-rules';

  const BacklogImprovementRulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Backlog/Improvement Rules",
        subtitle: "Examination Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Backlog/Improvement Rules Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
