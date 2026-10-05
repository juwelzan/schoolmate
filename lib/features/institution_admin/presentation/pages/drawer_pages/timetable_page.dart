import 'package:schoolmate/core/file_path.dart';

class TimetablePage extends StatelessWidget {
  static const String routeName = '/timetable';

  const TimetablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: SchoolMateAppBar(
        title: "Timetable",
        subtitle: "Institution Dashboard",
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text(
          "Timetable Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
