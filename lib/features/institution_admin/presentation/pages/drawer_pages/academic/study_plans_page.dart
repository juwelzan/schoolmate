import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class StudyPlansPage extends StatelessWidget {
  static const String routeName = '/study-plans';

  const StudyPlansPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Study Plans",
        subtitle: "Academic Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Study Plans Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
