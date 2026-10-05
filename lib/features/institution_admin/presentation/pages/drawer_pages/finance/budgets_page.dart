import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class BudgetsPage extends StatelessWidget {
  static const String routeName = '/budgets';

  const BudgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Budgets",
        subtitle: "Finance Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Budgets Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
