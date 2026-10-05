import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class TemplatesPage extends StatelessWidget {
  static const String routeName = '/certificate-templates';

  const TemplatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Templates",
        subtitle: "Certificates Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Templates Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
