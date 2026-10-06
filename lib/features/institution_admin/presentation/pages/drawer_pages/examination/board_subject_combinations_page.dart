import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class BoardSubjectCombinationsPage extends StatelessWidget {
  static const String routeName = '/board-subject-combinations';

  const BoardSubjectCombinationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Board Subject Combinations",
        subtitle: "Examination Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Board Subject Combinations Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
