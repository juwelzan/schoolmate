import 'package:schoolmate/core/file_path.dart';

class StudentDashboardPage extends StatelessWidget {
  static const String routeName = '/student-dashboard';

  const StudentDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Student Dashboard")),
      body: const Center(
        child: Text("This is the Student Dashboard Page"),
      ),
    );
  }
}
