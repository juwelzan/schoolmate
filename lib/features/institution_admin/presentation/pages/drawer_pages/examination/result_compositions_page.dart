import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class ResultCompositionsPage extends StatelessWidget {
  static const String routeName = '/result-compositions';

  const ResultCompositionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Result Compositions",
        subtitle: "Examination Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Result Compositions Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
