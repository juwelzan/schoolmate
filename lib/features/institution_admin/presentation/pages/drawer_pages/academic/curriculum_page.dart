import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class CurriculumPage extends StatelessWidget {
  static const String routeName = '/curriculum';

  const CurriculumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Curriculum",
        subtitle: "Academic Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Curriculum Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
