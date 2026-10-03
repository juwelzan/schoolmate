import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class FeeReportsPage extends StatelessWidget {
  static const String routeName = '/fee-reports';

  const FeeReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Fee Reports",
        subtitle: "Fee Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Fee Reports Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
