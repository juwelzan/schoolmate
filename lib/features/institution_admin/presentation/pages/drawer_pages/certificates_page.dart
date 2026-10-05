import 'package:schoolmate/core/file_path.dart';

class CertificatesPage extends StatelessWidget {
  static const String routeName = '/certificates';

  const CertificatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: SchoolMateAppBar(
        title: "Certificates",
        subtitle: "Institution Dashboard",
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text(
          "Certificates Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
