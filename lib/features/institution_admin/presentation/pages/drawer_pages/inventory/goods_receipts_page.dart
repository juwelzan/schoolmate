import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class GoodsReceiptsPage extends StatelessWidget {
  static const String routeName = '/goods-receipts';

  const GoodsReceiptsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Goods Receipts",
        subtitle: "Inventory Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "Goods Receipts Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
