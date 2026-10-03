import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class WarehousesPage extends StatelessWidget {
  static const String routeName = '/warehouses';

  const WarehousesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Warehouses",
        subtitle: "Inventory Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Warehouses Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
