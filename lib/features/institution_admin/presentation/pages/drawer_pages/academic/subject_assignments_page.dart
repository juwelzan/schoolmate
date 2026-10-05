import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';
import 'package:schoolmate/features/institution_admin/presentation/widgets/school_mate_app_bar.dart';
import 'package:schoolmate/features/institution_admin/presentation/widgets/app_drawer.dart';

class SubjectAssignmentsPage extends StatelessWidget {
  static const String routeName = '/subject-assignments';

  const SubjectAssignmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Subject Assignments",
        subtitle: "Academic Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Subject Assignments Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
