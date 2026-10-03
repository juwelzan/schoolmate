import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class GradingScalesPage extends StatelessWidget {
  static const String routeName = '/grading-scales';

  const GradingScalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Grading Scales",
        subtitle: "Academic Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Grading Scales Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
