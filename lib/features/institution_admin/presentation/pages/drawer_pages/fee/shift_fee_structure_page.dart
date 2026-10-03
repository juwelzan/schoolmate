import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class ShiftFeeStructurePage extends StatelessWidget {
  static const String routeName = '/shift-fee-structure';

  const ShiftFeeStructurePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Shift Fee Structure",
        subtitle: "Fee Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Shift Fee Structure Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
