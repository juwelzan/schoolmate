import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';
import 'package:schoolmate/features/institution_admin/presentation/pages/drawer_pages/academic/widgets/academic_header_card.dart';

class StudyPlansPage extends StatelessWidget {
  static const String routeName = '/study-plans';

  const StudyPlansPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "Study Plans",
        subtitle: "Academic Management",
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AcademicHeaderCard(
              title: "Study Plans",
              description: "Academic Management",
            ),
            const SizedBox(height: 24),
            Center(
              child: Text(
                "Study Plans Page - Coming Soon",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
