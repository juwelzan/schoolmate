import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class LateFeeRulesPage extends StatelessWidget {
  static const String routeName = '/late-fee-rules';

  const LateFeeRulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Late Fee Rules",
        subtitle: "Fee Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Late Fee Rules Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
