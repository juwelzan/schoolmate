import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class AttendanceAnalyticsPage extends StatelessWidget {
  static const String routeName = '/attendance-analytics';

  const AttendanceAnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Attendance Analytics",
        subtitle: "Attendance Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Attendance Analytics Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
