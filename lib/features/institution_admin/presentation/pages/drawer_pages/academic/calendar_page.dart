import 'package:table_calendar/table_calendar.dart';
import 'package:schoolmate/core/file_path.dart';
import 'package:intl/intl.dart';
import 'package:schoolmate/features/institution_admin/presentation/widgets/add_event_dialog.dart';
import 'package:schoolmate/features/institution_admin/presentation/widgets/school_mate_app_bar.dart';
import 'package:schoolmate/features/institution_admin/presentation/widgets/app_drawer.dart';
import 'package:schoolmate/features/institution_admin/presentation/pages/drawer_pages/academic/widgets/academic_header_card.dart';

class CalendarPage extends StatefulWidget {
  static const String routeName = '/calendar';

  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOn;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  Widget _buildLegendItem(String title, Color color, Color bgColor) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.only(right: 12, bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isDark ? color.withValues(alpha: 0.16) : bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: CustomTextStyles.inter(
              color: isDark ? Theme.of(context).colorScheme.onSurface : color,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarCell(
    DateTime day,
    bool isSelected,
    bool isOutside,
    bool isToday,
    BuildContext context, {
    bool isWithinRange = false,
    bool isRangeStart = false,
    bool isRangeEnd = false,
  }) {
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
        child: Align(
          alignment: Alignment.topLeft,
          child: Container(
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
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final theme = Theme.of(context);
    final Color borderColor = theme.colorScheme.outlineVariant;
    final Color calendarViewBackground = isDark
        ? theme.colorScheme.surfaceContainerHighest
        : theme.colorScheme.primary.withValues(alpha: 0.04);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: SchoolMateAppBar(
        title: l10n.calendarTitle,
        subtitle: l10n.calendarSubtitle,
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AcademicHeaderCard(
              title: l10n.calendarTitle,
              description: l10n.calendarSubtitle,
              badge: l10n.academicManagement,
              icon: Icons.calendar_month_outlined,
              details: [
                _buildAcademicYearSelector(context, l10n, isDark, borderColor),
                _buildLegendItem(
                  l10n.calendarHoliday,
                  const Color(0xFFD32F2F),
                  const Color(0xFFFFEBEE),
                ),
                _buildLegendItem(
                  l10n.calendarExamPeriod,
                  Theme.of(context).colorScheme.primary,
                  AppColors.surfaceVerySoftPurple,
                ),
                _buildLegendItem(
                  l10n.calendarVacation,
                  const Color(0xFFFBC02D),
                  const Color(0xFFFFF9C4),
                ),
                _buildLegendItem(
                  l10n.calendarEvent,
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                ),
                _buildLegendItem(
                  l10n.calendarTimetableSkip,
                  const Color(0xFFF57C00),
                  const Color(0xFFFFE0B2),
                ),
              ],
              action: ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AddEventDialog(
                      initialStartDate: _rangeStart ?? _selectedDay,
                      initialEndDate: _rangeEnd ?? _selectedDay,
                    ),
                  );
                },
                icon: const Icon(Icons.add),
                label: Text(l10n.calendarAddEvent),
              ),
            ),
            const SizedBox(height: 20),
            // Month Navigator & Calendar Grid Container
            Container(
              decoration: BoxDecoration(
                color: calendarViewBackground,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: borderColor),
                boxShadow: [
                  BoxShadow(
                    color: isDark
                        ? Colors.black26
                        : Theme.of(context).colorScheme.primary
                              .withValues(alpha: 0.04),
                    blurRadius: 15,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  // Header
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 12.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.chevron_left),
                          onPressed: () {
                            setState(() {
                              _focusedDay = DateTime(
                                _focusedDay.year,
                                _focusedDay.month - 1,
                              );
                            });
                          },
                        ),
                        Text(
                          DateFormat.yMMMM().format(_focusedDay),
                          style: CustomTextStyles.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: isDark
                                ? AppColors.white
                                : AppColors.textPrimary,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.chevron_right),
                          onPressed: () {
                            setState(() {
                              _focusedDay = DateTime(
                                _focusedDay.year,
                                _focusedDay.month + 1,
                              );
                            });
                          },
                        ),
                      ],
                    ),
                  ),

