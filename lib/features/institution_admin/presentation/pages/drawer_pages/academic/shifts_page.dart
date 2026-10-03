import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class ShiftsPage extends StatelessWidget {
  static const String routeName = '/shifts';

  const ShiftsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Shifts",
        subtitle: "Academic Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Shifts Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
