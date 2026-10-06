import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';
import '../models/section_model.dart';


class SectionCard extends StatelessWidget {
  final SectionModel section;
  final bool isDark;
  final Color activeColor;
  final Color borderColor;
  final Color mutedTextColor;

  const SectionCard({
    super.key,
    required this.section,
    required this.isDark,
    required this.activeColor,
    required this.borderColor,
    required this.mutedTextColor,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Card(
      color: isDark ? Colors.black87 : Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: borderColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          section.toString(),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: activeColor,
          ),
        ),
      ),
    );
  }
}
