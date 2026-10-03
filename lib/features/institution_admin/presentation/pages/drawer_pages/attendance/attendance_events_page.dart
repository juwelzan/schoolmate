import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class AttendanceEventsPage extends StatelessWidget {
  static const String routeName = '/attendance-events';

  const AttendanceEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Attendance Events",
        subtitle: "Attendance Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Attendance Events Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
