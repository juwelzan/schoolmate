import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class BalanceSheetPage extends StatelessWidget {
  static const String routeName = '/balance-sheet';

  const BalanceSheetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Balance Sheet",
        subtitle: "Finance Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Balance Sheet Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
