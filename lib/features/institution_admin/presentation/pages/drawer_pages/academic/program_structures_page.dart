import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

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
    final Color btnBgColor = Theme.of(context).colorScheme.primary;

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
            // Top Header: Description and Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    l10n.programStructuresDescription,
                    style: CustomTextStyles.inter(
                      color: mutedTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: btnBgColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.add, color: AppColors.white, size: 18),
                        const SizedBox(width: 8),
                        Text(
                          l10n.programStructuresNew,
                          style: CustomTextStyles.inter(
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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
