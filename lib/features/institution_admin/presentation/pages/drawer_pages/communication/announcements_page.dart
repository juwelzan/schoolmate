import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class AnnouncementsPage extends StatelessWidget {
  static const String routeName = '/announcements';

  const AnnouncementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Announcements",
        subtitle: "Communication Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Announcements Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
