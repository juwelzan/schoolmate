import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';
import 'package:schoolmate/features/institution_admin/presentation/widgets/school_mate_app_bar.dart';
import 'package:schoolmate/features/institution_admin/presentation/widgets/app_drawer.dart';

class ProcurementRequestsPage extends StatelessWidget {
  static const String routeName = '/procurement-requests';

  const ProcurementRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Procurement Requests",
        subtitle: "Inventory Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Procurement Requests Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
