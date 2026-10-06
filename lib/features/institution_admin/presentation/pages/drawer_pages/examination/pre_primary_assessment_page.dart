import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class PrePrimaryAssessmentPage extends StatelessWidget {
  static const String routeName = '/pre-primary-assessment';

  const PrePrimaryAssessmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Pre-Primary Assessment",
        subtitle: "Examination Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Pre-Primary Assessment Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
