import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class TeacherTimetablePage extends StatelessWidget {
  static const String routeName = '/teacher-timetable';

  const TeacherTimetablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Teacher Timetable",
        subtitle: "Timetable Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Teacher Timetable Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
