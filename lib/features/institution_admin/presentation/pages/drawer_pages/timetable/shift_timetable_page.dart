import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class ShiftTimetablePage extends StatelessWidget {
  static const String routeName = '/shift-timetable';

  const ShiftTimetablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Shift Timetable",
        subtitle: "Timetable Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Shift Timetable Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
