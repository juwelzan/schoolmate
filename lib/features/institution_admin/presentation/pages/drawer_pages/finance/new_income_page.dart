import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class NewIncomePage extends StatelessWidget {
  static const String routeName = '/new-income';

  const NewIncomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "New Income",
        subtitle: "Finance Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "New Income Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
