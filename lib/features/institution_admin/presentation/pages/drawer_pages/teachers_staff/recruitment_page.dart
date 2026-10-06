import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class RecruitmentPage extends StatelessWidget {
  static const String routeName = '/recruitment';

  const RecruitmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Recruitment",
        subtitle: "Teachers & Staff Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Recruitment Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
