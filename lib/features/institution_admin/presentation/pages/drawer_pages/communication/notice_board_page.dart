import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class NoticeBoardPage extends StatelessWidget {
  static const String routeName = '/notice-board';

  const NoticeBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Notice Board",
        subtitle: "Communication Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Notice Board Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
