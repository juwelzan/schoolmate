import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class DueTrackingPage extends StatelessWidget {
  static const String routeName = '/due-tracking';

  const DueTrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Due Tracking",
        subtitle: "Fee Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Due Tracking Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
