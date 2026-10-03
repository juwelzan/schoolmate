import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class SubjectAssignmentMatrixPage extends StatelessWidget {
  static const String routeName = '/subject-assignment-matrix';

  const SubjectAssignmentMatrixPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Subject Assignment Matrix",
        subtitle: "Teachers & Staff Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Subject Assignment Matrix Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
