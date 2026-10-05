import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class DefaulterListPage extends StatelessWidget {
  static const String routeName = '/defaulter-list';

  const DefaulterListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Defaulter List",
        subtitle: "Fee Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Defaulter List Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
