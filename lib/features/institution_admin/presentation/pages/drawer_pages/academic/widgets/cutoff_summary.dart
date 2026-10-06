import 'package:schoolmate/core/file_path.dart';

class CutoffSummary extends StatelessWidget {
  final List grades;
  final Color surface;
  final Color borderColor;
  final Color mutedTextColor;

  const CutoffSummary({
    super.key,
    required this.grades,
    required this.surface,
    required this.borderColor,
    required this.mutedTextColor,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

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
}
