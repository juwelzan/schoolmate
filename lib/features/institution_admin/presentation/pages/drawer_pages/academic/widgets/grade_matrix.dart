import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class GradeMatrix extends StatelessWidget {
  final List grades;
  final Color tableBackground;
  final Color cardBorder;
  final Color textPrimary;
  final Color mutedTextColor;
  final bool isDark;

  const GradeMatrix({
    super.key,
    required this.grades,
    required this.tableBackground,
    required this.cardBorder,
    required this.textPrimary,
    required this.mutedTextColor,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final headingStyle = CustomTextStyles.inter(
      color: mutedTextColor,
      fontSize: 10,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.7,
    );
    return Container(
      decoration: BoxDecoration(
        color: tableBackground,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: cardBorder),
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
          Divider(height: 1, color: cardBorder),
          ...grades.cast<Map<String, dynamic>>().map((grade) {
            final label = grade['label'] as String;
            final parsed = _parseGrade(label);
            final color = grade['color'] as Color;
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: cardBorder)),
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
    final gradeMatch = RegExp(r'\b[A-F][+-]?\b', caseSensitive: false)
        .firstMatch(label);
    final marksMatch = RegExp(
      r'\d+(?:\.\d+)?\s*[-–]\s*\d+(?:\.\d+)?%?',
    ).firstMatch(label);
    final numbers = RegExp(r'\d+(?:\.\d+)?')
        .allMatches(label)
        .map((match) => match.group(0)!)
        .toList();

    final grade = gradeMatch?.group(0) ?? label.trim();
    final marks = marksMatch?.group(0)?.replaceAll(RegExp(r'\s+'), '') ?? '—';
    final gpa = numbers.isEmpty ? '—' : numbers.last;

    return (grade, marks, gpa);
  }

  String _gradeRemark(String grade) {
    switch (grade.toUpperCase().replaceAll(RegExp(r'[+-]'), '')) {
      case 'A':
        return 'Excellent';
      case 'B':
        return 'Very Good';
      case 'C':
        return 'Good';
      case 'D':
        return 'Pass';
      case 'F':
        return 'Fail';
      default:
        return '—';
    }
  }
}
