import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class IssueCertificatesPage extends StatelessWidget {
  static const String routeName = '/issue-certificates';

  const IssueCertificatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Issue Certificates",
        subtitle: "Certificates Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Issue Certificates Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
