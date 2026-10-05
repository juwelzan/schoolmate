import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class InstalmentPlansPage extends StatelessWidget {
  static const String routeName = '/instalment-plans';

  const InstalmentPlansPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Instalment Plans",
        subtitle: "Fee Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Instalment Plans Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
