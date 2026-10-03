import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class AcademicDesignationsPage extends StatelessWidget {
  static const String routeName = '/academic-designations';

  const AcademicDesignationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Academic Designations",
        subtitle: "Teachers & Staff Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Academic Designations Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
