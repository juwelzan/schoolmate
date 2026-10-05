import 'package:schoolmate/core/file_path.dart';
import 'package:schoolmate/features/institution_admin/presentation/pages/drawer_pages/academic/widgets/academic_header_card.dart';
import 'package:schoolmate/features/institution_admin/presentation/widgets/school_mate_app_bar.dart';
import 'package:schoolmate/features/institution_admin/presentation/widgets/app_drawer.dart';

class ShiftsPage extends StatelessWidget {
  static const String routeName = '/shifts';

  const ShiftsPage({super.key});

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
        title: l10n.shiftsPageTitle,
        subtitle: l10n.shiftsPageSubtitle,
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AcademicHeaderCard(
              title: l10n.shiftsPageTitle,
              description: l10n.shiftsPageDescription,
              action: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: Text(l10n.shiftsPageNewShift),
              ),
            ),

            const Expanded(child: SizedBox(height: 24)),

            // Empty State
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: mutedTextColor, width: 3.0),
                    ),
                    child: Icon(
                      Icons.schedule,
                      size: 32,
                      color: mutedTextColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    l10n.shiftsPageEmptyState,
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
