import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class RoomsPage extends StatelessWidget {
  static const String routeName = '/rooms';

  const RoomsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Rooms",
        subtitle: "Timetable Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Rooms Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
