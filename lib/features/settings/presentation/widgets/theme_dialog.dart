import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolmate/core/file_path.dart';

void showThemeDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierColor: Colors.black54,
    builder: (ctx) {
      return const ThemeDialogWidget();
    },
  );
}

class ThemeDialogWidget extends StatelessWidget {
  const ThemeDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: colorScheme.primary.withValues(alpha: isDark ? 0.0 : 0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            final currentTheme = state.themeMode;

            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      l10n.settingsTheme,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.close,
                        color:
                            Theme.of(context).textTheme.bodyMedium?.color ??
                            AppColors.textSecondary,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                _buildThemeOption(
                  context: context,
                  title: l10n.themeLight,
                  icon: Icons.light_mode_outlined,
                  mode: ThemeMode.light,
                  currentMode: currentTheme,
                  isDark: isDark,
                ),
                const SizedBox(height: 12),
                _buildThemeOption(
                  context: context,
                  title: l10n.themeDark,
                  icon: Icons.dark_mode_outlined,
                  mode: ThemeMode.dark,
                  currentMode: currentTheme,
                  isDark: isDark,
                ),
                const SizedBox(height: 12),
                _buildThemeOption(
                  context: context,
                  title: l10n.themeSystem,
                  icon: Icons.brightness_auto_outlined,
                  mode: ThemeMode.system,
                  currentMode: currentTheme,
                  isDark: isDark,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildThemeOption({
    required BuildContext context,
    required String title,
    required IconData icon,
    required ThemeMode mode,
    required ThemeMode currentMode,
    required bool isDark,
  }) {
    final isSelected = mode == currentMode;
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: () {
        context.read<AppBloc>().add(ChangeThemeEvent(mode));
        Navigator.pop(context);
      },
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected
              ? (isDark
                    ? AppColors.darkBadgePurpleBg
                    : AppColors.surfaceVerySoftPurple)
              : Colors.transparent,
          border: Border.all(
            color: isSelected
                ? colorScheme.primary
                : (isDark ? AppColors.darkBorder : AppColors.divider),
            width: isSelected ? 1.5 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected
                  ? colorScheme.primary
                  : (isDark ? AppColors.white : AppColors.textSecondary),
              size: 24,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  color: isSelected
                      ? (isDark
                            ? AppColors.darkBadgePurpleText
                            : colorScheme.primary)
                      : (isDark ? AppColors.white : (AppColors.textSecondary)),
                ),
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check_circle,
                color: AppColors.successGreen,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}
