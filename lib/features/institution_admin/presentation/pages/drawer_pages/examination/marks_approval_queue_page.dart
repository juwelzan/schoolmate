import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class MarksApprovalQueuePage extends StatelessWidget {
  static const String routeName = '/marks-approval-queue';

  const MarksApprovalQueuePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Marks Approval Queue",
        subtitle: "Examination Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Marks Approval Queue Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
