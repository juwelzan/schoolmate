import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';
import 'package:schoolmate/features/institution_admin/presentation/widgets/school_mate_app_bar.dart';
import 'package:schoolmate/features/institution_admin/presentation/widgets/app_drawer.dart';

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
