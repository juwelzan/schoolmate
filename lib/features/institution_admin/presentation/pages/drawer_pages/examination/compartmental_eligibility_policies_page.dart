import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class CompartmentalEligibilityPoliciesPage extends StatelessWidget {
  static const String routeName = '/compartmental-eligibility-policies';

  const CompartmentalEligibilityPoliciesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Compartmental Eligibility Policies",
        subtitle: "Examination Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Compartmental Eligibility Policies Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
