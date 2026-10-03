import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class ProgramStructuresPage extends StatelessWidget {
  static const String routeName = '/program-structures';

  const ProgramStructuresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Program Structures",
        subtitle: "Academic Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Program Structures Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
