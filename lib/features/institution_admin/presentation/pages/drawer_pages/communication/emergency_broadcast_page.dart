import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class EmergencyBroadcastPage extends StatelessWidget {
  static const String routeName = '/emergency-broadcast';

  const EmergencyBroadcastPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Emergency Broadcast",
        subtitle: "Communication Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Emergency Broadcast Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
