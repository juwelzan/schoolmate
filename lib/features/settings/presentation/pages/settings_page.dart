import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolmate/core/file_path.dart';
import 'package:schoolmate/features/settings/presentation/widgets/settings_section_header.dart';
import 'package:schoolmate/features/settings/presentation/widgets/theme_dialog.dart';
import 'package:schoolmate/features/settings/presentation/widgets/settings_tile.dart';
import 'package:schoolmate/core/widgets/language_toggle_button.dart';

class SettingsPage extends StatelessWidget {
  static const String routeName = '/settings';

  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Custom Header with Back Button
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    onPressed: () => context.pop(),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.settingsTitle,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      Text(
                        l10n.settingsSubtitle,
                        style: TextStyle(
                          fontSize: 12,
                          color:
                              Theme.of(context).textTheme.bodyMedium?.color ??
                              AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: isDark ? AppColors.darkBorder : AppColors.divider,
              height: 1,
              thickness: 1,
            ),
            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SettingsSectionHeader(title: l10n.settingsGeneral),
                    SettingsTile(
                      icon: Icons.language,
                      title: l10n.settingsLanguage,
                      subtitle: l10n.settingsLanguageDesc,
                      trailing: const LanguageToggleButton(),
                      onTap: () {},
                    ),
                    BlocBuilder<AppBloc, AppState>(
                      builder: (context, state) {
                        String themeName = l10n.themeSystem;
                        if (state.themeMode == ThemeMode.light) {
                          themeName = l10n.themeLight;
                        } else if (state.themeMode == ThemeMode.dark) {
                          themeName = l10n.themeDark;
                        }

                        return SettingsTile(
                          icon: Icons.dark_mode_outlined,
                          title: l10n.settingsTheme,
                          subtitle: l10n.settingsThemeDesc,
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                themeName,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: colorScheme.onSurface,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Icon(
                                Icons.chevron_right,
                                color: isDark
                                    ? AppColors.darkTextMuted
                                    : AppColors.inactiveIcon,
                              ),
                            ],
                          ),
                          onTap: () => showThemeDialog(context),
                        );
                      },
                    ),
                    const SizedBox(height: 24),
                    SettingsSectionHeader(title: l10n.settingsAccount),
                    SettingsTile(
                      icon: Icons.lock_outline,
                      title: l10n.settingsChangePassword,
                      subtitle: l10n.settingsChangePasswordDesc,
                      onTap: () => context.push(AppRoutes.changePassword),
                    ),
                    SettingsTile(
                      icon: Icons.notifications_outlined,
                      title: l10n.settingsNotifications,
                      subtitle: l10n.settingsNotificationsDesc,
                      onTap: () => context.push(AppRoutes.notifications),
                    ),
                    const SizedBox(height: 24),
                    SettingsSectionHeader(title: l10n.settingsSupport),
                    SettingsTile(
                      icon: Icons.help_outline,
                      title: l10n.settingsHelpSupport,
                      subtitle: l10n.settingsHelpSupportDesc,
                      onTap: () {},
                    ),
                    SettingsTile(
                      icon: Icons.info_outline,
                      title: l10n.settingsAbout,
                      subtitle: l10n.settingsAboutDesc,
                      onTap: () {},
                    ),
                    const SizedBox(height: 32),
                    Center(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          context.go(AppRoutes.login);
                        },
                        icon: const Icon(Icons.logout, color: Colors.white),
                        label: Text(
                          l10n.settingsLogOut,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
