import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class BulkSmsPage extends StatelessWidget {
  static const String routeName = '/bulk-sms';

  const BulkSmsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Bulk SMS",
        subtitle: "Communication Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Bulk SMS Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
