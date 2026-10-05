import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class WeightProfilesPage extends StatelessWidget {
  static const String routeName = '/weight-profiles';

  const WeightProfilesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Weight Profiles",
        subtitle: "Examination Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Weight Profiles Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
