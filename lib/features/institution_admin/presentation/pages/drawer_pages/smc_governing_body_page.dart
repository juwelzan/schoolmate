import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class SmcGoverningBodyPage extends StatelessWidget {
  static const String routeName = '/smc-governing-body';

  const SmcGoverningBodyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: SchoolMateAppBar(
        title: l10n.smcBodyTitle,
        subtitle: l10n.smcBodySubtitle,
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "SMC / Governing Body",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Rakib School",
                        style: TextStyle(
                          fontSize: 14,
                          color:
                              Theme.of(context).textTheme.bodyMedium?.color ??
                              AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add, size: 18, color: AppColors.white),
                  label: Text(
                    l10n.smcBodyAdd,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryPurple,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                ),
              ],
            ),

            // Centered Empty State
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? AppColors.darkSurface
                            : AppColors.surfaceVerySoftPurple,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.groups_outlined,
                        size: 48,
                        color: AppColors.primaryPurple,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      l10n.smcBodyNoData,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color:
                            Theme.of(context).textTheme.bodyMedium?.color ??
                            AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
