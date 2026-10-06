import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';
import '../models/calendar_event.dart';

class AddEventDialog extends StatefulWidget {
  final DateTime? initialStartDate;
  final DateTime? initialEndDate;

  const AddEventDialog({super.key, this.initialStartDate, this.initialEndDate});

  @override
  State<AddEventDialog> createState() => _AddEventDialogState();
}

class _AddEventDialogState extends State<AddEventDialog> {
  String? _selectedType;
  late TextEditingController _titleController;
  late TextEditingController _startDateController;
  late TextEditingController _endDateController;
  DateTime? _start;
  DateTime? _end;

  @override
  void initState() {
    super.initState();
    _start = widget.initialStartDate ?? DateTime.now();
    _end = widget.initialEndDate ?? DateTime.now();
    _titleController = TextEditingController();
    _startDateController = TextEditingController(
      text: "${_start!.day.toString().padLeft(2, '0')}/${_start!.month.toString().padLeft(2, '0')}/${_start!.year}",
    );
    _endDateController = TextEditingController(
      text: "${_end!.day.toString().padLeft(2, '0')}/${_end!.month.toString().padLeft(2, '0')}/${_end!.year}",
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  Color _getColorForType(String type, AppLocalizations l10n) {
    if (type == l10n.calendarHoliday) return const Color(0xFFD32F2F);
    if (type == l10n.calendarExamPeriod) return Theme.of(context).colorScheme.primary;
    if (type == l10n.calendarVacation) return const Color(0xFFFBC02D);
    if (type == l10n.calendarTimetableSkip) return Colors.grey;
    return const Color(0xFF4CAF50); // Event
  }

  Widget _buildTextField(
    BuildContext context,
    String label, {
    String? hint,
    Widget? suffixIcon,
    int maxLines = 1,
    TextEditingController? controller,
    bool readOnly = false,
    VoidCallback? onTap,
  }) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;
    final Color borderColor = colorScheme.outlineVariant;
    final Color fillColor = colorScheme.surfaceContainerHighest;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: CustomTextStyles.inter(
            color: colorScheme.onSurface,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          readOnly: readOnly,
          onTap: onTap,
          style: CustomTextStyles.inter(
            color: colorScheme.onSurface,
            fontSize: 14,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: CustomTextStyles.inter(
              color: isDark ? AppColors.darkTextMuted : AppColors.textMuted,
              fontSize: 14,
            ),
            filled: true,
            fillColor: fillColor,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            suffixIcon: suffixIcon,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: colorScheme.primary),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;
    final Color borderColor = colorScheme.outlineVariant;
    final Color iconColor = isDark
        ? AppColors.darkTextSecondary
        : AppColors.textSecondary;

    final eventTypes = [
      l10n.calendarHoliday,
      l10n.calendarExamPeriod,
      l10n.calendarVacation,
      l10n.calendarEvent,
      l10n.calendarTimetableSkip,
    ];
    
    _selectedType ??= eventTypes[3]; // default to Event

    return AppFormDialog(
      title: l10n.addEventDialogTitle,
      cancelText: l10n.addEventCancel,
      saveText: l10n.addEventSave,
      onCancel: () => Navigator.of(context).pop(),
      onSave: () {
        if (_titleController.text.trim().isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please enter a title')),
          );
          return;
        }
        final event = CalendarEvent(
          title: _titleController.text.trim(),
          type: _selectedType!,
          start: _start!,
          end: _end!,
          color: _getColorForType(_selectedType!, l10n),
        );
        Navigator.of(context).pop(event);
      },
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Type Row
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Type',
                        style: CustomTextStyles.inter(
                          color: colorScheme.onSurface,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: isDark
                              ? AppColors.darkSurface
                              : AppColors.white,
                          border: Border.all(color: borderColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: _selectedType,
                            isExpanded: true,
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: iconColor,
                            ),
                            dropdownColor: isDark
                                ? AppColors.darkSurface
                                : AppColors.white,
                            style: CustomTextStyles.inter(
                              color: isDark
                                  ? AppColors.white
                                  : AppColors.textPrimary,
                              fontSize: 14,
                            ),
                            items: eventTypes.map((type) {
                              return DropdownMenuItem<String>(
                                value: type,
                                child: Text(type),
                              );
                            }).toList(),
                            onChanged: (val) {
                              setState(() {
                                _selectedType = val;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: SizedBox(),
                ), // Empty space
              ],
            ),
            const SizedBox(height: 16),
            
            // Title Field
            _buildTextField(
              context,
              'Title',
              hint: 'Event Title',
              controller: _titleController,
            ),
            const SizedBox(height: 16),

            // Date Fields
            _buildTextField(
              context,
              l10n.addEventStartDate,
              hint: l10n.addEventDateFormat,
              controller: _startDateController,
              readOnly: true,
              suffixIcon: Icon(
                Icons.calendar_today_outlined,
                color: iconColor,
                size: 20,
              ),
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: _start ?? DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (date != null) {
                  setState(() {
                    _start = date;
                    _startDateController.text =
                        "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
                  });
                }
              },
            ),
            const SizedBox(height: 16),
            _buildTextField(
              context,
              l10n.addEventEndDate,
              hint: l10n.addEventDateFormat,
              controller: _endDateController,
              readOnly: true,
              suffixIcon: Icon(
                Icons.calendar_today_outlined,
                color: iconColor,
                size: 20,
              ),
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: _end ?? DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (date != null) {
                  setState(() {
                    _end = date;
                    _endDateController.text =
                        "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
