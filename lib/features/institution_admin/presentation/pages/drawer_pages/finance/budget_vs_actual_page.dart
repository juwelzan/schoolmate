import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class BudgetVsActualPage extends StatelessWidget {
  static const String routeName = '/budget-vs-actual';

  const BudgetVsActualPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Budget vs Actual",
        subtitle: "Finance Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Budget vs Actual Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
