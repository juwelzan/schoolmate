import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class RevisionsPage extends StatelessWidget {
  static const String routeName = '/revisions';

  const RevisionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Revisions",
        subtitle: "Timetable Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Revisions Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
