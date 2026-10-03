import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class TeacherMonthlyReportPage extends StatelessWidget {
  static const String routeName = '/teacher-monthly-report';

  const TeacherMonthlyReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Teacher Monthly Report",
        subtitle: "Attendance Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Teacher Monthly Report Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
