import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class CalendarCell extends StatelessWidget {
  final DateTime day;
  final bool isSelected;
  final bool isOutside;
  final bool isToday;
  final bool isWithinRange;
  final bool isRangeStart;
  final bool isRangeEnd;
  final List<Color> eventColors;

  const CalendarCell({
    super.key,
    required this.day,
    required this.isSelected,
    required this.isOutside,
    required this.isToday,
    this.isWithinRange = false,
    this.isRangeStart = false,
    this.isRangeEnd = false,
    this.eventColors = const [],
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final theme = Theme.of(context);
    final Color borderColor = theme.colorScheme.outlineVariant;
    final Color textColor = isOutside
        ? (isDark ? AppColors.darkTextMuted : AppColors.textMuted)
        : theme.colorScheme.onSurface;

    Color bgColor = isOutside
        ? (isDark ? AppColors.darkSurfaceHighlight : const Color(0xFFF9FAFB))
        : Colors.transparent;

    if (isWithinRange) {
      bgColor = theme.colorScheme.primary.withValues(alpha: 0.1);
    }

    final bool isHighlight = isSelected || isRangeStart || isRangeEnd;

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        border: Border(
          right: BorderSide(color: borderColor, width: 0.5),
          bottom: BorderSide(color: borderColor, width: 0.5),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          border: isHighlight
              ? Border.all(color: theme.colorScheme.primary, width: 2.0)
              : null,
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: isHighlight
                    ? theme.colorScheme.primary
                    : Colors.transparent,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                '${day.day}',
                style: CustomTextStyles.inter(
                  color: isHighlight
                      ? theme.colorScheme.onPrimary
                      : (isWithinRange ? theme.colorScheme.primary : textColor),
                  fontWeight: isHighlight || isToday
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ),
            if (eventColors.isNotEmpty)
              Expanded(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: eventColors.map((color) => Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                      ),
                    )).toList(),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
