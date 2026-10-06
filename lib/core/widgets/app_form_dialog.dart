import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class AppFormDialog extends StatelessWidget {
  final String title;
  final Widget content;
  final String cancelText;
  final String saveText;
  final VoidCallback onCancel;
  final VoidCallback onSave;
  final double width;

  const AppFormDialog({
    super.key,
    required this.title,
    required this.content,
    required this.cancelText,
    required this.saveText,
    required this.onCancel,
    required this.onSave,
    this.width = 600,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;
    final Color bgColor = colorScheme.surface;
    final Color borderColor = colorScheme.outlineVariant;
    final Color iconColor = isDark
        ? AppColors.darkTextSecondary
        : AppColors.textSecondary;

    return Dialog(
      backgroundColor: bgColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: width,
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
                  title,
                  style: CustomTextStyles.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isDark ? AppColors.white : AppColors.textPrimary,
                  ),
                ),
                IconButton(
                  onPressed: onCancel,
                  icon: Icon(Icons.close, color: iconColor),
                  splashRadius: 20,
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            // Content
            Flexible(child: content),

            const SizedBox(height: 32),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: onCancel,
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
                    cancelText,
                    style: CustomTextStyles.inter(
                      color: isDark ? AppColors.white : AppColors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: onSave,
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
                    saveText,
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
