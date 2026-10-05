import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class CashBookPage extends StatelessWidget {
  static const String routeName = '/cash-book';

  const CashBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Cash Book",
        subtitle: "Finance Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Cash Book Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
