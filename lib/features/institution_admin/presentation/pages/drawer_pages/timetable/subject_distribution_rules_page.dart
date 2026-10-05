import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class SubjectDistributionRulesPage extends StatelessWidget {
  static const String routeName = '/subject-distribution-rules';

  const SubjectDistributionRulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Subject Distribution Rules",
        subtitle: "Timetable Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Subject Distribution Rules Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
