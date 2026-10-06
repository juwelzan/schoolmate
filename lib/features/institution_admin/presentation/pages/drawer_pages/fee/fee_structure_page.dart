import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class FeeStructurePage extends StatelessWidget {
  static const String routeName = '/fee-structure';

  const FeeStructurePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Fee Structure",
        subtitle: "Fee Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Fee Structure Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
