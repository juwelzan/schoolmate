import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class AssessmentDomainsPage extends StatelessWidget {
  static const String routeName = '/assessment-domains';

  const AssessmentDomainsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Assessment Domains",
        subtitle: "Examination Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Assessment Domains Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
