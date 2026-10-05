import 'package:schoolmate/core/file_path.dart';

class FeePage extends StatelessWidget {
  static const String routeName = '/fee';

  const FeePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: SchoolMateAppBar(title: "Fee", subtitle: "Institution Dashboard"),
      drawer: AppDrawer(),
      body: Center(
        child: Text(
          "Fee Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
