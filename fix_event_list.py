import re

file_path = "lib/features/institution_admin/presentation/pages/drawer_pages/academic/calendar_page.dart"
with open(file_path, "r") as f:
    content = f.read()

# Add a helper function to get events for a day
events_func = """
  List<CalendarEvent> _getEventsForDay(DateTime day) {
    return _events
        .where((e) =>
            (day.isAfter(e.start.subtract(const Duration(days: 1))) &&
             day.isBefore(e.end.add(const Duration(days: 1)))))
        .toList();
  }
"""
if "_getEventsForDay" not in content:
    content = content.replace("List<Color> _getEventColorsForDay", events_func + "\n  List<Color> _getEventColorsForDay")

# Find the end of the TableCalendar Column and add the events list UI
# It ends at:
#                   ),
#                 ],
#               ),
#             ),
#           ],
#         ),

list_ui = """
            const SizedBox(height: 24),
            Text(
              l10n.calendarEvent,
              style: CustomTextStyles.inter(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDark ? AppColors.white : AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            ...(_getEventsForDay(_rangeStart ?? _focusedDay).isEmpty
                ? [
                    Container(
                      padding: const EdgeInsets.all(24),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isDark ? Theme.of(context).colorScheme.surfaceContainerHighest : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: borderColor),
                      ),
                      child: Text(
                        "No events for this day",
                        style: CustomTextStyles.inter(
                          color: isDark ? AppColors.darkTextMuted : AppColors.textMuted,
                        ),
                      ),
                    )
                  ]
                : _getEventsForDay(_rangeStart ?? _focusedDay).map((event) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isDark ? Theme.of(context).colorScheme.surfaceContainerHighest : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: borderColor),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 12,
                            height: 40,
                            decoration: BoxDecoration(
                              color: event.color,
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  event.title,
                                  style: CustomTextStyles.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isDark ? AppColors.white : AppColors.textPrimary,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Icon(Icons.label_outline, size: 14, color: event.color),
                                    const SizedBox(width: 4),
                                    Text(
                                      event.type,
                                      style: CustomTextStyles.inter(
                                        fontSize: 13,
                                        color: isDark ? AppColors.darkTextSecondary : AppColors.textSecondary,
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Icon(Icons.calendar_today_outlined, size: 14, color: isDark ? AppColors.darkTextSecondary : AppColors.textSecondary),
                                    const SizedBox(width: 4),
                                    Text(
                                      "${event.start.day}/${event.start.month}/${event.start.year} - ${event.end.day}/${event.end.month}/${event.end.year}",
                                      style: CustomTextStyles.inter(
                                        fontSize: 13,
                                        color: isDark ? AppColors.darkTextSecondary : AppColors.textSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  })),
"""

# Replace in content
content = re.sub(
    r'(\s*)\],\s*\),\s*\),\s*\]\,\s*\)\,\s*\)\;\s*\}\s*\}',
    r'\1],\n              ),\n            ),\n' + list_ui + r'\n          ],\n        ),\n      ),\n    );\n  }\n}',
    content
)

with open(file_path, "w") as f:
    f.write(content)
