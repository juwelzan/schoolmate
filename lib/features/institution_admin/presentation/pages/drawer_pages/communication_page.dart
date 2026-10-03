import 'package:schoolmate/core/file_path.dart';

class CommunicationPage extends StatelessWidget {
  static const String routeName = '/communication';

  const CommunicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      appBar: SchoolMateAppBar(title: "Communication", subtitle: "Institution Dashboard"),
      drawer: AppDrawer(),
      body: Center(
        child: Text("Communication Page - Coming Soon", style: TextStyle(fontSize: 16, color: AppColors.textSecondary)),
      ),
    );
  }
}
