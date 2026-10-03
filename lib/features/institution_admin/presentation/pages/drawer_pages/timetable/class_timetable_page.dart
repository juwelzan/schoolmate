import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class ClassTimetablePage extends StatelessWidget {
  static const String routeName = '/class-timetable';

  const ClassTimetablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Class Timetable",
        subtitle: "Timetable Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Class Timetable Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
