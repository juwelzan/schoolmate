import 'package:flutter/material.dart';
import 'package:schoolmate/core/theme/app_colors.dart';

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Widget? trailing;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        boxShadow: [
          if (!isDark)
            BoxShadow(
              color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
        ],
      ),
      child: Material(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        clipBehavior: Clip.antiAlias,
        child: ListTile(
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isDark
                  ? AppColors.darkBadgePurpleBg
                  : AppColors.surfaceVerySoftPurple,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Theme.of(context).colorScheme.primary,
              size: 22,
            ),
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
              fontSize: 12,
              color:
                  Theme.of(context).textTheme.bodyMedium?.color ??
                  AppColors.textSecondary,
            ),
          ),
          trailing:
              trailing ??
              Icon(
                Icons.chevron_right,
                color: isDark
                    ? AppColors.darkTextMuted
                    : AppColors.inactiveIcon,
              ),
          onTap: onTap,
        ),
      ),
    );
  }
}
