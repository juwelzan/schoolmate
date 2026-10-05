import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';
import 'package:schoolmate/features/institution_admin/presentation/widgets/school_mate_app_bar.dart';
import 'package:schoolmate/features/institution_admin/presentation/widgets/app_drawer.dart';

class GradingScalesPage extends StatelessWidget {
  static const String routeName = '/grading-scales';

  const GradingScalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    final Color bgColor = Theme.of(context).scaffoldBackgroundColor;
    final Color mutedTextColor = isDark
        ? AppColors.darkTextSecondary
        : Theme.of(context).colorScheme.onSurfaceVariant;
    final Color btnBgColor = Theme.of(context).colorScheme.primary;

    final dummyScales = [
      {
        'titleEn': 'BD 5.0 (SSC/HSC/Dakhil/Alim)',
        'titleBn': 'বিডি ৫.০ (এসএসসি/এইচএসসি/দাখিল/আলিম)',
        'desc': 'Board-mandated Bangladesh 5-point GPA scale for SSC/HSC/Dakhil/Alim.',
        'isPreset': true,
        'grades': [
          {'label': 'A+ (80–100% · 5)', 'color': const Color(0xFF1EA94C)},
          {'label': 'A (70–79.99% · 4)', 'color': const Color(0xFF1EA94C)},
          {'label': 'A- (60–69.99% · 3.5)', 'color': const Color(0xFF5AB613)},
          {'label': 'B (50–59.99% · 3)', 'color': const Color(0xFFF3B400)},
          {'label': 'C (40–49.99% · 2)', 'color': const Color(0xFFF47920)},
          {'label': 'D (33–39.99% · 1)', 'color': const Color(0xFFF47920)},
          {'label': 'F (0–32.99% · 0)', 'color': const Color(0xFFDA291C)},
        ],
      },
      {
        'titleEn': 'Descriptive (Pre-Primary)',
        'titleBn': 'বর্ণনামূলক (প্রাক-প্রাথমিক)',
        'desc': 'Descriptive performance bands for pre-primary levels — no student is failed.',
        'isPreset': true,
        'grades': [
          {
            'label': 'Excellent (90–100% · 4)',
            'color': const Color(0xFF1EA94C),
          },
          {
            'label': 'Very Good (75–89.99% · 3)',
            'color': const Color(0xFF1EA94C),
          },
          {'label': 'Good (60–74.99% · 2)', 'color': const Color(0xFFF3B400)},
          {
            'label': 'Satisfactory (40–59.99% · 1)',
            'color': const Color(0xFFF47920),
          },
          {
            'label': 'Needs Improvement (0–39.99% · 0)',
            'color': const Color(0xFFDA291C),
          },
        ],
      },
      {
        'titleEn': 'University 4.0',
        'titleBn': 'বিশ্ববিদ্যালয় ৪.০',
        'desc': 'UGC-style 4-point CGPA scale for degree/honours programs.',
        'isPreset': true,
        'grades': [
          {'label': 'A+ (80–100% · 4)', 'color': const Color(0xFF1EA94C)},
          {'label': 'A (75–79.99% · 3.75)', 'color': const Color(0xFF1EA94C)},
          {'label': 'A- (70–74.99% · 3.5)', 'color': const Color(0xFF5AB613)},
          {'label': 'B+ (65–69.99% · 3.25)', 'color': const Color(0xFF9CCC65)},
          {'label': 'B (60–64.99% · 3)', 'color': const Color(0xFFF3B400)},
          {'label': 'B- (55–59.99% · 2.75)', 'color': const Color(0xFFF3B400)},
          {'label': 'C+ (50–54.99% · 2.5)', 'color': const Color(0xFFF47920)},
          {'label': 'C (45–49.99% · 2.25)', 'color': const Color(0xFFF47920)},
          {'label': 'D (40–44.99% · 2)', 'color': const Color(0xFFF47920)},
          {'label': 'F (0–39.99% · 0)', 'color': const Color(0xFFDA291C)},
        ],
      },
    ];

    return Scaffold(
      backgroundColor: bgColor,
      appBar: SchoolMateAppBar(
        title: l10n.gradingScalesTitle,
        subtitle: l10n.gradingScalesSubtitle,
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
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
                    l10n.gradingScalesDescription,
                    style: CustomTextStyles.inter(
                      color: mutedTextColor,
                      fontSize: 14,
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
                          l10n.gradingScalesNew,
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
            const SizedBox(height: 24),

            // Grid of Cards
            LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = constraints.maxWidth > 900 ? 2 : 1;
                final double cardWidth =
                    (constraints.maxWidth - (crossAxisCount - 1) * 24) /
                    crossAxisCount;

                return Wrap(
                  spacing: 24,
                  runSpacing: 24,
                  children: dummyScales.map((scale) {
                    return Container(
                      width: cardWidth,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: isDark
                            ? null
                            : [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.04),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Card Header
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 8,
                                  runSpacing: 4,
                                  children: [
                                    Text(
                                      scale['titleEn'] as String,
                                      style: CustomTextStyles.inter(
                                        color: isDark
                                            ? AppColors.white
                                            : AppColors.textPrimary,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      scale['titleBn'] as String,
                                      style: CustomTextStyles.inter(
                                        color: mutedTextColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                    if (scale['isPreset'] == true)
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Theme.of(context).colorScheme.outlineVariant,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.lock_outline,
                                              size: 12,
                                              color: mutedTextColor,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              l10n.gradingScalePreset,
                                              style: CustomTextStyles.inter(
                                                color: mutedTextColor,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.edit_outlined,
                                      size: 20,
                                      color: isDark
                                          ? AppColors.white
                                          : AppColors.textPrimary,
                                    ),
                                    splashRadius: 20,
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(),
                                  ),
                                  const SizedBox(width: 16),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.delete_outline,
                                      size: 20,
                                      color: Color(0xFFF03E3E),
                                    ),
                                    splashRadius: 20,
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          // Description
                          Text(
                            scale['desc'] as String,
                            style: CustomTextStyles.inter(
                              color: mutedTextColor,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Grades Wrap
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: (scale['grades'] as List).map((g) {
                              final grade = g as Map<String, dynamic>;
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: grade['color'] as Color,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Text(
                                  grade['label'] as String,
                                  style: CustomTextStyles.inter(
                                    color: AppColors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
