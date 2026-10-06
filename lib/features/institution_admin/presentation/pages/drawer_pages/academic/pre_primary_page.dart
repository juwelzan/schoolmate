import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';
import 'package:schoolmate/features/institution_admin/presentation/pages/drawer_pages/academic/widgets/academic_header_card.dart';

class PrePrimaryPage extends StatelessWidget {
  static const String routeName = '/pre-primary';

  const PrePrimaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Pre-Primary",
        subtitle: "Academic Management",
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AcademicHeaderCard(
              title: "Pre-Primary",
              description: "Academic Management",
            ),
            const SizedBox(height: 24),
            Center(
              child: Text(
                "Pre-Primary Page - Coming Soon",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
