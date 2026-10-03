import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class PracticalLabAttendancePage extends StatelessWidget {
  static const String routeName = '/practical-lab-attendance';

  const PracticalLabAttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Practical Lab Attendance",
        subtitle: "Attendance Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Practical Lab Attendance Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
