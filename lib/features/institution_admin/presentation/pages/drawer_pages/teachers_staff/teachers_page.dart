import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class TeachersPage extends StatelessWidget {
  static const String routeName = '/teachers';

  const TeachersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Teachers",
        subtitle: "Teachers & Staff Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Teachers Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
