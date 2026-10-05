import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:schoolmate/core/theme/app_colors.dart';
import 'package:schoolmate/core/widgets/custom_text_style.dart';
import 'package:schoolmate/l10n/app_localizations.dart';

class AddEventDialog extends StatefulWidget {
  final DateTime? initialStartDate;
  final DateTime? initialEndDate;

  const AddEventDialog({super.key, this.initialStartDate, this.initialEndDate});

  @override
  State<AddEventDialog> createState() => _AddEventDialogState();
}

class _AddEventDialogState extends State<AddEventDialog> {
  String? _selectedType;
  late TextEditingController _startDateController;
  late TextEditingController _endDateController;

  @override
  void initState() {
    super.initState();
    _startDateController = TextEditingController(
      text: widget.initialStartDate != null
          ? "${widget.initialStartDate!.day.toString().padLeft(2, '0')}/${widget.initialStartDate!.month.toString().padLeft(2, '0')}/${widget.initialStartDate!.year}"
          : '',
    );
    _endDateController = TextEditingController(
      text: widget.initialEndDate != null
          ? "${widget.initialEndDate!.day.toString().padLeft(2, '0')}/${widget.initialEndDate!.month.toString().padLeft(2, '0')}/${widget.initialEndDate!.year}"
          : '',
    );
  }

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
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
    final Color bgColor = colorScheme.surface;
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

    return Dialog(
      backgroundColor: bgColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 600,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  l10n.addEventDialogTitle,
                  style: CustomTextStyles.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isDark ? AppColors.white : AppColors.textPrimary,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.close, color: iconColor),
                  splashRadius: 20,
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Title Row
            Row(
              children: [
                Expanded(
                  child: _buildTextField(context, l10n.addEventTitleEnglish),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildTextField(context, l10n.addEventTitleBangla),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Type Dropdown
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.addEventType,
                        style: CustomTextStyles.inter(
                          color: isDark
                              ? AppColors.white
                              : AppColors.textPrimary,
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
                            hint: Text(
                              'Select Type',
                              style: CustomTextStyles.inter(
                                color: isDark
                                    ? AppColors.darkTextMuted
                                    : AppColors.textMuted,
                                fontSize: 14,
                              ),
                            ),
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
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        type,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    if (_selectedType == type)
                                      Icon(
                                        Icons.check,
                                        size: 18,
                                        color: isDark
                                            ? AppColors.white
                                            : AppColors.textPrimary,
                                      ),
                                  ],
                                ),
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
                ), // Empty space to match the screenshot
              ],
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
                  initialDate: widget.initialStartDate ?? DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  builder: (context, child) {
                    return Theme(data: Theme.of(context), child: child!);
                  },
                );
                if (date != null) {
                  _startDateController.text =
                      "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
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
                  initialDate: widget.initialEndDate ?? DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  builder: (context, child) {
                    return Theme(data: Theme.of(context), child: child!);
                  },
                );
                if (date != null) {
                  _endDateController.text =
                      "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
                }
              },
            ),
            const SizedBox(height: 16),
            // Description
            _buildTextField(context, l10n.addEventDescription, maxLines: 3),
            const SizedBox(height: 32),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 14,
                    ),
                    side: BorderSide(color: borderColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    l10n.addEventCancel,
                    style: CustomTextStyles.inter(
                      color: isDark ? AppColors.white : AppColors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {
                    // Save action
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    l10n.addEventSave,
                    style: CustomTextStyles.inter(
                      color: colorScheme.onPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
