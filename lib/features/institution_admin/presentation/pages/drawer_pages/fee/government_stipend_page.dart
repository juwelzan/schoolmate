import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class GovernmentStipendPage extends StatelessWidget {
  static const String routeName = '/government-stipend';

  const GovernmentStipendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Government Stipend",
        subtitle: "Fee Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Government Stipend Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
