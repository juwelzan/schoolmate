import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class NewVoucherPage extends StatelessWidget {
  static const String routeName = '/new-voucher';

  const NewVoucherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "New Voucher",
        subtitle: "Finance Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "New Voucher Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
