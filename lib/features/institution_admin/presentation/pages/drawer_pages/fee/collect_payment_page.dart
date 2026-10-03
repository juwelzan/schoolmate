import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class CollectPaymentPage extends StatelessWidget {
  static const String routeName = '/collect-payment';

  const CollectPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Collect Payment",
        subtitle: "Fee Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Collect Payment Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
