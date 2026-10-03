import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class CombinedEligibilityPage extends StatelessWidget {
  static const String routeName = '/combined-eligibility';

  const CombinedEligibilityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Combined Eligibility",
        subtitle: "Attendance Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Combined Eligibility Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
