import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class AutoPostingSettingsPage extends StatelessWidget {
  static const String routeName = '/auto-posting-settings';

  const AutoPostingSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Auto-Posting Settings",
        subtitle: "Finance Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Auto-Posting Settings Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
