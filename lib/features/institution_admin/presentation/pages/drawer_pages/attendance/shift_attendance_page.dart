import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class ShiftAttendancePage extends StatelessWidget {
  static const String routeName = '/shift-attendance';

  const ShiftAttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Shift Attendance",
        subtitle: "Attendance Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Shift Attendance Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
