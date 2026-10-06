import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class MonthlyAttendancePage extends StatelessWidget {
  static const String routeName = '/monthly-attendance';

  const MonthlyAttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Monthly Attendance",
        subtitle: "Attendance Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Monthly Attendance Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
