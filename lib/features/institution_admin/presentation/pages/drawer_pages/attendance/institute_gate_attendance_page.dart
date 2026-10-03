import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class InstituteGateAttendancePage extends StatelessWidget {
  static const String routeName = '/institute-gate-attendance';

  const InstituteGateAttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Institute Gate Attendance",
        subtitle: "Attendance Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Institute Gate Attendance Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
