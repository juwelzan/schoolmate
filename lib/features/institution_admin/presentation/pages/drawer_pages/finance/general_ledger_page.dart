import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class GeneralLedgerPage extends StatelessWidget {
  static const String routeName = '/general-ledger';

  const GeneralLedgerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "General Ledger",
        subtitle: "Finance Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "General Ledger Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
