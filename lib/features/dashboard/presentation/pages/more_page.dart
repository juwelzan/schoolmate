import 'package:schoolmate/core/file_path.dart';

class MorePage extends StatelessWidget {
  static const String routeName = '/more';
  const MorePage({super.key});

  Widget _buildGroupSection(BuildContext context, String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 24,
            bottom: 8,
          ),
          child: Text(
            title,
            style: CustomTextStyles.bengali(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.transparent
                    : const Color(0xFF141B2D).withValues(alpha: 0.04),
                blurRadius: 18,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(children: items),
        ),
      ],
    );
  }

  Widget _buildMenuRow(
    BuildContext context,
    String label,
    IconData icon,
    Color iconBg,
    Color iconColor, {
    bool showDivider = true,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final themedIconBg = !isDark
        ? iconBg
        : (iconColor == AppColors.warmGold
              ? AppColors.darkBadgeGoldBg
              : iconColor == Colors.blue
                  ? AppColors.darkBadgeTealBg
                  : iconColor == Colors.red
                      ? Theme.of(context).colorScheme.error.withValues(alpha: 0.16)
                      : AppColors.darkBadgePurpleBg);
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 4,
          ),
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: themedIconBg, shape: BoxShape.circle),
            child: Icon(icon, size: 20, color: iconColor),
          ),
          title: Text(
            label,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          trailing: const Icon(
            Icons.chevron_right,
            color: AppColors.inactiveIcon,
            size: 20,
          ),
          onTap: () {},
        ),
        if (showDivider)
          Divider(
            color: Theme.of(context).colorScheme.outlineVariant,
            height: 1,
            indent: 64,
            endIndent: 16,
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "আরও",
          style: CustomTextStyles.bengali(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildGroupSection(context, "প্রতিষ্ঠান", [
              _buildMenuRow(context,
                "Institution Profile",
                Icons.account_balance,
                AppColors.surfaceVerySoftPurple,
                AppColors.primaryPurple,
              ),
              _buildMenuRow(context,
                "Multi-Track",
                Icons.schema,
                AppColors.paleBlueSurface,
                Colors.blue,
              ),
              _buildMenuRow(context,
                "Board Affiliations",
                Icons.account_tree,
                AppColors.surfaceVerySoftPurple,
                AppColors.primaryPurple,
              ),
              _buildMenuRow(context,
                "SMC / Governing Body",
                Icons.groups,
                AppColors.softWarmGold,
                AppColors.warmGold,
              ),
              _buildMenuRow(context,
                "Campuses",
                Icons.domain,
                AppColors.surfaceVerySoftPurple,
                AppColors.primaryPurple,
              ),
              _buildMenuRow(context,
                "Branches",
                Icons.store,
                AppColors.surfaceVerySoftPurple,
                AppColors.primaryPurple,
                showDivider: false,
              ),
            ]),

            _buildGroupSection(context, "একাডেমিক", [
              _buildMenuRow(context,
                "Academic",
                Icons.menu_book,
                AppColors.surfaceVerySoftPurple,
                AppColors.primaryPurple,
              ),
              _buildMenuRow(context,
                "Timetable",
                Icons.calendar_today,
                AppColors.softWarmGold,
                AppColors.warmGold,
              ),
              _buildMenuRow(context,
                "Document Templates",
                Icons.description,
                AppColors.paleBlueSurface,
                Colors.blue,
              ),
              _buildMenuRow(context,
                "Examination",
                Icons.assignment,
                AppColors.surfaceVerySoftPurple,
                AppColors.primaryPurple,
              ),
              _buildMenuRow(context,
                "Attendance",
                Icons.fact_check,
                AppColors.surfaceVerySoftPurple,
                AppColors.primaryPurple,
              ),
              _buildMenuRow(context,
                "Certificates",
                Icons.card_membership,
                AppColors.softWarmGold,
                AppColors.warmGold,
                showDivider: false,
              ),
            ]),

            _buildGroupSection(context, "ব্যবহারকারী", [
              _buildMenuRow(context,
                "Students",
                Icons.people,
                AppColors.surfaceVerySoftPurple,
                AppColors.primaryPurple,
              ),
              _buildMenuRow(context,
                "Teachers & Staff",
                Icons.badge,
                AppColors.surfaceVerySoftPurple,
                AppColors.primaryPurple,
              ),
              _buildMenuRow(context,
                "Users",
                Icons.person,
                AppColors.paleBlueSurface,
                Colors.blue,
                showDivider: false,
              ),
            ]),

            _buildGroupSection(context, "অর্থ", [
              _buildMenuRow(context,
                "Fee",
                Icons.payments,
                AppColors.softWarmGold,
                AppColors.warmGold,
              ),
              _buildMenuRow(context,
                "Finance",
                Icons.account_balance_wallet,
                AppColors.paleBlueSurface,
                Colors.blue,
              ),
              _buildMenuRow(context,
                "Payment Gateways",
                Icons.credit_card,
                AppColors.surfaceVerySoftPurple,
                AppColors.primaryPurple,
                showDivider: false,
              ),
            ]),

            _buildGroupSection(context, "অপারেশন", [
              _buildMenuRow(context,
                "Online Admission",
                Icons.laptop_chromebook,
                AppColors.surfaceVerySoftPurple,
                AppColors.primaryPurple,
              ),
              _buildMenuRow(context,
                "Inventory",
                Icons.inventory_2,
                AppColors.softWarmGold,
                AppColors.warmGold,
              ),
              _buildMenuRow(context,
                "Communication",
                Icons.campaign,
                AppColors.paleBlueSurface,
                Colors.blue,
              ),
              _buildMenuRow(context,
                "Website",
                Icons.web,
                AppColors.surfaceVerySoftPurple,
                AppColors.primaryPurple,
                showDivider: false,
              ),
            ]),

            const SizedBox(height: 24),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.transparent
                    : const Color(0xFF141B2D).withValues(alpha: 0.04),
                    blurRadius: 18,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildMenuRow(context,
                    "Activity Log",
                    Icons.history,
                    AppColors.paleBlueSurface,
                    Colors.blue,
                  ),
                  _buildMenuRow(context,
                    "Account",
                    Icons.manage_accounts,
                    AppColors.surfaceVerySoftPurple,
                    AppColors.primaryPurple,
                  ),
                  _buildMenuRow(context,
                    "Logout",
                    Icons.logout,
                    const Color(0xFFFFEBEE),
                    Colors.red,
                    showDivider: false,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
      bottomNavigationBar: SchoolMateBottomNav(),
    );
  }
}
