import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class TeacherAvailabilityPage extends StatelessWidget {
  static const String routeName = '/teacher-availability';

  const TeacherAvailabilityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Teacher Availability",
        subtitle: "Timetable Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Teacher Availability Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
