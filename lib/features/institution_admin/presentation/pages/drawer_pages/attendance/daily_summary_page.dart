import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class DailySummaryPage extends StatelessWidget {
  static const String routeName = '/daily-summary';

  const DailySummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Daily Summary",
        subtitle: "Attendance Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Daily Summary Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
