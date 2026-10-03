import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class StockItemsPage extends StatelessWidget {
  static const String routeName = '/stock-items';

  const StockItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Stock Items",
        subtitle: "Inventory Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Stock Items Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
