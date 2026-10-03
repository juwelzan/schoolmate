import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class MarksEntryPage extends StatelessWidget {
  static const String routeName = '/marks-entry';

  const MarksEntryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Marks Entry",
        subtitle: "Examination Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Marks Entry Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
