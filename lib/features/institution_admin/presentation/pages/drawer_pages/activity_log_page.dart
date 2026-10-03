import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class ActivityLogPage extends StatelessWidget {
  static const String routeName = '/activity-log';

  const ActivityLogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Activity Log",
        subtitle: "Audit trail of all create, update, and delete actions",
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
                  _buildDropdown(),
                  _buildSearchField(),
                  _buildDateField(),
                ],
              ),
              const SizedBox(height: 24),
              
              // Activity List Card
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.divider),
                  ),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      _buildActivityItem(
                        badgeText: "Deleted",
                        badgeColor: const Color(0xFFFF6B6B), // Red
                        badgeTextColor: AppColors.white,
                        title: "InstitutionBoardAffiliation",
                        id: "#01a0cc88",
                        subtitle: "by Md Rakib Molla",
                        time: "03 Oct 2026, 10:47 am",
                      ),
                      const Divider(height: 1, color: AppColors.divider),
                      _buildActivityItem(
                        badgeText: "Super Admin Superadmin@School.Test Signed In...",
                        badgeColor: const Color(0xFFF0F2F5), // Light gray
                        badgeTextColor: AppColors.textPrimary,
                        title: "User",
                        id: "#01a0cc86",
                        subtitle: "by Super Admin",
                        time: "03 Oct 2026, 09:34 am",
                      ),
                      const Divider(height: 1, color: AppColors.divider),
                      _buildActivityItem(
                        badgeText: "Updated",
                        badgeColor: const Color(0xFFE9EBF2), // Gray
                        badgeTextColor: AppColors.textPrimary,
                        title: "WebsiteSection",
                        id: "#01a10025",
                        subtitle: "by Md Rakib Molla",
                        fieldsChanged: "1 field(s) changed",
                        time: "03 Oct 2026, 05:19 am",
                      ),
                      const Divider(height: 1, color: AppColors.divider),
                      _buildActivityItem(
                        badgeText: "Created",
                        badgeColor: const Color(0xFF17212B), // Black/Dark
                        badgeTextColor: AppColors.white,
                        title: "WebsiteSection",
                        id: "#01a10025",
                        subtitle: "by Md Rakib Molla",
                        fieldsChanged: "6 field(s) changed",
                        time: "03 Oct 2026, 05:03 am",
                      ),
                      const Divider(height: 1, color: AppColors.divider),
                      _buildActivityItem(
                        badgeText: "Created",
                        badgeColor: const Color(0xFF17212B), // Black/Dark
                        badgeTextColor: AppColors.white,
                        title: "WebsiteSection",
                        id: "#01a10025",
                        subtitle: "by Md Rakib Molla",
                        fieldsChanged: "6 field(s) changed",
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

  Widget _buildDropdown() {
    return Container(
      width: 200,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.divider),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: "All events",
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.textSecondary),
          items: ["All events", "Created", "Updated", "Deleted"]
              .map((e) => DropdownMenuItem(value: e, child: Text(e, style: const TextStyle(color: AppColors.textSecondary, fontSize: 14))))
              .toList(),
          onChanged: (val) {},
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return SizedBox(
      width: 250,
      child: TextField(
        decoration: InputDecoration(
          hintText: "Filter by user ID",
          hintStyle: const TextStyle(color: AppColors.textMuted, fontSize: 14),
          prefixIcon: const Icon(Icons.search, size: 20, color: AppColors.textMuted),
          filled: true,
          fillColor: const Color(0xFFF9FAFB),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.divider),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.divider),
          ),
        ),
      ),
    );
  }

  Widget _buildDateField() {
    return SizedBox(
      width: 200,
      child: TextField(
        decoration: InputDecoration(
          hintText: "dd/mm/yyyy",
          hintStyle: const TextStyle(color: AppColors.textMuted, fontSize: 14),
          suffixIcon: const Icon(Icons.calendar_today_outlined, size: 18, color: AppColors.textMuted),
          filled: true,
          fillColor: const Color(0xFFF9FAFB),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.divider),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.divider),
          ),
        ),
      ),
    );
  }

  Widget _buildActivityItem({
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
              constraints: const BoxConstraints(maxWidth: 300), // In case badge text is long
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
                    style: const TextStyle(color: AppColors.textPrimary, fontSize: 15, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: id,
                        style: const TextStyle(color: AppColors.textSecondary, fontSize: 15, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13)),
                
                if (fieldsChanged != null) ...[
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.arrow_right, size: 16, color: AppColors.textSecondary),
                      Expanded(
                        child: Text(fieldsChanged, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13)),
                      ),
                    ],
                  ),
                ]
              ],
            ),
          ),
          
          // Time
          const SizedBox(width: 16),
          Text(time, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13)),
        ],
      ),
    );
  }
}
