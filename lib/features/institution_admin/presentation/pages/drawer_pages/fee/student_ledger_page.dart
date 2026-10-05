import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class StudentLedgerPage extends StatelessWidget {
  static const String routeName = '/student-ledger';

  const StudentLedgerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Student Ledger",
        subtitle: "Fee Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Student Ledger Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