                  // Calendar
                  TableCalendar(
                    firstDay: DateTime.utc(2000, 1, 1),
                    lastDay: DateTime.utc(2100, 12, 31),
                    focusedDay: _focusedDay,
                    selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                    rangeStartDay: _rangeStart,
                    rangeEndDay: _rangeEnd,
                    rangeSelectionMode: _rangeSelectionMode,
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _focusedDay = focusedDay;
                        _selectedDay = null;

                        if (_rangeStart == null) {
                          // First tap: set start
                          _rangeStart = selectedDay;
                          _rangeEnd = null;
                        } else if (_rangeStart != null && _rangeEnd == null) {
                          // Second tap: set end
                          if (selectedDay.isBefore(_rangeStart!)) {
                            _rangeStart = selectedDay;
                          } else {
                            _rangeEnd = selectedDay;
                          }
                        } else {
                          // Reset and start new range
                          _rangeStart = selectedDay;
                          _rangeEnd = null;
                        }
                      });

                      if (_rangeStart != null && _rangeEnd != null) {
                        showDialog(
                          context: context,
                          builder: (context) => AddEventDialog(
                            initialStartDate: _rangeStart,
                            initialEndDate: _rangeEnd,
                          ),
                        );
                      }
                    },
                    // onRangeSelected is no longer needed since we handle range logic in onDaySelected manually
                    onRangeSelected: null,
                    onPageChanged: (focusedDay) {
                      setState(() {
                        _focusedDay = focusedDay;
                      });
                    },
                    headerVisible: false,
                    daysOfWeekHeight: 40,
                    rowHeight: 65,
                    calendarBuilders: CalendarBuilders(
                      dowBuilder: (context, day) {
                        final text = DateFormat.E().format(day);
                        return Container(
                          decoration: BoxDecoration(
                            color: calendarViewBackground,
                            border: Border(
                              bottom: BorderSide(
                                color: borderColor,
                                width: 1.0,
                              ),
                              right: BorderSide(color: borderColor, width: 0.5),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            text.toUpperCase(),
                            style: CustomTextStyles.inter(
                              color: isDark
                                  ? AppColors.darkTextSecondary
                                  : AppColors.textSecondary,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              letterSpacing: 1.2,
                            ),
                          ),
                        );
                      },
                      defaultBuilder: (context, day, focusedDay) =>
                          _buildCalendarCell(day, false, false, false, context),
                      outsideBuilder: (context, day, focusedDay) =>
                          _buildCalendarCell(day, false, true, false, context),
                      todayBuilder: (context, day, focusedDay) =>
                          _buildCalendarCell(day, false, false, true, context),
                      selectedBuilder: (context, day, focusedDay) =>
                          _buildCalendarCell(
                            day,
                            true,
                            false,
                            isSameDay(day, DateTime.now()),
                            context,
                          ),
                      rangeStartBuilder: (context, day, focusedDay) =>
                          _buildCalendarCell(
                            day,
                            false,
                            false,
                            isSameDay(day, DateTime.now()),
                            context,
                            isRangeStart: true,
                          ),
                      rangeEndBuilder: (context, day, focusedDay) =>
                          _buildCalendarCell(
                            day,
                            false,
                            false,
                            isSameDay(day, DateTime.now()),
                            context,
                            isRangeEnd: true,
                          ),
                      withinRangeBuilder: (context, day, focusedDay) =>
                          _buildCalendarCell(
                            day,
                            false,
                            false,
                            isSameDay(day, DateTime.now()),
                            context,
                            isWithinRange: true,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAcademicYearSelector(
    BuildContext context,
    AppLocalizations l10n,
    bool isDark,
    Color borderColor,
  ) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            l10n.calendarAcademicYear,
            style: CustomTextStyles.inter(
              color: isDark
                  ? AppColors.darkTextSecondary
                  : AppColors.textSecondary,
              fontSize: 14,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            '2026',
            style: CustomTextStyles.inter(
              color: theme.colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: AppColors.successGreen,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              l10n.yearsLowercaseActive,
              style: CustomTextStyles.inter(
                color: AppColors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Icon(
            Icons.keyboard_arrow_down,
            size: 16,
            color: isDark
                ? AppColors.darkTextSecondary
                : AppColors.textSecondary,
          ),
        ],
      ),
    );
  }
}
