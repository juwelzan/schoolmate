import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class PeriodSlotsPage extends StatelessWidget {
  static const String routeName = '/period-slots';

  const PeriodSlotsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Period Slots",
        subtitle: "Timetable Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Period Slots Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
