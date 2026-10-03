import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class InvoicesPage extends StatelessWidget {
  static const String routeName = '/invoices';

  const InvoicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Invoices",
        subtitle: "Fee Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Invoices Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
