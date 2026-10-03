import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class WeightProfilesPage extends StatelessWidget {
  static const String routeName = '/weight-profiles';

  const WeightProfilesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Weight Profiles",
        subtitle: "Examination Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Weight Profiles Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
