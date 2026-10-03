import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class MilestoneTrackerPage extends StatelessWidget {
  static const String routeName = '/milestone-tracker';

  const MilestoneTrackerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Milestone Tracker",
        subtitle: "Examination Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Milestone Tracker Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
