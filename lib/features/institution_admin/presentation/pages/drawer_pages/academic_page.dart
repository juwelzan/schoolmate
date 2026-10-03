import 'package:schoolmate/core/file_path.dart';

class AcademicPage extends StatelessWidget {
  static const String routeName = '/academic';

  const AcademicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      appBar: SchoolMateAppBar(title: "Academic", subtitle: "Institution Dashboard"),
      drawer: AppDrawer(),
      body: Center(
        child: Text("Academic Page - Coming Soon", style: TextStyle(fontSize: 16, color: AppColors.textSecondary)),
      ),
    );
  }
}
