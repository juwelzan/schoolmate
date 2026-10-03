import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class VendorsPage extends StatelessWidget {
  static const String routeName = '/vendors';

  const VendorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Vendors",
        subtitle: "Inventory Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Vendors Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
