import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolmate/core/file_path.dart';

class MorePage extends StatelessWidget {
  static const String routeName = '/more';

  const MorePage({super.key});

  Widget _buildGroupSection(String title, List<Widget> items) {
    return Builder(
      builder: (context) => Column(
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
              color: (Theme.of(context).brightness == Brightness.dark
                  ? AppColors.darkSurface
                  : AppColors.white),
              borderRadius: BorderRadius.circular(22),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF141B2D).withValues(alpha: 0.04),
                  blurRadius: 18,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(children: items),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuRow(
    String label,
    IconData icon,
    Color iconBg,
    Color iconColor, {
    bool showDivider = true,
  }) {
    return Builder(
      builder: (context) => Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 4,
            ),
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: iconBg, shape: BoxShape.circle),
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
            trailing: Icon(
              Icons.chevron_right,
              color: AppColors.inactiveIcon,
              size: 20,
            ),
            onTap: () {},
          ),
          if (showDivider)
            Divider(
              color: (Theme.of(context).brightness == Brightness.dark
                  ? AppColors.darkBorder
                  : AppColors.divider),
              height: 1,
              indent: 64,
              endIndent: 16,
            ),
        ],
      ),
    );
  }

  Widget _buildLanguageRow(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        final isBn = state.locale.languageCode == 'bn';
        final isEn = state.locale.languageCode == 'en';
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 4,
          ),
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: (Theme.of(context).brightness == Brightness.dark
                  ? AppColors.darkBadgeGoldBg
                  : AppColors.softWarmGold),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.language, size: 20, color: AppColors.warmGold),
          ),
          title: Text(
            "Language",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            decoration: BoxDecoration(
              color: (Theme.of(context).brightness == Brightness.dark
                  ? AppColors.darkSurface
                  : AppColors.paleBlueSurface),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () => context.read<AppBloc>().add(
                    const ChangeLocaleEvent(Locale('bn')),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: isBn
                          ? Theme.of(context).colorScheme.primary
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      "বাংলা",
                      style: CustomTextStyles.bengali(
                        fontSize: 11,
                        color: isBn
                            ? AppColors.white
                            : (Theme.of(context).textTheme.bodyMedium?.color ??
                                  Theme.of(context).colorScheme.onSurfaceVariant),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => context.read<AppBloc>().add(
                    const ChangeLocaleEvent(Locale('en')),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: isEn
                          ? Theme.of(context).colorScheme.primary
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      "EN",
                      style: CustomTextStyles.inter(
                        fontSize: 11,
                        color: isEn
                            ? AppColors.white
                            : (Theme.of(context).textTheme.bodyMedium?.color ??
                                  Theme.of(context).colorScheme.onSurfaceVariant),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
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
            _buildGroupSection("প্রতিষ্ঠান", [
              _buildMenuRow(
                "Institution Profile",
                Icons.account_balance,
                (Theme.of(context).brightness == Brightness.dark
                    ? AppColors.darkBadgePurpleBg
                    : AppColors.surfaceVerySoftPurple),
                Theme.of(context).colorScheme.primary,
              ),
              _buildMenuRow(
                "Multi-Track",
                Icons.schema,
                (Theme.of(context).brightness == Brightness.dark
                    ? AppColors.darkSurface
                    : AppColors.paleBlueSurface),
                Colors.blue,
              ),
              _buildMenuRow(
                "Board Affiliations",
                Icons.account_tree,
                (Theme.of(context).brightness == Brightness.dark
                    ? AppColors.darkBadgeTealBg
                    : AppColors.surfaceVerySoftPurple),
                Theme.of(context).colorScheme.primary,
              ),
              _buildMenuRow(
                "SMC / Governing Body",
                Icons.groups,
                (Theme.of(context).brightness == Brightness.dark
                    ? AppColors.darkBadgeGoldBg
                    : AppColors.softWarmGold),
                AppColors.warmGold,
              ),
              _buildMenuRow(
                "Campuses",
                Icons.domain,
                (Theme.of(context).brightness == Brightness.dark
                    ? AppColors.darkBadgePurpleBg
                    : AppColors.surfaceVerySoftPurple),
                Theme.of(context).colorScheme.primary,
              ),
              _buildMenuRow(
                "Branches",
                Icons.store,
                (Theme.of(context).brightness == Brightness.dark
                    ? AppColors.darkBadgeTealBg
                    : AppColors.surfaceVerySoftPurple),
                Theme.of(context).colorScheme.primary,
                showDivider: false,
              ),
            ]),

            _buildGroupSection("একাডেমিক", [
              _buildMenuRow(
                "Academic",
                Icons.menu_book,
                (Theme.of(context).brightness == Brightness.dark
                    ? AppColors.darkBadgePurpleBg
                    : AppColors.surfaceVerySoftPurple),
                Theme.of(context).colorScheme.primary,
              ),
              _buildMenuRow(
                "Timetable",
                Icons.calendar_today,
                (Theme.of(context).brightness == Brightness.dark
                    ? AppColors.darkBadgeGoldBg
                    : AppColors.softWarmGold),
                AppColors.warmGold,
              ),
              _buildMenuRow(
                "Document Templates",
                Icons.description,
                (Theme.of(context).brightness == Brightness.dark
                    ? AppColors.darkSurface
                    : AppColors.paleBlueSurface),
                Colors.blue,
              ),
              _buildMenuRow(
                "Examination",
                Icons.assignment,
                (Theme.of(context).brightness == Brightness.dark
                    ? AppColors.darkBadgePurpleBg
                    : AppColors.surfaceVerySoftPurple),
                Theme.of(context).colorScheme.primary,
              ),
              _buildMenuRow(
                "Attendance",
                Icons.fact_check,
                (Theme.of(context).brightness == Brightness.dark
                    ? AppColors.darkBadgeTealBg
                    : AppColors.surfaceVerySoftPurple),
                Theme.of(context).colorScheme.primary,
              ),
              _buildMenuRow(
                "Certificates",
                Icons.card_membership,
                (Theme.of(context).brightness == Brightness.dark
                    ? AppColors.darkBadgeGoldBg
                    : AppColors.softWarmGold),
                AppColors.warmGold,
                showDivider: false,
              ),
            ]),

            _buildGroupSection("ব্যবহারকারী", [
              _buildMenuRow(
                "Students",
                Icons.people,
                (Theme.of(context).brightness == Brightness.dark
                    ? AppColors.darkBadgePurpleBg
                    : AppColors.surfaceVerySoftPurple),
                Theme.of(context).colorScheme.primary,
              ),
              _buildMenuRow(
                "Teachers & Staff",
                Icons.badge,
                (Theme.of(context).brightness == Brightness.dark
                    ? AppColors.darkBadgeTealBg
                    : AppColors.surfaceVerySoftPurple),
                Theme.of(context).colorScheme.primary,
              ),
              _buildMenuRow(
                "Users",
                Icons.person,
                (Theme.of(context).brightness == Brightness.dark
                    ? AppColors.darkSurface
                    : AppColors.paleBlueSurface),
                Colors.blue,
                showDivider: false,
              ),
            ]),

            _buildGroupSection("অর্থ", [
              _buildMenuRow(
                "Fee",
                Icons.payments,
                (Theme.of(context).brightness == Brightness.dark
                    ? AppColors.darkBadgeGoldBg
                    : AppColors.softWarmGold),
                AppColors.warmGold,
              ),
              _buildMenuRow(
                "Finance",
                Icons.account_balance_wallet,
                (Theme.of(context).brightness == Brightness.dark
                    ? AppColors.darkSurface
                    : AppColors.paleBlueSurface),
                Colors.blue,
              ),
              _buildMenuRow(
                "Payment Gateways",
                Icons.credit_card,
                (Theme.of(context).brightness == Brightness.dark
                    ? AppColors.darkBadgePurpleBg
                    : AppColors.surfaceVerySoftPurple),
                Theme.of(context).colorScheme.primary,
                showDivider: false,
              ),
            ]),

            _buildGroupSection("অপারেশন", [
              _buildMenuRow(
                "Online Admission",
                Icons.laptop_chromebook,
                (Theme.of(context).brightness == Brightness.dark
                    ? AppColors.darkBadgeTealBg
                    : AppColors.surfaceVerySoftPurple),
                Theme.of(context).colorScheme.primary,
              ),
              _buildMenuRow(
                "Inventory",
                Icons.inventory_2,
                (Theme.of(context).brightness == Brightness.dark
                    ? AppColors.darkBadgeGoldBg
                    : AppColors.softWarmGold),
                AppColors.warmGold,
              ),
              _buildMenuRow(
                "Communication",
                Icons.campaign,
                (Theme.of(context).brightness == Brightness.dark
                    ? AppColors.darkSurface
                    : AppColors.paleBlueSurface),
                Colors.blue,
              ),
              _buildMenuRow(
                "Website",
                Icons.web,
                (Theme.of(context).brightness == Brightness.dark
                    ? AppColors.darkBadgePurpleBg
                    : AppColors.surfaceVerySoftPurple),
                Theme.of(context).colorScheme.primary,
                showDivider: false,
              ),
            ]),

            SizedBox(height: 24),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: (Theme.of(context).brightness == Brightness.dark
                    ? AppColors.darkSurface
                    : AppColors.white),
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF141B2D).withValues(alpha: 0.04),
                    blurRadius: 18,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildLanguageRow(context),
                  Divider(
                    color: (Theme.of(context).brightness == Brightness.dark
                        ? AppColors.darkBorder
                        : AppColors.divider),
                    height: 1,
                    indent: 64,
                    endIndent: 16,
                  ),
                  _buildMenuRow(
                    "Activity Log",
                    Icons.history,
                    (Theme.of(context).brightness == Brightness.dark
                        ? AppColors.darkSurface
                        : AppColors.paleBlueSurface),
                    Colors.blue,
                  ),
                  _buildMenuRow(
                    "Account",
                    Icons.manage_accounts,
                    (Theme.of(context).brightness == Brightness.dark
                        ? AppColors.darkBadgePurpleBg
                        : AppColors.surfaceVerySoftPurple),
                    Theme.of(context).colorScheme.primary,
                  ),
                  _buildMenuRow(
                    "Logout",
                    Icons.logout,
                    Color(0xFFFFEBEE),
                    Colors.red,
                    showDivider: false,
                  ),
                ],
              ),
            ),

            SizedBox(height: 32),
          ],
        ),
      ),
      bottomNavigationBar: const SchoolMateBottomNav(),
    );
  }
}
