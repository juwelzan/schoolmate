import 'package:schoolmate/core/file_path.dart';
import 'package:schoolmate/features/institution_admin/presentation/widgets/dashboard_widgets.dart';

class InstitutionAdminDashboardPage extends StatelessWidget {
  static const String routeName = '/institution-admin-dashboard';

  const InstitutionAdminDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const InfoBanner(),

            // Dashboard Greeting
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 8.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: (Theme.of(context).brightness == Brightness.dark
                          ? AppColors.darkBadgePurpleBg
                          : AppColors.surfaceVerySoftPurple),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.admin_panel_settings,
                          size: 14,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        SizedBox(width: 6),
                        Text(
                          l10n.institutionAdmin,
                          style: CustomTextStyles.bengali(
                            fontSize: 12,
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    l10n.dashboard,
                    style: CustomTextStyles.bengali(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "আজকের প্রতিষ্ঠান কার্যক্রম এক নজরে দেখুন",
                    style: CustomTextStyles.bengali(
                      fontSize: 14,
                      color:
                          (Theme.of(context).textTheme.bodyMedium?.color ??
                          Theme.of(context).colorScheme.onSurfaceVariant),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24),

            // Quick Actions
            SectionHeader(title: l10n.quickActions),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  QuickActionCard(
                    icon: Icons.person_add,
                    label: l10n.addStudent,
                    iconColor: Theme.of(context).colorScheme.primary,
                    iconBgColor:
                        (Theme.of(context).brightness == Brightness.dark
                        ? AppColors.darkBadgePurpleBg
                        : AppColors.surfaceVerySoftPurple),
                  ),
                  QuickActionCard(
                    icon: Icons.person_add_alt_1,
                    label: l10n.addTeacher,
                    iconColor: Theme.of(context).colorScheme.primary,
                    iconBgColor:
                        (Theme.of(context).brightness == Brightness.dark
                        ? AppColors.darkBadgeTealBg
                        : AppColors.surfaceVerySoftPurple),
                  ),
                  QuickActionCard(
                    icon: Icons.account_balance_wallet,
                    label: l10n.collectFee,
                    iconColor: AppColors.warmGold,
                    iconBgColor:
                        (Theme.of(context).brightness == Brightness.dark
                        ? AppColors.darkBadgeGoldBg
                        : AppColors.softWarmGold),
                  ),
                  QuickActionCard(
                    icon: Icons.edit_document,
                    label: l10n.enterMarks,
                    iconColor: Theme.of(context).colorScheme.primary,
                    iconBgColor:
                        (Theme.of(context).brightness == Brightness.dark
                        ? AppColors.darkBadgePurpleBg
                        : AppColors.surfaceVerySoftPurple),
                  ),
                  QuickActionCard(
                    icon: Icons.campaign,
                    label: l10n.makeAnnouncement,
                    iconColor: Theme.of(context).colorScheme.primary,
                    iconBgColor:
                        (Theme.of(context).brightness == Brightness.dark
                        ? AppColors.darkBadgeTealBg
                        : AppColors.surfaceVerySoftPurple),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24),

            // Primary Stat Cards
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 1.05,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  MetricCard(
                    title: l10n.students,
                    value: "1",
                    subtitle: l10n.students,
                    icon: Icons.school,
                    iconColor: AppColors.deepPurple,
                    iconBgColor: AppColors.softPurple,
                  ),
                  MetricCard(
                    title: l10n.todaysAttendance,
                    value: "—",
                    subtitle: "আজ কোনো ক্লাস পিরিয়ড নির্ধারিত নেই",
                    icon: Icons.fact_check,
                    iconColor: Theme.of(context).colorScheme.primary,
                    iconBgColor:
                        (Theme.of(context).brightness == Brightness.dark
                        ? AppColors.darkBadgeTealBg
                        : AppColors.surfaceVerySoftPurple),
                  ),
                  MetricCard(
                    title: l10n.presentTeachers,
                    value: "—",
                    subtitle: "কোনো সক্রিয় রেকর্ড নেই",
                    icon: Icons.co_present,
                    iconColor: Colors.blue,
                    iconBgColor:
                        (Theme.of(context).brightness == Brightness.dark
                        ? AppColors.darkSurface
                        : AppColors.paleBlueSurface),
                  ),
                  MetricCard(
                    title: l10n.presentStaff,
                    value: "—",
                    subtitle: "কোনো সক্রিয় রেকর্ড নেই",
                    icon: Icons.business_center,
                    iconColor: AppColors.warmGold,
                    iconBgColor:
                        (Theme.of(context).brightness == Brightness.dark
                        ? AppColors.darkBadgeGoldBg
                        : AppColors.softWarmGold),
                  ),
                  MetricCard(
                    title: l10n.gateArrivals,
                    value: "0 / 1",
                    subtitle: "0 জন বের হয়েছে · 0 জন ভিতরে",
                    icon: Icons.door_front_door,
                    iconColor: Theme.of(context).colorScheme.primary,
                    iconBgColor:
                        (Theme.of(context).brightness == Brightness.dark
                        ? AppColors.darkBadgeTealBg
                        : AppColors.surfaceVerySoftPurple),
                  ),
                  MetricCard(
                    title: l10n.feeCollectionThisMonth,
                    value: "৳0",
                    subtitle: "৳0 ইনভয়েসের মধ্যে",
                    icon: Icons.account_balance_wallet,
                    iconColor: AppColors.warmGold,
                    iconBgColor:
                        (Theme.of(context).brightness == Brightness.dark
                        ? AppColors.darkBadgeGoldBg
                        : AppColors.softWarmGold),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24),

            // Students Chart Placeholder
            SectionHeader(title: l10n.studentsByClass),
            DashboardSectionCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 190,
                    child: Column(
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(
                                  5,
                                  (index) => Divider(
                                    color:
                                        (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? AppColors.darkBorder
                                        : AppColors.divider),
                                    height: 1,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  width: double.infinity,
                                  height: 35,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 50,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.primary,
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(6),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color:
                              (Theme.of(context).brightness == Brightness.dark
                              ? AppColors.darkBorder
                              : AppColors.divider),
                          height: 1,
                          thickness: 1,
                        ),
                        SizedBox(height: 12),
                        Text(
                          "Baby Class",
                          style: TextStyle(
                            fontSize: 12,
                            color:
                                (Theme.of(context).brightness == Brightness.dark
                                ? AppColors.darkTextMuted
                                : AppColors.textMuted),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Fee Trend Placeholder
            SectionHeader(title: l10n.feeCollectionTrend),
            DashboardSectionCard(
              child: SizedBox(
                height: 150,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color:
                              (Theme.of(context).brightness == Brightness.dark
                              ? AppColors.darkSurface
                              : AppColors.paleBlueSurface),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.bar_chart,
                          size: 28,
                          color:
                              (Theme.of(context).brightness == Brightness.dark
                              ? AppColors.darkTextMuted
                              : AppColors.textMuted),
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        "এখনও কোনো তথ্য নেই",
                        style: CustomTextStyles.bengali(
                          fontSize: 14,
                          color:
                              (Theme.of(context).brightness == Brightness.dark
                              ? AppColors.darkTextMuted
                              : AppColors.textMuted),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "গত ১২ মাস",
                        style: TextStyle(
                          fontSize: 12,
                          color:
                              (Theme.of(context).brightness == Brightness.dark
                              ? AppColors.darkTextMuted
                              : AppColors.textMuted),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Upcoming Exams
            SectionHeader(title: l10n.upcomingExams),
            DashboardSectionCard(
              child: Center(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: (Theme.of(context).brightness == Brightness.dark
                            ? AppColors.darkBadgePurpleBg
                            : AppColors.surfaceVerySoftPurple),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.event_note,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "কোনো আসন্ন পরীক্ষা নির্ধারিত নেই",
                      style: CustomTextStyles.bengali(
                        fontSize: 14,
                        color:
                            (Theme.of(context).textTheme.bodyMedium?.color ??
                            Theme.of(context).colorScheme.onSurfaceVariant),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Pending Approvals
            SectionHeader(title: l10n.pendingApprovals),
            DashboardSectionCard(
              child: Column(
                children: [
                  ApprovalRow(
                    title: "মার্ক ব্যাচ",
                    subtitle: "অনুমোদনের অপেক্ষায়",
                    count: "0",
                    icon: Icons.checklist,
                    iconColor: Theme.of(context).colorScheme.primary,
                    iconBgColor:
                        (Theme.of(context).brightness == Brightness.dark
                        ? AppColors.darkBadgePurpleBg
                        : AppColors.surfaceVerySoftPurple),
                  ),
                  ApprovalRow(
                    title: "ছুটির আবেদন",
                    subtitle: "পর্যালোচনার অপেক্ষায়",
                    count: "0",
                    icon: Icons.event_busy,
                    iconColor: Theme.of(context).colorScheme.primary,
                    iconBgColor:
                        (Theme.of(context).brightness == Brightness.dark
                        ? AppColors.darkBadgeTealBg
                        : AppColors.surfaceVerySoftPurple),
                  ),
                  ApprovalRow(
                    title: "ফি ছাড়",
                    subtitle: "অনুমোদনের অপেক্ষায়",
                    count: "0",
                    icon: Icons.volunteer_activism,
                    iconColor: AppColors.warmGold,
                    iconBgColor:
                        (Theme.of(context).brightness == Brightness.dark
                        ? AppColors.darkBadgeGoldBg
                        : AppColors.softWarmGold),
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
