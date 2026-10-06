import 'package:schoolmate/core/file_path.dart';
import 'package:schoolmate/features/institution_admin/presentation/pages/drawer_pages/academic/widgets/academic_header_card.dart';

class ProgramStructuresPage extends StatelessWidget {
  static const String routeName = '/program-structures';

  const ProgramStructuresPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    final Color bgColor = Theme.of(context).scaffoldBackgroundColor;
    final Color mutedTextColor = isDark
        ? AppColors.darkTextSecondary
        : Theme.of(context).colorScheme.onSurfaceVariant;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: SchoolMateAppBar(
        title: l10n.programStructuresTitle,
        subtitle: l10n.programStructuresSubtitle,
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AcademicHeaderCard(
              title: l10n.programStructuresTitle,
              description: l10n.programStructuresDescription,
              action: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: Text(l10n.programStructuresNew),
              ),
            ),

            const Expanded(child: SizedBox(height: 24)),

            // Empty State
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.menu_book, size: 64, color: mutedTextColor),
                  const SizedBox(height: 16),
                  Text(
                    l10n.programStructuresEmpty,
                    style: CustomTextStyles.inter(
                      color: mutedTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const Expanded(child: SizedBox(height: 24)),
          ],
        ),
      ),
    );
  }
}
