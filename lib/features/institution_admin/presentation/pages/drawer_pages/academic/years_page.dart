// ignore_for_file: unnecessary_to_list_in_spreads

import 'package:schoolmate/core/file_path.dart';
import 'package:schoolmate/features/institution_admin/presentation/pages/drawer_pages/academic/widgets/academic_header_card.dart';
import 'package:schoolmate/features/institution_admin/presentation/pages/drawer_pages/academic/widgets/add_year_dialog.dart';
import 'package:schoolmate/features/institution_admin/presentation/pages/drawer_pages/academic/widgets/academic_year_card.dart';
import 'package:schoolmate/features/institution_admin/presentation/pages/drawer_pages/academic/models/academic_year_data.dart';

class YearsPage extends StatefulWidget {
  static String routeName = '/years';

  const YearsPage({super.key});

  @override
  State<YearsPage> createState() => _YearsPageState();
}

class _YearsPageState extends State<YearsPage> {
  // Empty list as requested (no dummy data)
  final List<AcademicYearData> dummyYears = [];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = Theme.of(context).scaffoldBackgroundColor;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: SchoolMateAppBar(
        title: l10n.academicYears,
        subtitle: l10n.academicManagement,
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AcademicHeaderCard(
              title: l10n.academicYears,
              description: l10n.academicYearsDesc,
              badge: l10n.academicManagement,
              icon: Icons.calendar_today_outlined,
              details: const [], // Removed all metrics as requested
              action: FilledButton.icon(
                onPressed: () async {
                  final newYear = await showDialog<AcademicYearData>(
                    context: context,
                    builder: (context) => const AddYearDialog(),
                  );
                  if (newYear != null) {
                    setState(() {
                      dummyYears.insert(0, newYear); // Add to beginning of list
                    });
                  }
                },
                icon: const Icon(Icons.add),
                label: Text(l10n.yearsNewYear),
              ),
            ),
            const SizedBox(height: 24),

            // Render Dynamic Year Cards
            ...dummyYears.asMap().entries.map((entry) {
              final index = entry.key;
              final year = entry.value;
              return AcademicYearCard(
                yearData: year,
                onEdit: (updatedYear) {
                  setState(() {
                    dummyYears[index] = updatedYear;
                  });
                },
                onDelete: () {
                  setState(() {
                    dummyYears.removeAt(index);
                  });
                },
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
