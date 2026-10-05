import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class SubjectsPage extends StatelessWidget {
  static const String routeName = '/subjects';

  const SubjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Subjects",
        subtitle: "Academic Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Subjects Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
