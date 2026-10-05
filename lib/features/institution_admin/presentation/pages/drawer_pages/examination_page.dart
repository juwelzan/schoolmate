import 'package:schoolmate/core/file_path.dart';
import 'package:schoolmate/features/institution_admin/presentation/widgets/school_mate_app_bar.dart';
import 'package:schoolmate/features/institution_admin/presentation/widgets/app_drawer.dart';

class ExaminationPage extends StatelessWidget {
  static const String routeName = '/examination';

  const ExaminationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: SchoolMateAppBar(
        title: "Examination",
        subtitle: "Institution Dashboard",
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text(
          "Examination Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
