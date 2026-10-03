import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class EmailSettingsPage extends StatelessWidget {
  static const String routeName = '/email-settings';

  const EmailSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Email Settings",
        subtitle: "Communication Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Email Settings Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
