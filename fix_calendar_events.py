import re

file_path = "lib/features/institution_admin/presentation/pages/drawer_pages/academic/calendar_page.dart"
with open(file_path, "r") as f:
    content = f.read()

# Add import for calendar_event.dart
import_str = "import 'models/calendar_event.dart';\n"
if "models/calendar_event.dart" not in content:
    content = content.replace("import 'widgets/add_event_dialog.dart';", "import 'widgets/add_event_dialog.dart';\n" + import_str)

# Add _events state variable
state_var = "List<CalendarEvent> _events = [];\n"
if state_var not in content:
    content = re.sub(
        r'DateTime\? _rangeEnd;',
        r'DateTime? _rangeEnd;\n  ' + state_var,
        content
    )

# Get events for a day
events_func = """
  List<Color> _getEventColorsForDay(DateTime day) {
    return _events
        .where((e) =>
            (day.isAfter(e.start.subtract(const Duration(days: 1))) &&
             day.isBefore(e.end.add(const Duration(days: 1)))))
        .map((e) => e.color)
        .toList();
  }
"""
if "_getEventColorsForDay" not in content:
    content = re.sub(
        r'void initState\(\) \{',
        events_func + '\n  @override\n  void initState() {',
        content
    )

# Await showDialog and add to _events
dialog_show = """                      if (_rangeStart != null && _rangeEnd != null) {
                        showDialog(
                          context: context,
                          builder: (context) => AddEventDialog(
                            initialStartDate: _rangeStart,
                            initialEndDate: _rangeEnd,
                          ),
                        ).then((event) {
                          if (event != null && event isinstance CalendarEvent) {
                            setState(() {
                              _events.add(event);
                              _rangeStart = null;
                              _rangeEnd = null;
                              _selectedDay = null;
                            });
                          }
                        });
                      }"""

# Actually, I should just regex the existing showDialog block.
content = re.sub(
    r'showDialog\(\s*context:\s*context,\s*builder:\s*\(context\)\s*=>\s*AddEventDialog\([\s\S]*?\),\s*\);',
    r'''showDialog<CalendarEvent>(
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
                        });''',
    content
)

# Replace CalendarCell calls to include eventColors
content = re.sub(
    r'_buildCalendarCell\(day,\s*false,\s*false,\s*false,\s*context\)',
    r'CalendarCell(day: day, isSelected: false, isOutside: false, isToday: false, eventColors: _getEventColorsForDay(day))',
    content
)
content = re.sub(
    r'_buildCalendarCell\(day,\s*false,\s*true,\s*false,\s*context\)',
    r'CalendarCell(day: day, isSelected: false, isOutside: true, isToday: false, eventColors: _getEventColorsForDay(day))',
    content
)
content = re.sub(
    r'_buildCalendarCell\(day,\s*false,\s*false,\s*true,\s*context\)',
    r'CalendarCell(day: day, isSelected: false, isOutside: false, isToday: true, eventColors: _getEventColorsForDay(day))',
    content
)
content = re.sub(
    r'_buildCalendarCell\(\s*day,\s*true,\s*false,\s*isSameDay\(day,\s*DateTime.now\(\)\),\s*context,\s*\)',
    r'CalendarCell(day: day, isSelected: true, isOutside: false, isToday: isSameDay(day, DateTime.now()), eventColors: _getEventColorsForDay(day))',
    content
)
content = re.sub(
    r'_buildCalendarCell\(\s*day,\s*false,\s*false,\s*isSameDay\(day,\s*DateTime.now\(\)\),\s*context,\s*isRangeStart:\s*true,\s*\)',
    r'CalendarCell(day: day, isSelected: false, isOutside: false, isToday: isSameDay(day, DateTime.now()), isRangeStart: true, eventColors: _getEventColorsForDay(day))',
    content
)
content = re.sub(
    r'_buildCalendarCell\(\s*day,\s*false,\s*false,\s*isSameDay\(day,\s*DateTime.now\(\)\),\s*context,\s*isRangeEnd:\s*true,\s*\)',
    r'CalendarCell(day: day, isSelected: false, isOutside: false, isToday: isSameDay(day, DateTime.now()), isRangeEnd: true, eventColors: _getEventColorsForDay(day))',
    content
)
content = re.sub(
    r'_buildCalendarCell\(\s*day,\s*false,\s*false,\s*isSameDay\(day,\s*DateTime.now\(\)\),\s*context,\s*isWithinRange:\s*true,\s*\)',
    r'CalendarCell(day: day, isSelected: false, isOutside: false, isToday: isSameDay(day, DateTime.now()), isWithinRange: true, eventColors: _getEventColorsForDay(day))',
    content
)

with open(file_path, "w") as f:
    f.write(content)
