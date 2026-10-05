import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class BulkImportAssignmentsPage extends StatelessWidget {
  static const String routeName = '/bulk-import-assignments';

  const BulkImportAssignmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Bulk Import Assignments",
        subtitle: "Teachers & Staff Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Bulk Import Assignments Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
