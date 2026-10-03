import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class OnlinePaymentsPage extends StatelessWidget {
  static const String routeName = '/online-payments';

  const OnlinePaymentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Online Payments",
        subtitle: "Fee Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Online Payments Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
