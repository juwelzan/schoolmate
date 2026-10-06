import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class TrialBalancePage extends StatelessWidget {
  static const String routeName = '/trial-balance';

  const TrialBalancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Trial Balance",
        subtitle: "Finance Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Trial Balance Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
