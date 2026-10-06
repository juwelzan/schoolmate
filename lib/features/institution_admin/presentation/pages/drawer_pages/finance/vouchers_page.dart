import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class VouchersPage extends StatelessWidget {
  static const String routeName = '/vouchers';

  const VouchersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Vouchers",
        subtitle: "Finance Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Vouchers Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
