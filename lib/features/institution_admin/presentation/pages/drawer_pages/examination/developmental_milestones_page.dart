import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class DevelopmentalMilestonesPage extends StatelessWidget {
  static const String routeName = '/developmental-milestones';

  const DevelopmentalMilestonesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Developmental Milestones",
        subtitle: "Examination Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Developmental Milestones Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
