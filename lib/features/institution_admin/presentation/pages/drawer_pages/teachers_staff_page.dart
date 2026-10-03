import 'package:schoolmate/core/file_path.dart';

class TeachersStaffPage extends StatelessWidget {
  static const String routeName = '/teachers-staff';

  const TeachersStaffPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      appBar: SchoolMateAppBar(title: "Teachers & Staff", subtitle: "Institution Dashboard"),
      drawer: AppDrawer(),
      body: Center(
        child: Text("Teachers & Staff Page - Coming Soon", style: TextStyle(fontSize: 16, color: AppColors.textSecondary)),
      ),
    );
  }
}
