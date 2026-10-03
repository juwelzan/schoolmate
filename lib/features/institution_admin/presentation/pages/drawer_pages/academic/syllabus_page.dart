import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class SyllabusPage extends StatelessWidget {
  static const String routeName = '/syllabus';

  const SyllabusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Syllabus",
        subtitle: "Academic Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Syllabus Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
