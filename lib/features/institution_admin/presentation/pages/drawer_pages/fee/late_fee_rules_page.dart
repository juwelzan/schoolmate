import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class LateFeeRulesPage extends StatelessWidget {
  static const String routeName = '/late-fee-rules';

  const LateFeeRulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Late Fee Rules",
        subtitle: "Fee Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Late Fee Rules Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
