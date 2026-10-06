import 'package:table_calendar/table_calendar.dart';
import 'package:schoolmate/core/file_path.dart';

import 'widgets/academic_header_card.dart';
import 'widgets/add_event_dialog.dart';
import 'models/calendar_event.dart';

import 'package:intl/intl.dart';

import 'widgets/calendar_cell.dart';
import 'widgets/legend_item.dart';

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
  List<CalendarEvent> _events = [];

  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOn;
  int _selectedAcademicYear = DateTime.now().year;

  @override
  
  List<CalendarEvent> _getEventsForDay(DateTime day) {
    return _events
        .where((e) =>
            (day.isAfter(e.start.subtract(const Duration(days: 1))) &&
             day.isBefore(e.end.add(const Duration(days: 1)))))
        .toList();
  }

  List<Color> _getEventColorsForDay(DateTime day) {
    return _events
        .where(
          (e) =>
              (day.isAfter(e.start.subtract(const Duration(days: 1))) &&
              day.isBefore(e.end.add(const Duration(days: 1)))),
        )
        .map((e) => e.color)
        .toList();
  }

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  Widget _buildAcademicYearSelector({
    required bool isDark,
    required Color borderColor,
  }) {
    final currentYear = DateTime.now().year;
    final years = List<int>.generate(10, (index) => currentYear - 5 + index);

    return DropdownButtonFormField<int>(
      value: _selectedAcademicYear,
      decoration: InputDecoration(
        labelText: 'Academic year',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      dropdownColor: isDark
          ? Theme.of(context).colorScheme.surfaceContainerHighest
          : Theme.of(context).colorScheme.surface,
      items: years
          .map(
            (year) => DropdownMenuItem<int>(
              value: year,
              child: Text('$year–${year + 1}'),
            ),
          )
          .toList(),
      onChanged: (year) {
        if (year != null) {
          setState(() => _selectedAcademicYear = year);
        }
      },
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
                _buildAcademicYearSelector(
                  isDark: isDark,
                  borderColor: borderColor,
                ),
                LegendItem(
                  title: l10n.calendarHoliday,
                  color: const Color(0xFFD32F2F),
                  bgColor: const Color(0xFFFFEBEE),
                ),
                LegendItem(
                  title: l10n.calendarExamPeriod,
                  color: Theme.of(context).colorScheme.primary,
                  bgColor: AppColors.surfaceVerySoftPurple,
                ),
                LegendItem(
                  title: l10n.calendarVacation,
                  color: const Color(0xFFFBC02D),
                  bgColor: const Color(0xFFFFF9C4),
                ),
                LegendItem(
                  title: l10n.calendarEvent,
                  color: Theme.of(context).colorScheme.primary,
                  bgColor: Theme.of(context).colorScheme.primary
                      .withValues(alpha: 0.1),
                ),
                LegendItem(
                  title: l10n.calendarTimetableSkip,
                  color: const Color(0xFFF57C00),
                  bgColor: const Color(0xFFFFE0B2),
                ),
              ],
              action: ElevatedButton.icon(
                onPressed: () {
                  showDialog<CalendarEvent>(
                    context: context,
                    builder: (context) => AddEventDialog(
                      initialStartDate: _rangeStart,
                      initialEndDate: _rangeEnd,
                    ),
                  ).then((event) {
                    if (event != null) {
                      setState(() {
                        _events.add(event);
                        _rangeStart = null;
                        _rangeEnd = null;
                        _selectedDay = null;
                      });
                    }
                  });
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
                        showDialog<CalendarEvent>(
                          context: context,
                          builder: (context) => AddEventDialog(
                            initialStartDate: _rangeStart,
                            initialEndDate: _rangeEnd,
                          ),
                        ).then((event) {
                          if (event != null) {
                            setState(() {
                              _events.add(event);
                              _rangeStart = null;
                              _rangeEnd = null;
                              _selectedDay = null;
                            });
                          }
                        });
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
                          CalendarCell(
                            day: day,
                            isSelected: false,
                            isOutside: false,
                            isToday: false,
                            eventColors: _getEventColorsForDay(day),
                          ),
                      outsideBuilder: (context, day, focusedDay) =>
                          CalendarCell(
                            day: day,
                            isSelected: false,
                            isOutside: true,
                            isToday: false,
                            eventColors: _getEventColorsForDay(day),
                          ),
                      todayBuilder: (context, day, focusedDay) => CalendarCell(
                        day: day,
                        isSelected: false,
                        isOutside: false,
                        isToday: true,
                        eventColors: _getEventColorsForDay(day),
                      ),
                      selectedBuilder: (context, day, focusedDay) =>
                          CalendarCell(
                            day: day,
                            isSelected: true,
                            isOutside: false,
                            isToday: isSameDay(day, DateTime.now()),
                            eventColors: _getEventColorsForDay(day),
                          ),
                      rangeStartBuilder: (context, day, focusedDay) =>
                          CalendarCell(
                            day: day,
                            isSelected: false,
                            isOutside: false,
                            isToday: isSameDay(day, DateTime.now()),
                            isRangeStart: true,
                            eventColors: _getEventColorsForDay(day),
                          ),
                      rangeEndBuilder: (context, day, focusedDay) =>
                          CalendarCell(
                            day: day,
                            isSelected: false,
                            isOutside: false,
                            isToday: isSameDay(day, DateTime.now()),
                            isRangeEnd: true,
                            eventColors: _getEventColorsForDay(day),
                          ),
                      withinRangeBuilder: (context, day, focusedDay) =>
                          CalendarCell(
                            day: day,
                            isSelected: false,
                            isOutside: false,
                            isToday: isSameDay(day, DateTime.now()),
                            isWithinRange: true,
                            eventColors: _getEventColorsForDay(day),
                          ),
                    ),
                  ),
                ],
              ),
            ),
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
                                Wrap(
                                  spacing: 12,
                                  runSpacing: 4,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.label_outline, size: 14, color: event.color),
                                        const SizedBox(width: 4),
                                        Flexible(
                                          child: Text(
                                            event.type,
                                            style: CustomTextStyles.inter(
                                              fontSize: 13,
                                              color: isDark ? AppColors.darkTextSecondary : AppColors.textSecondary,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  })),
          ],
        ),
      ),
    );
  }
}
