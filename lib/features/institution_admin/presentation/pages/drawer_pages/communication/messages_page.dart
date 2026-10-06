import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class MessagesPage extends StatelessWidget {
  static const String routeName = '/messages';

  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Messages",
        subtitle: "Communication Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Messages Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
