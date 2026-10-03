import 'package:schoolmate/core/file_path.dart';

class InventoryPage extends StatelessWidget {
  static const String routeName = '/inventory';

  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      appBar: SchoolMateAppBar(title: "Inventory", subtitle: "Institution Dashboard"),
      drawer: AppDrawer(),
      body: Center(
        child: Text("Inventory Page - Coming Soon", style: TextStyle(fontSize: 16, color: AppColors.textSecondary)),
      ),
    );
  }
}
