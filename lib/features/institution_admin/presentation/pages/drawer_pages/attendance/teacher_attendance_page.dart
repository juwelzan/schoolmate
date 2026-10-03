import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class TeacherAttendancePage extends StatelessWidget {
  static const String routeName = '/teacher-attendance';

  const TeacherAttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Teacher Attendance",
        subtitle: "Attendance Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Teacher Attendance Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
