import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class AttendanceEligibilityPage extends StatelessWidget {
  static const String routeName = '/attendance-eligibility';

  const AttendanceEligibilityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Attendance Eligibility",
        subtitle: "Attendance Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Attendance Eligibility Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
