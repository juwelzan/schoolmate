import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolmate/core/file_path.dart';


class MorePage extends StatelessWidget {
  static const String routeName = '/more';

  const MorePage({super.key});

  Widget _buildGroupSection(String title, List<Widget> items) {
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
            style: const TextStyle(
              fontFamily: 'Noto Sans Bengali',
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF141B2D).withOpacity(0.04),
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
    String label,
    IconData icon,
    Color iconBg,
    Color iconColor, {
    bool showDivider = true,
  }) {
    return Column(
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
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
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
          const Divider(
            color: AppColors.divider,
            height: 1,
            indent: 64,
            endIndent: 16,
          ),
      ],
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
            decoration: const BoxDecoration(color: AppColors.softWarmGold, shape: BoxShape.circle),
            child: const Icon(Icons.language, size: 20, color: AppColors.warmGold),
          ),
          title: const Text(
            "Language",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.paleBlueSurface,
              borderRadius: BorderRadius.circular(999),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () => context.read<AppBloc>().add(const ChangeLocaleEvent(Locale('bn'))),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: isBn ? AppColors.primaryTeal : Colors.transparent,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      "বাংলা",
                      style: TextStyle(
                        fontFamily: 'Noto Sans Bengali',
                        fontSize: 11,
                        color: isBn ? AppColors.white : AppColors.textSecondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => context.read<AppBloc>().add(const ChangeLocaleEvent(Locale('en'))),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: isEn ? AppColors.primaryTeal : Colors.transparent,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      "EN",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 11,
                        color: isEn ? AppColors.white : AppColors.textSecondary,
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
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "আরও",
          style: TextStyle(
            fontFamily: 'Noto Sans Bengali',
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
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
                AppColors.surfaceVerySoftPurple,
                AppColors.primaryPurple,
              ),
              _buildMenuRow(
                "Multi-Track",
                Icons.schema,
                AppColors.paleBlueSurface,
                Colors.blue,
              ),
              _buildMenuRow(
                "Board Affiliations",
                Icons.account_tree,
                AppColors.surfaceSoftTeal,
                AppColors.primaryTeal,
              ),
              _buildMenuRow(
                "SMC / Governing Body",
                Icons.groups,
                AppColors.softWarmGold,
                AppColors.warmGold,
              ),
              _buildMenuRow(
                "Campuses",
                Icons.domain,
                AppColors.surfaceVerySoftPurple,
                AppColors.primaryPurple,
              ),
              _buildMenuRow(
                "Branches",
                Icons.store,
                AppColors.surfaceSoftTeal,
                AppColors.primaryTeal,
                showDivider: false,
              ),
            ]),

            _buildGroupSection("একাডেমিক", [
              _buildMenuRow(
                "Academic",
                Icons.menu_book,
                AppColors.surfaceVerySoftPurple,
                AppColors.primaryPurple,
              ),
              _buildMenuRow(
                "Timetable",
                Icons.calendar_today,
                AppColors.softWarmGold,
                AppColors.warmGold,
              ),
              _buildMenuRow(
                "Document Templates",
                Icons.description,
                AppColors.paleBlueSurface,
                Colors.blue,
              ),
              _buildMenuRow(
                "Examination",
                Icons.assignment,
                AppColors.surfaceVerySoftPurple,
                AppColors.primaryPurple,
              ),
              _buildMenuRow(
                "Attendance",
                Icons.fact_check,
                AppColors.surfaceSoftTeal,
                AppColors.primaryTeal,
              ),
              _buildMenuRow(
                "Certificates",
                Icons.card_membership,
                AppColors.softWarmGold,
                AppColors.warmGold,
                showDivider: false,
              ),
            ]),

            _buildGroupSection("ব্যবহারকারী", [
              _buildMenuRow(
                "Students",
                Icons.people,
                AppColors.surfaceVerySoftPurple,
                AppColors.primaryPurple,
              ),
              _buildMenuRow(
                "Teachers & Staff",
                Icons.badge,
                AppColors.surfaceSoftTeal,
                AppColors.primaryTeal,
              ),
              _buildMenuRow(
                "Users",
                Icons.person,
                AppColors.paleBlueSurface,
                Colors.blue,
                showDivider: false,
              ),
            ]),

            _buildGroupSection("অর্থ", [
              _buildMenuRow(
                "Fee",
                Icons.payments,
                AppColors.softWarmGold,
                AppColors.warmGold,
              ),
              _buildMenuRow(
                "Finance",
                Icons.account_balance_wallet,
                AppColors.paleBlueSurface,
                Colors.blue,
              ),
              _buildMenuRow(
                "Payment Gateways",
                Icons.credit_card,
                AppColors.surfaceVerySoftPurple,
                AppColors.primaryPurple,
                showDivider: false,
              ),
            ]),

            _buildGroupSection("অপারেশন", [
              _buildMenuRow(
                "Online Admission",
                Icons.laptop_chromebook,
                AppColors.surfaceSoftTeal,
                AppColors.primaryTeal,
              ),
              _buildMenuRow(
                "Inventory",
                Icons.inventory_2,
                AppColors.softWarmGold,
                AppColors.warmGold,
              ),
              _buildMenuRow(
                "Communication",
                Icons.campaign,
                AppColors.paleBlueSurface,
                Colors.blue,
              ),
              _buildMenuRow(
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
                color: AppColors.white,
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF141B2D).withOpacity(0.04),
                    blurRadius: 18,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildLanguageRow(context),
                  const Divider(
                    color: AppColors.divider,
                    height: 1,
                    indent: 64,
                    endIndent: 16,
                  ),
                  _buildMenuRow(
                    "Activity Log",
                    Icons.history,
                    AppColors.paleBlueSurface,
                    Colors.blue,
                  ),
                  _buildMenuRow(
                    "Account",
                    Icons.manage_accounts,
                    AppColors.surfaceVerySoftPurple,
                    AppColors.primaryPurple,
                  ),
                  _buildMenuRow(
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
      bottomNavigationBar: const SchoolMateBottomNav(),
    );
  }
}
