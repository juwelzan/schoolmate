import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';
import 'package:schoolmate/features/institution_admin/presentation/pages/drawer_pages/academic/widgets/academic_header_card.dart';

class SubjectsPage extends StatelessWidget {
  static const String routeName = '/subjects';

  const SubjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Subjects",
        subtitle: "Academic Management",
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AcademicHeaderCard(
              title: "Subjects",
              description: "Academic Management",
            ),
            const SizedBox(height: 24),
            Center(
              child: Text(
                "Subjects Page - Coming Soon",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
