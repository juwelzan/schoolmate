import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class IncomePage extends StatelessWidget {
  static const String routeName = '/income';

  const IncomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Income",
        subtitle: "Finance Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Income Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
