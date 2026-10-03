import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class NewDebitCreditNotePage extends StatelessWidget {
  static const String routeName = '/new-debit-credit-note';

  const NewDebitCreditNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "New Debit/Credit Note",
        subtitle: "Finance Management",
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("New Debit/Credit Note Page - Coming Soon", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
      ),
    );
  }
}
