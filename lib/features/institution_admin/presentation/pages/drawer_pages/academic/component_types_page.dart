import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class ComponentTypesPage extends StatelessWidget {
  static const String routeName = '/component-types';

  const ComponentTypesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Component Types",
        subtitle: "Academic Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Component Types Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
