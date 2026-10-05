import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';
import 'package:schoolmate/features/institution_admin/presentation/widgets/school_mate_app_bar.dart';
import 'package:schoolmate/features/institution_admin/presentation/widgets/app_drawer.dart';

class ActivityLogPage extends StatelessWidget {
  static const String routeName = '/activity-log';

  const ActivityLogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: SchoolMateAppBar(
        title: l10n.activityLogTitle,
        subtitle: l10n.activityLogSubtitle,
      ),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Filters Row
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  _buildDropdown(context, l10n),
                  _buildSearchField(context, l10n),
                  _buildDateField(context, l10n),
                ],
              ),
              const SizedBox(height: 24),

              // Activity List Card
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
                  ),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      _buildActivityItem(
                        context,
                        badgeText: l10n.activityLogDeleted,
                        badgeColor: Theme.of(context).colorScheme.error,
                        badgeTextColor: Theme.of(context).colorScheme.onError,
                        title: "InstitutionBoardAffiliation",
                        id: "#01a0cc88",
                        subtitle: "by Md Rakib Molla",
                        time: "03 Oct 2026, 10:47 am",
                      ),
                      Divider(height: 1, color: Theme.of(context).colorScheme.outlineVariant),
                      _buildActivityItem(
                        context,
                        badgeText:
                            "Super Admin Superadmin@School.Test Signed In...",
                        badgeColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                        badgeTextColor: Theme.of(context).colorScheme.onSurface,
                        title: "User",
                        id: "#01a0cc86",
                        subtitle: "by Super Admin",
                        time: "03 Oct 2026, 09:34 am",
                      ),
                      Divider(height: 1, color: Theme.of(context).colorScheme.outlineVariant),
                      _buildActivityItem(
                        context,
                        badgeText: l10n.activityLogUpdated,
                        badgeColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                        badgeTextColor: Theme.of(context).colorScheme.onSurface,
                        title: "WebsiteSection",
                        id: "#01a10025",
                        subtitle: "by Md Rakib Molla",
                        fieldsChanged: l10n.activityLogFieldsChanged("1"),
                        time: "03 Oct 2026, 05:19 am",
                      ),
                      Divider(height: 1, color: Theme.of(context).colorScheme.outlineVariant),
                      _buildActivityItem(
                        context,
                        badgeText: l10n.activityLogCreated,
                        badgeColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                        badgeTextColor: Theme.of(context).colorScheme.onSurface,
                        title: "WebsiteSection",
                        id: "#01a10025",
                        subtitle: "by Md Rakib Molla",
                        fieldsChanged: l10n.activityLogFieldsChanged("6"),
                        time: "03 Oct 2026, 05:03 am",
                      ),
                      Divider(height: 1, color: Theme.of(context).colorScheme.outlineVariant),
                      _buildActivityItem(
                        context,
                        badgeText: l10n.activityLogCreated,
                        badgeColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                        badgeTextColor: Theme.of(context).colorScheme.onSurface,
                        title: "WebsiteSection",
                        id: "#01a10025",
                        subtitle: "by Md Rakib Molla",
                        fieldsChanged: l10n.activityLogFieldsChanged("6"),
                        time: "03 Oct 2026, 05:03 am",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown(BuildContext context, AppLocalizations l10n) {
    return Container(
      width: 200,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: l10n.activityLogAllEvents,
          isExpanded: true,
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          items:
              [
                    l10n.activityLogAllEvents,
                    l10n.activityLogCreated,
                    l10n.activityLogUpdated,
                    l10n.activityLogDeleted,
                  ]
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  )
                  .toList(),
          onChanged: (val) {},
        ),
      ),
    );
  }

  Widget _buildSearchField(BuildContext context, AppLocalizations l10n) {
    return SizedBox(
      width: 250,
      child: TextField(
        decoration: InputDecoration(
          hintText: l10n.activityLogFilterUserId,
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant, fontSize: 14),
          prefixIcon: Icon(
            Icons.search,
            size: 20,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          filled: true,
          fillColor: Theme.of(context).colorScheme.surfaceContainerHighest,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
          ),
        ),
      ),
    );
  }

  Widget _buildDateField(BuildContext context, AppLocalizations l10n) {
    return SizedBox(
      width: 200,
      child: TextField(
        decoration: InputDecoration(
          hintText: l10n.activityLogDateFormat,
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant, fontSize: 14),
          suffixIcon: Icon(
            Icons.calendar_today_outlined,
            size: 18,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          filled: true,
          fillColor: Theme.of(context).colorScheme.surfaceContainerHighest,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
          ),
        ),
      ),
    );
  }

  Widget _buildActivityItem(
    BuildContext context, {
    required String badgeText,
    required Color badgeColor,
    required Color badgeTextColor,
    required String title,
    required String id,
    required String subtitle,
    String? fieldsChanged,
    required String time,
  }) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Badge
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              constraints: const BoxConstraints(
                maxWidth: 300,
              ), // In case badge text is long
              decoration: BoxDecoration(
                color: badgeColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                badgeText,
                style: TextStyle(
                  color: badgeTextColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const SizedBox(width: 24),

          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: "$title ",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: id,
                        style: TextStyle(
                          color:
                              Theme.of(context).textTheme.bodyMedium?.color ??
                              AppColors.textSecondary,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color:
                        Theme.of(context).textTheme.bodyMedium?.color ??
                        AppColors.textSecondary,
                    fontSize: 13,
                  ),
                ),

                if (fieldsChanged != null) ...[
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_right,
                        size: 16,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                      Expanded(
                        child: Text(
                          fieldsChanged,
                          style: TextStyle(
                            color:
                                Theme.of(context).textTheme.bodyMedium?.color ??
                                AppColors.textSecondary,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),

          // Time
          const SizedBox(width: 16),
          Text(
            time,
            style: TextStyle(
              color:
                  Theme.of(context).textTheme.bodyMedium?.color ??
                  AppColors.textSecondary,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
