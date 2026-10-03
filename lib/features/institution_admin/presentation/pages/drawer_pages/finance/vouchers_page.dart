import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class VouchersPage extends StatelessWidget {
  static const String routeName = '/vouchers';

  const VouchersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Vouchers",
        subtitle: "Finance Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Vouchers Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
