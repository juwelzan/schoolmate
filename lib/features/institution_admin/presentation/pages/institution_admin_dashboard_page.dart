import 'package:schoolmate/core/file_path.dart';

class InstitutionAdminDashboardPage extends StatelessWidget {
  static const String routeName = '/institution-admin-dashboard';

  const InstitutionAdminDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppColors.background,
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
                      color: AppColors.surfaceVerySoftPurple,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.admin_panel_settings,
                          size: 14,
                          color: AppColors.primaryPurple,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          l10n.institutionAdmin,
                          style: const TextStyle(
                            fontFamily: 'Noto Sans Bengali',
                            fontSize: 12,
                            color: AppColors.primaryPurple,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    l10n.dashboard,
                    style: const TextStyle(
                      fontFamily: 'Noto Sans Bengali',
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "আজকের প্রতিষ্ঠান কার্যক্রম এক নজরে দেখুন",
                    style: TextStyle(
                      fontFamily: 'Noto Sans Bengali',
                      fontSize: 14,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

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
                    iconColor: AppColors.primaryPurple,
                    iconBgColor: AppColors.surfaceVerySoftPurple,
                  ),
                  QuickActionCard(
                    icon: Icons.person_add_alt_1,
                    label: l10n.addTeacher,
                    iconColor: AppColors.primaryTeal,
                    iconBgColor: AppColors.surfaceSoftTeal,
                  ),
                  QuickActionCard(
                    icon: Icons.account_balance_wallet,
                    label: l10n.collectFee,
                    iconColor: AppColors.warmGold,
                    iconBgColor: AppColors.softWarmGold,
                  ),
                  QuickActionCard(
                    icon: Icons.edit_document,
                    label: l10n.enterMarks,
                    iconColor: AppColors.primaryPurple,
                    iconBgColor: AppColors.surfaceVerySoftPurple,
                  ),
                  QuickActionCard(
                    icon: Icons.campaign,
                    label: l10n.makeAnnouncement,
                    iconColor: AppColors.primaryTeal,
                    iconBgColor: AppColors.surfaceSoftTeal,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

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
                    iconColor: AppColors.primaryTeal,
                    iconBgColor: AppColors.surfaceSoftTeal,
                  ),
                  MetricCard(
                    title: l10n.presentTeachers,
                    value: "—",
                    subtitle: "কোনো সক্রিয় রেকর্ড নেই",
                    icon: Icons.co_present,
                    iconColor: Colors.blue,
                    iconBgColor: AppColors.paleBlueSurface,
                  ),
                  MetricCard(
                    title: l10n.presentStaff,
                    value: "—",
                    subtitle: "কোনো সক্রিয় রেকর্ড নেই",
                    icon: Icons.business_center,
                    iconColor: AppColors.warmGold,
                    iconBgColor: AppColors.softWarmGold,
                  ),
                  MetricCard(
                    title: l10n.gateArrivals,
                    value: "0 / 1",
                    subtitle: "0 জন বের হয়েছে · 0 জন ভিতরে",
                    icon: Icons.door_front_door,
                    iconColor: AppColors.primaryTeal,
                    iconBgColor: AppColors.surfaceSoftTeal,
                  ),
                  MetricCard(
                    title: l10n.feeCollectionThisMonth,
                    value: "৳0",
                    subtitle: "৳0 ইনভয়েসের মধ্যে",
                    icon: Icons.account_balance_wallet,
                    iconColor: AppColors.warmGold,
                    iconBgColor: AppColors.softWarmGold,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

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
                                  (index) => const Divider(
                                    color: AppColors.divider,
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
                                  decoration: const BoxDecoration(
                                    color: AppColors.primaryPurple,
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(6),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          color: AppColors.divider,
                          height: 1,
                          thickness: 1,
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          "Baby Class",
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.textMuted,
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
                          color: AppColors.paleBlueSurface,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.bar_chart,
                          size: 28,
                          color: AppColors.textMuted,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "এখনও কোনো তথ্য নেই",
                        style: TextStyle(
                          fontFamily: 'Noto Sans Bengali',
                          fontSize: 14,
                          color: AppColors.textMuted,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "গত ১২ মাস",
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.textMuted,
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
                      decoration: const BoxDecoration(
                        color: AppColors.surfaceVerySoftPurple,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.event_note,
                        color: AppColors.primaryPurple,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "কোনো আসন্ন পরীক্ষা নির্ধারিত নেই",
                      style: TextStyle(
                        fontFamily: 'Noto Sans Bengali',
                        fontSize: 14,
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Pending Approvals
            SectionHeader(title: l10n.pendingApprovals),
            const DashboardSectionCard(
              child: Column(
                children: [
                  ApprovalRow(
                    title: "মার্ক ব্যাচ",
                    subtitle: "অনুমোদনের অপেক্ষায়",
                    count: "0",
                    icon: Icons.checklist,
                    iconColor: AppColors.primaryPurple,
                    iconBgColor: AppColors.surfaceVerySoftPurple,
                  ),
                  ApprovalRow(
                    title: "ছুটির আবেদন",
                    subtitle: "পর্যালোচনার অপেক্ষায়",
                    count: "0",
                    icon: Icons.event_busy,
                    iconColor: AppColors.primaryTeal,
                    iconBgColor: AppColors.surfaceSoftTeal,
                  ),
                  ApprovalRow(
                    title: "ফি ছাড়",
                    subtitle: "অনুমোদনের অপেক্ষায়",
                    count: "0",
                    icon: Icons.volunteer_activism,
                    iconColor: AppColors.warmGold,
                    iconBgColor: AppColors.softWarmGold,
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
