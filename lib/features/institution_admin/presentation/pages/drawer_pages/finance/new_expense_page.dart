import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class NewExpensePage extends StatelessWidget {
  static const String routeName = '/new-expense';

  const NewExpensePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "New Expense",
        subtitle: "Finance Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "New Expense Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
