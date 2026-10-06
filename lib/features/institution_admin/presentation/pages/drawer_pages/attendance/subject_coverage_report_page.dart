import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class SubjectCoverageReportPage extends StatelessWidget {
  static const String routeName = '/subject-coverage-report';

  const SubjectCoverageReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Subject Coverage Report",
        subtitle: "Attendance Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Subject Coverage Report Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
