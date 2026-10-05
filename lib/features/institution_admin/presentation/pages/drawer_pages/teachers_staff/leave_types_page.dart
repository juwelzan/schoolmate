import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class LeaveTypesPage extends StatelessWidget {
  static const String routeName = '/leave-types';

  const LeaveTypesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Leave Types",
        subtitle: "Teachers & Staff Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Leave Types Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
