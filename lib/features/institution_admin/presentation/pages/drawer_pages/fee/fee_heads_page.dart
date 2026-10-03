import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class FeeHeadsPage extends StatelessWidget {
  static const String routeName = '/fee-heads';

  const FeeHeadsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Fee Heads",
        subtitle: "Fee Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Fee Heads Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
