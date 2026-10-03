import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class PeriodSwapPage extends StatelessWidget {
  static const String routeName = '/period-swap';

  const PeriodSwapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Period Swap",
        subtitle: "Timetable Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Period Swap Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
