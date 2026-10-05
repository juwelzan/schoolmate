import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class SubstituteAssignmentPage extends StatelessWidget {
  static const String routeName = '/substitute-assignment';

  const SubstituteAssignmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Substitute Assignment",
        subtitle: "Timetable Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Substitute Assignment Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
