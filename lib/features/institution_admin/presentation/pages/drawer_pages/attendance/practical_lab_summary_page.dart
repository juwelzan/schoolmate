import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class PracticalLabSummaryPage extends StatelessWidget {
  static const String routeName = '/practical-lab-summary';

  const PracticalLabSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Practical Lab Summary",
        subtitle: "Attendance Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Practical Lab Summary Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
