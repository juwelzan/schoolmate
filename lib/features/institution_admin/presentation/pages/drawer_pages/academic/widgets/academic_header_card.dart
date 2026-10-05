import 'package:flutter/material.dart';
import 'package:schoolmate/core/theme/app_colors.dart';

class AcademicHeaderCard extends StatelessWidget {
  const AcademicHeaderCard({
    required this.title,
    required this.description,
    this.badge,
    this.icon = Icons.school_outlined,
    this.details = const [],
    this.action,
    super.key,
  });

  final String title;
  final String description;
  final String? badge;
  final IconData icon;
  final List<Widget> details;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isDark
            ? colorScheme.surfaceContainerHighest
            : colorScheme.primary.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark
              ? colorScheme.outlineVariant
              : colorScheme.primary.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (badge != null) ...[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: colorScheme.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, size: 16, color: colorScheme.primary),
                  const SizedBox(width: 8),
                  Text(
                    badge!,
                    style: TextStyle(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
          Text(
            title,
            style: theme.textTheme.titleLarge?.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            description,
            style: theme.textTheme.bodyMedium?.copyWith(height: 1.45),
          ),
          if (details.isNotEmpty || action != null) ...[
            const SizedBox(height: 20),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [...details, ?action],
            ),
          ],
        ],
      ),
    );
  }
}

class AcademicHeaderMetric extends StatelessWidget {
  const AcademicHeaderMetric({
    required this.label,
    this.isPositive = false,
    super.key,
  });

  final String label;
  final bool isPositive;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;
    final metricColor = isPositive
        ? (isDark ? AppColors.darkBadgeTealText : AppColors.successGreen)
        : colorScheme.onSurface;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: isPositive
            ? metricColor.withValues(alpha: isDark ? 0.16 : 0.1)
            : colorScheme.surface,
        border: Border.all(
          color: isPositive
              ? metricColor.withValues(alpha: 0.32)
              : colorScheme.outlineVariant,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: metricColor,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
    );
  }
}
