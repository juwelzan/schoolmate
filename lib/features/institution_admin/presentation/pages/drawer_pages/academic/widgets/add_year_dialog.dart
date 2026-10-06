import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class AddYearDialog extends StatefulWidget {
  const AddYearDialog({super.key});

  @override
  State<AddYearDialog> createState() => _AddYearDialogState();
}

class _AddYearDialogState extends State<AddYearDialog> {
  late TextEditingController _nameEnController;
  late TextEditingController _nameBnController;
  late TextEditingController _startDateController;
  late TextEditingController _endDateController;
  DateTime? _start;
  DateTime? _end;

  @override
  void initState() {
    super.initState();
    _nameEnController = TextEditingController();
    _nameBnController = TextEditingController();
    _startDateController = TextEditingController();
    _endDateController = TextEditingController();
  }

  @override
  void dispose() {
    _nameEnController.dispose();
    _nameBnController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  Widget _buildTextField(
    BuildContext context,
    String label, {
    String? hint,
    Widget? suffixIcon,
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
    final iconColor = isDark ? AppColors.darkTextSecondary : AppColors.textSecondary;

    return AppFormDialog(
      title: 'New Academic Year', // Hardcoded fallback if missing in l10n
      cancelText: l10n.addEventCancel, // Reusing localized strings where applicable
      saveText: l10n.addEventSave,
      onCancel: () => Navigator.of(context).pop(),
      onSave: () {
        // Handle save logic here
        Navigator.of(context).pop();
      },
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    context,
                    'Name (English)',
                    hint: 'e.g. 2024-2025',
                    controller: _nameEnController,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildTextField(
                    context,
                    'Name (Bangla)',
                    hint: 'যেমন: ২০২৪-২০২৫',
                    controller: _nameBnController,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    context,
                    'Start Date', // Can use l10n.addEventStartDate
                    hint: 'DD/MM/YYYY', // Can use l10n.addEventDateFormat
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
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildTextField(
                    context,
                    'End Date', // Can use l10n.addEventEndDate
                    hint: 'DD/MM/YYYY',
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
