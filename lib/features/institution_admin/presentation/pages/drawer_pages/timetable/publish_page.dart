import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class PublishPage extends StatelessWidget {
  static const String routeName = '/publish';

  const PublishPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Publish",
        subtitle: "Timetable Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Publish Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
