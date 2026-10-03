import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class RoomTimetablePage extends StatelessWidget {
  static const String routeName = '/room-timetable';

  const RoomTimetablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Room Timetable",
        subtitle: "Timetable Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Room Timetable Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
