import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class IncomeStatementPage extends StatelessWidget {
  static const String routeName = '/income-statement';

  const IncomeStatementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Income Statement",
        subtitle: "Finance Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Income Statement Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
