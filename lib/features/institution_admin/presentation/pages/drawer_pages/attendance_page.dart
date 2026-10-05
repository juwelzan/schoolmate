import 'package:schoolmate/core/file_path.dart';

class AttendancePage extends StatelessWidget {
  static const String routeName = '/attendance';

  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: SchoolMateAppBar(
        title: "Attendance",
        subtitle: "Institution Dashboard",
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text(
          "Attendance Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
