import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class ChartOfAccountsPage extends StatelessWidget {
  static const String routeName = '/chart-of-accounts';

  const ChartOfAccountsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Chart of Accounts",
        subtitle: "Finance Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Chart of Accounts Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
