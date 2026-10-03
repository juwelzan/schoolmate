import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class ClassesSectionsPage extends StatelessWidget {
  static const String routeName = '/classes-sections';

  const ClassesSectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Classes & Sections",
        subtitle: "Academic Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Classes & Sections Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
