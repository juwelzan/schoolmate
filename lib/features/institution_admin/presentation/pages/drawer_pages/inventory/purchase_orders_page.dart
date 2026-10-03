import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class PurchaseOrdersPage extends StatelessWidget {
  static const String routeName = '/purchase-orders';

  const PurchaseOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Purchase Orders",
        subtitle: "Inventory Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Purchase Orders Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
