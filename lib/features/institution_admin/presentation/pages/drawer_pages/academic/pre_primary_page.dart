import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class PrePrimaryPage extends StatelessWidget {
  static const String routeName = '/pre-primary';

  const PrePrimaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Pre-Primary",
        subtitle: "Academic Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Pre-Primary Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
