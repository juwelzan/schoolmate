import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class StaffPage extends StatelessWidget {
  static const String routeName = '/staff';

  const StaffPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Staff",
        subtitle: "Teachers & Staff Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Staff Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
