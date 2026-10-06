import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class GraceMarkPoliciesPage extends StatelessWidget {
  static const String routeName = '/grace-mark-policies';

  const GraceMarkPoliciesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Grace Mark Policies",
        subtitle: "Examination Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Grace Mark Policies Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
