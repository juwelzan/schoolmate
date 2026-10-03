import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class BulkEmailPage extends StatelessWidget {
  static const String routeName = '/bulk-email';

  const BulkEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Bulk Email",
        subtitle: "Communication Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Bulk Email Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
