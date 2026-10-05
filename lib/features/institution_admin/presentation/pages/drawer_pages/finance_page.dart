import 'package:schoolmate/core/file_path.dart';

class FinancePage extends StatelessWidget {
  static const String routeName = '/finance';

  const FinancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: SchoolMateAppBar(
        title: "Finance",
        subtitle: "Institution Dashboard",
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text(
          "Finance Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
