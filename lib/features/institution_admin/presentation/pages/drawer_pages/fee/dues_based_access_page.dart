import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class DuesBasedAccessPage extends StatelessWidget {
  static const String routeName = '/dues-based-access';

  const DuesBasedAccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Dues-Based Access",
        subtitle: "Fee Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Dues-Based Access Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
