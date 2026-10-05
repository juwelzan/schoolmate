import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';
import 'package:go_router/go_router.dart';

class NotificationsPage extends StatelessWidget {
  static const String routeName = '/notifications';

  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
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
                vertical: 12.0,
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
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.notificationsPageTitle,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        Text(
                          l10n.notificationsPageSubtitle,
                          style: TextStyle(
                            fontSize: 12,
                            color:
                                (Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.color ??
                                AppColors.textSecondary),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      l10n.notificationsMarkAllRead,
                      style: TextStyle(
                        color: colorScheme.primary,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Notifications List
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  _buildNotificationItem(
                    context: context,
                    title: l10n.notificationSystemUpdateTitle,
                    description: l10n.notificationSystemUpdateDesc,
                    time: l10n.notificationTime10MinsAgo,
                    icon: Icons.system_update_alt,
                    iconBg: (Theme.of(context).brightness == Brightness.dark
                        ? AppColors.darkBadgeTealBg
                        : AppColors.surfaceVerySoftPurple),
                    iconColor: colorScheme.primary,
                    isUnread: true,
                  ),
                  _buildNotificationItem(
                    context: context,
                    title: l10n.notificationAdmissionTitle,
                    description: l10n.notificationAdmissionDesc,
                    time: l10n.notificationTime2HoursAgo,
                    icon: Icons.person_add_alt,
                    iconBg: (Theme.of(context).brightness == Brightness.dark
                        ? AppColors.darkBadgePurpleBg
                        : AppColors.softPurple),
                    iconColor: colorScheme.primary,
                    isUnread: true,
                  ),
                  _buildNotificationItem(
                    context: context,
                    title: l10n.notificationFeePaymentTitle,
                    description: l10n.notificationFeePaymentDesc,
                    time: l10n.notificationTimeYesterday430,
                    icon: Icons.account_balance_wallet_outlined,
                    iconBg: (Theme.of(context).brightness == Brightness.dark
                        ? const Color(0xFF0D2D20)
                        : const Color(0xFFE6F7F0)), // Light Green
                    iconColor: Theme.of(context).brightness == Brightness.dark
                        ? const Color(0xFF55D69E)
                        : AppColors.successGreen,
                    isUnread: false,
                  ),
                  _buildNotificationItem(
                    context: context,
                    title: l10n.notificationLeaveRequestTitle,
                    description: l10n.notificationLeaveRequestDesc,
                    time: l10n.notificationTimeYesterday915,
                    icon: Icons.event_busy_outlined,
                    iconBg: (Theme.of(context).brightness == Brightness.dark
                        ? AppColors.darkBadgeGoldBg
                        : AppColors.softWarmGold),
                    iconColor: Theme.of(context).brightness == Brightness.dark
                        ? const Color(0xFFFFCC66)
                        : AppColors.warmGold,
                    isUnread: false,
                  ),
                  _buildNotificationItem(
                    context: context,
                    title: l10n.notificationInventoryAlertTitle,
                    description: l10n.notificationInventoryAlertDesc,
                    time: l10n.notificationTimeOct01,
                    icon: Icons.warning_amber_rounded,
                    iconBg: (Theme.of(context).brightness == Brightness.dark
                        ? const Color(0xFF3B1518)
                        : const Color(0xFFFFEBEE)), // Light Red
                    iconColor: Theme.of(context).brightness == Brightness.dark
                        ? const Color(0xFFFF8585)
                        : const Color(0xFFD32F2F),
                    isUnread: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationItem({
    required BuildContext context,
    required String title,
    required String description,
    required String time,
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required bool isUnread,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isUnread
            ? (Theme.of(context).brightness == Brightness.dark
                  ? AppColors.darkSurface
                  : AppColors.white)
            : Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isUnread
              ? AppColors.primaryPurple.withValues(alpha: 0.3)
              : (Theme.of(context).brightness == Brightness.dark
                    ? AppColors.darkBorder
                    : AppColors.divider),
        ),
        boxShadow: isUnread
            ? [
                BoxShadow(
                  color: AppColors.primaryPurple.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: iconBg, shape: BoxShape.circle),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: isUnread
                              ? FontWeight.bold
                              : FontWeight.w600,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ),
                    if (isUnread)
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: AppColors.primaryPurple,
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 6),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 13,
                    color: isUnread
                        ? Theme.of(context).colorScheme.onSurface
                              .withValues(alpha: 0.9)
                        : (Theme.of(context).textTheme.bodyMedium?.color ??
                              AppColors.textSecondary),
                    height: 1.4,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 12,
                    color: (Theme.of(context).brightness == Brightness.dark
                        ? AppColors.darkTextMuted
                        : AppColors.textMuted),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
