import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class BankBookPage extends StatelessWidget {
  static const String routeName = '/bank-book';

  const BankBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Bank Book",
        subtitle: "Finance Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Bank Book Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
