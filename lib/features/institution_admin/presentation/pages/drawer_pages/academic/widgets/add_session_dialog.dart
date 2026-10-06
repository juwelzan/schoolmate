import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';
import '../models/academic_year_data.dart';

class AddSessionDialog extends StatefulWidget {
  final String? yearName;
  final AcademicSessionData? initialData;

  const AddSessionDialog({super.key, this.yearName, this.initialData});

  @override
  State<AddSessionDialog> createState() => _AddSessionDialogState();
}

class _AddSessionDialogState extends State<AddSessionDialog> {
  late TextEditingController _nameEnController;
  late TextEditingController _nameBnController;
  late TextEditingController _startDateController;
  late TextEditingController _endDateController;
  DateTime? _start;
  DateTime? _end;

  @override
  void initState() {
    super.initState();
    _nameEnController = TextEditingController(text: widget.initialData?.nameEn ?? '');
    _nameBnController = TextEditingController(text: widget.initialData?.nameBn ?? '');
    _start = widget.initialData?.startDate;
    _end = widget.initialData?.endDate;

    _startDateController = TextEditingController(
      text: _start != null
          ? "${_start!.day.toString().padLeft(2, '0')}/${_start!.month.toString().padLeft(2, '0')}/${_start!.year}"
          : '',
    );
    _endDateController = TextEditingController(
      text: _end != null
          ? "${_end!.day.toString().padLeft(2, '0')}/${_end!.month.toString().padLeft(2, '0')}/${_end!.year}"
          : '',
    );
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
      title: widget.initialData != null ? 'Edit Session' : 'New Session${widget.yearName != null ? " for ${widget.yearName}" : ""}', 
      cancelText: l10n.addEventCancel,
      saveText: l10n.addEventSave,
      onCancel: () => Navigator.of(context).pop(),
      onSave: () {
        if (_nameEnController.text.trim().isEmpty ||
            _nameBnController.text.trim().isEmpty ||
            _start == null ||
            _end == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please fill all fields')),
          );
          return;
        }

        final newSession = AcademicSessionData(
          nameEn: _nameEnController.text.trim(),
          nameBn: _nameBnController.text.trim(),
          status: widget.initialData?.status ?? 'Active',
          startDate: _start!,
          endDate: _end!,
        );
        Navigator.of(context).pop(newSession);
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
                    'Session Name (English)',
                    hint: 'e.g. Session-2026',
                    controller: _nameEnController,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildTextField(
                    context,
                    'Session Name (Bangla)',
                    hint: 'যেমন: সেশন-২০২৬',
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
                    'Start Date',
                    hint: 'DD/MM/YYYY',
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
                    'End Date',
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
