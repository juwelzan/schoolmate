import 'package:schoolmate/core/file_path.dart';
import 'package:schoolmate/features/institution_admin/presentation/pages/drawer_pages/academic/widgets/academic_header_card.dart';
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
    final Color cardBackground = isDark
        ? const Color(0xFF111827)
        : Theme.of(context).colorScheme.surface;
    final Color tableBackground = isDark
        ? const Color(0xFF0B1220)
        : Theme.of(context).colorScheme.surfaceContainerLow;
    final Color cardBorder = isDark
        ? const Color(0xFF253044)
        : Theme.of(context).colorScheme.outlineVariant;

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
            AcademicHeaderCard(
              title: l10n.gradingScalesTitle,
              description: l10n.gradingScalesDescription,
              action: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: Text(l10n.gradingScalesNew),
              ),
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
                        color: cardBackground,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: cardBorder),
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
                                        fontSize: 17,
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
                                            color: Theme.of(context)
                                                .colorScheme
                                                .outlineVariant,
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
                          const SizedBox(height: 14),
                          // Description
                          Text(
                            scale['desc'] as String,
                            style: CustomTextStyles.inter(
                              color: mutedTextColor,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 14),
                          _buildCutoffSummary(
                            context,
                            scale['grades'] as List,
                            tableBackground,
                            cardBorder,
                            mutedTextColor,
                            isDark,
                          ),
                          const SizedBox(height: 14),
                          _buildGradeMatrix(
                            context,
                            scale['grades'] as List,
                            tableBackground,
                            cardBorder,
                            mutedTextColor,
                            isDark,
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

  Widget _buildCutoffSummary(
    BuildContext context,
    List grades,
    Color surface,
    Color borderColor,
    Color mutedTextColor,
    bool isDark,
  ) {
    final passGrade = grades.cast<Map<String, dynamic>>().firstWhere(
      (grade) => !(grade['label'] as String).startsWith('F '),
    );
    final passLabel = passGrade['label'] as String;
    final passMarks = passLabel.split('(').last.split('·').first.trim();
    final colors = grades
        .cast<Map<String, dynamic>>()
        .map((grade) => grade['color'] as Color)
        .toList();

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            runSpacing: 8,
            children: [
              Text(
                '0% Fail',
                style: CustomTextStyles.inter(
                  color: mutedTextColor,
                  fontSize: 11,
                ),
              ),
              Text(
                '$passMarks Pass Bar',
                style: CustomTextStyles.inter(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Grade scale',
                style: CustomTextStyles.inter(
                  color: mutedTextColor,
                  fontSize: 11,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              height: 8,
              child: Row(
                children: colors
                    .map((color) => Expanded(child: ColoredBox(color: color)))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGradeMatrix(
    BuildContext context,
    List grades,
    Color surface,
    Color borderColor,
    Color mutedTextColor,
    bool isDark,
  ) {
    final headingStyle = CustomTextStyles.inter(
      color: mutedTextColor,
      fontSize: 10,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.7,
    );
    return Container(
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: borderColor),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
            child: Row(
              children: [
                Expanded(flex: 2, child: Text('GRADE', style: headingStyle)),
                Expanded(flex: 3, child: Text('MARKS', style: headingStyle)),
                Expanded(flex: 1, child: Text('GPA', style: headingStyle)),
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text('REMARKS', style: headingStyle),
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: borderColor),
          ...grades.cast<Map<String, dynamic>>().map((grade) {
            final label = grade['label'] as String;
            final parsed = _parseGrade(label);
            final color = grade['color'] as Color;
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: borderColor)),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 9,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Text(
                          parsed.$1,
                          style: CustomTextStyles.inter(
                            color: AppColors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      parsed.$2,
                      style: CustomTextStyles.inter(
                        color: isDark ? AppColors.white : AppColors.textPrimary,
                        fontSize: 11,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      parsed.$3,
                      style: CustomTextStyles.inter(
                        color: color,
                        fontWeight: FontWeight.w800,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        _gradeRemark(parsed.$1),
                        textAlign: TextAlign.right,
                        style: CustomTextStyles.inter(
                          color: color,
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  (String, String, String) _parseGrade(String label) {
    final openParenthesis = label.indexOf('(');
    final closeParenthesis = label.lastIndexOf(')');
    if (openParenthesis < 0 || closeParenthesis < openParenthesis) {
      return (label, '', '');
    }
    final grade = label.substring(0, openParenthesis).trim();
    final values = label
        .substring(openParenthesis + 1, closeParenthesis)
        .split('·')
        .map((value) => value.trim())
        .toList();
    return (grade, values.first, values.length > 1 ? values[1] : '');
  }

  String _gradeRemark(String grade) {
    switch (grade) {
      case 'A+':
        return 'Outstanding';
      case 'A':
        return 'Excellent';
      case 'A-':
        return 'Very Good';
      case 'B':
      case 'B+':
      case 'B-':
        return 'Good';
      case 'C':
      case 'C+':
        return 'Satisfactory';
      case 'D':
        return 'Pass';
      case 'F':
        return 'Fail / Retake';
      default:
        return grade;
    }
  }
}
