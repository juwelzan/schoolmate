import 'package:schoolmate/core/file_path.dart';

class ExaminationPage extends StatelessWidget {
  static const String routeName = '/examination';

  const ExaminationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      appBar: SchoolMateAppBar(title: "Examination", subtitle: "Institution Dashboard"),
      drawer: AppDrawer(),
      body: Center(
        child: Text("Examination Page - Coming Soon", style: TextStyle(fontSize: 16, color: AppColors.textSecondary)),
      ),
    );
  }
}
