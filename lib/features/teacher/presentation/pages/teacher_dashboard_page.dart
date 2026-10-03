import 'package:schoolmate/core/file_path.dart';

class TeacherDashboardPage extends StatelessWidget {
  static const String routeName = '/teacher-dashboard';

  const TeacherDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Teacher Dashboard")),
      body: const Center(
        child: Text("This is the Teacher Dashboard Page"),
      ),
    );
  }
}
