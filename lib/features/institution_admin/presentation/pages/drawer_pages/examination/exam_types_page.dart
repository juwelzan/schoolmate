import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class ExamTypesPage extends StatelessWidget {
  static const String routeName = '/exam-types';

  const ExamTypesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Exam Types",
        subtitle: "Examination Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Exam Types Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
