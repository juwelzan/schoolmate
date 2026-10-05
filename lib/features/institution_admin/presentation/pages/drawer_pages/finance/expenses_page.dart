import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class ExpensesPage extends StatelessWidget {
  static const String routeName = '/expenses';

  const ExpensesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Expenses",
        subtitle: "Finance Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Expenses Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
