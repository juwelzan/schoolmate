import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class AttendanceDevicesPage extends StatelessWidget {
  static const String routeName = '/attendance-devices';

  const AttendanceDevicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Attendance Devices",
        subtitle: "Attendance Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Attendance Devices Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
