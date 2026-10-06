import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class CollectPaymentPage extends StatelessWidget {
  static const String routeName = '/collect-payment';

  const CollectPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Collect Payment",
        subtitle: "Fee Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Collect Payment Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
