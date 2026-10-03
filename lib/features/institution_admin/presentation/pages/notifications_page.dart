import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';
import 'package:go_router/go_router.dart';

class NotificationsPage extends StatelessWidget {
  static const String routeName = '/notifications';

  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Custom Header with Back Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
                    onPressed: () => context.pop(),
                  ),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Notifications",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        Text(
                          "Your recent alerts and messages",
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Mark all as read", style: TextStyle(color: AppColors.primaryPurple, fontSize: 13, fontWeight: FontWeight.w600)),
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
                    title: "System Update",
                    description: "SchoolMate v2.4 has been successfully installed. Check out the new Finance reports feature.",
                    time: "10 mins ago",
                    icon: Icons.system_update_alt,
                    iconBg: AppColors.surfaceSoftTeal,
                    iconColor: AppColors.primaryTeal,
                    isUnread: true,
                  ),
                  _buildNotificationItem(
                    title: "New Admission Application",
                    description: "Md Rakib Molla has submitted a new admission form for Class 10.",
                    time: "2 hours ago",
                    icon: Icons.person_add_alt,
                    iconBg: AppColors.softPurple,
                    iconColor: AppColors.primaryPurple,
                    isUnread: true,
                  ),
                  _buildNotificationItem(
                    title: "Fee Payment Received",
                    description: "Invoice #INV-2026-0045 has been paid via SSLCommerz.",
                    time: "Yesterday, 04:30 PM",
                    icon: Icons.account_balance_wallet_outlined,
                    iconBg: const Color(0xFFE6F7F0), // Light Green
                    iconColor: AppColors.successGreen,
                    isUnread: false,
                  ),
                  _buildNotificationItem(
                    title: "Leave Request",
                    description: "Teacher Asaduzzaman applied for 2 days of casual leave.",
                    time: "Yesterday, 09:15 AM",
                    icon: Icons.event_busy_outlined,
                    iconBg: AppColors.softWarmGold,
                    iconColor: AppColors.warmGold,
                    isUnread: false,
                  ),
                  _buildNotificationItem(
                    title: "Inventory Alert",
                    description: "Stock for 'A4 Print Paper' is running low (Current: 5 reams).",
                    time: "01 Oct 2026",
                    icon: Icons.warning_amber_rounded,
                    iconBg: const Color(0xFFFFEBEE), // Light Red
                    iconColor: const Color(0xFFD32F2F), // Red
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
        color: isUnread ? AppColors.white : AppColors.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isUnread ? AppColors.primaryPurple.withOpacity(0.3) : AppColors.divider,
        ),
        boxShadow: isUnread
            ? [BoxShadow(color: AppColors.primaryPurple.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))]
            : null,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconBg,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 16),
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
                          fontWeight: isUnread ? FontWeight.bold : FontWeight.w600,
                          color: AppColors.textPrimary,
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
                const SizedBox(height: 6),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 13,
                    color: isUnread ? AppColors.textPrimary.withOpacity(0.9) : AppColors.textSecondary,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textMuted,
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
