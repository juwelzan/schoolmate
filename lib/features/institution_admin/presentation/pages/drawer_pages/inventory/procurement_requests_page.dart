import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class ProcurementRequestsPage extends StatelessWidget {
  static const String routeName = '/procurement-requests';

  const ProcurementRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Procurement Requests",
        subtitle: "Inventory Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Procurement Requests Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
