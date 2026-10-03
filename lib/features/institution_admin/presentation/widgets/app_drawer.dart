import 'package:go_router/go_router.dart';
import 'package:schoolmate/core/file_path.dart';



class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final String currentRoute = GoRouterState.of(context).uri.toString();
    return Drawer(
      backgroundColor: AppColors.background,
      child: SafeArea(
        child: Column(
          children: [

            // Institution Profile Header
            InkWell(
              onTap: () {
                Scaffold.of(context).closeDrawer();
                context.push(AppRoutes.institutionProfile);
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 32.0, bottom: 24.0, left: 24.0, right: 24.0),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  border: Border(
                    bottom: BorderSide(color: AppColors.divider, width: 1),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: AppColors.primaryPurple.withOpacity(0.1),
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.primaryPurple.withOpacity(0.2), width: 2),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.domain,
                          color: AppColors.primaryPurple,
                          size: 32,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Dhaka Public School",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "View Institution Profile",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryPurple,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.arrow_forward,
                          color: AppColors.primaryPurple,
                          size: 14,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Header / Search Area
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryPurple.withOpacity(0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  style: const TextStyle(color: AppColors.textPrimary),
                  decoration: InputDecoration(
                    hintText: "Find a page...",
                    hintStyle: const TextStyle(color: AppColors.textMuted),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: AppColors.inactiveIcon,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
            ),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(
                  bottom: 24.0,
                  left: 16.0,
                  right: 16.0,
                ),
                children: [
                  _buildDrawerItem(
                    icon: Icons.bar_chart,
                    title: "Dashboard",
                    iconColor: AppColors.primaryPurple,
                    iconBgColor: AppColors.surfaceVerySoftPurple,
                    isSelected:
                        currentRoute == AppRoutes.institutionAdminDashboard,
                    onTap: () => context.push(AppRoutes.institutionAdminDashboard),
                  ),

                  _buildSectionHeader("INSTITUTION SETUP"),
                  
                  _buildDrawerItem(
                    icon: Icons.layers_outlined,
                    title: "Multi-Track",
                    isSelected: currentRoute == AppRoutes.multiTrack,
                    onTap: () => context.push(AppRoutes.multiTrack),
                  ),
                  _buildDrawerItem(
                    icon: Icons.account_balance,
                    title: "Board Affiliations",
                    isSelected: currentRoute == AppRoutes.boardAffiliations,
                    onTap: () => context.push(AppRoutes.boardAffiliations),
                  ),
                  _buildDrawerItem(
                    icon: Icons.people_outline,
                    title: "SMC / Governing Body",
                    isSelected: currentRoute == AppRoutes.smcGoverningBody,
                    onTap: () => context.push(AppRoutes.smcGoverningBody),
                  ),
                  _buildDrawerItem(
                    icon: Icons.location_on_outlined,
                    title: "Campuses",
                    isSelected: currentRoute == AppRoutes.campuses,
                    onTap: () => context.push(AppRoutes.campuses),
                  ),
                  _buildDrawerItem(
                    icon: Icons.account_tree_outlined,
                    title: "Branches",
                    isSelected: currentRoute == AppRoutes.branches,
                    onTap: () => context.push(AppRoutes.branches),
                  ),
                  
                  
                  ExpandableDrawerItem(
                    icon: Icons.calendar_today_outlined,
                    title: "Academic",
                    isInitiallyExpanded: currentRoute.contains('/academic') || 
                                         currentRoute == AppRoutes.years ||
                                         currentRoute == AppRoutes.calendar ||
                                         currentRoute == AppRoutes.shifts ||
                                         currentRoute == AppRoutes.programStructures ||
                                         currentRoute == AppRoutes.gradingScales ||
                                         currentRoute == AppRoutes.componentTypes ||
                                         currentRoute == AppRoutes.classesSections ||
                                         currentRoute == AppRoutes.groupsStreams ||
                                         currentRoute == AppRoutes.subjects ||
                                         currentRoute == AppRoutes.subjectAssignments ||
                                         currentRoute == AppRoutes.prePrimary ||
                                         currentRoute == AppRoutes.lessonPlans ||
                                         currentRoute == AppRoutes.curriculum ||
                                         currentRoute == AppRoutes.syllabus ||
                                         currentRoute == AppRoutes.studyPlans,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                          children: [
                            _buildSubMenuItem(context, "Years", AppRoutes.years, currentRoute),
                            _buildSubMenuItem(context, "Calendar", AppRoutes.calendar, currentRoute),
                            _buildSubMenuItem(context, "Shifts", AppRoutes.shifts, currentRoute),
                            _buildSubMenuItem(context, "Program Structures", AppRoutes.programStructures, currentRoute),
                            _buildSubMenuItem(context, "Grading Scales", AppRoutes.gradingScales, currentRoute),
                            _buildSubMenuItem(context, "Component Types", AppRoutes.componentTypes, currentRoute),
                            _buildSubMenuItem(context, "Classes & Sections", AppRoutes.classesSections, currentRoute),
                            _buildSubMenuItem(context, "Groups / Streams", AppRoutes.groupsStreams, currentRoute),
                            _buildSubMenuItem(context, "Subjects", AppRoutes.subjects, currentRoute),
                            _buildSubMenuItem(context, "Subject Assignments", AppRoutes.subjectAssignments, currentRoute),
                            _buildSubMenuItem(context, "Pre-Primary", AppRoutes.prePrimary, currentRoute),
                            _buildSubMenuItem(context, "Lesson Plans", AppRoutes.lessonPlans, currentRoute),
                            _buildSubMenuItem(context, "Curriculum", AppRoutes.curriculum, currentRoute),
                            _buildSubMenuItem(context, "Syllabus", AppRoutes.syllabus, currentRoute),
                            _buildSubMenuItem(context, "Study Plans", AppRoutes.studyPlans, currentRoute),
                          ],
                        ),
                      ),
                    ],
                  ),
                  
                  ExpandableDrawerItem(
                    icon: Icons.access_time,
                    title: "Timetable",
                    isInitiallyExpanded: currentRoute.contains('/timetable') ||
                                         currentRoute == AppRoutes.periodSlots ||
                                         currentRoute == AppRoutes.rooms ||
                                         currentRoute == AppRoutes.classTimetable ||
                                         currentRoute == AppRoutes.shiftTimetable ||
                                         currentRoute == AppRoutes.teacherTimetable ||
                                         currentRoute == AppRoutes.roomTimetable ||
                                         currentRoute == AppRoutes.subjectDistributionRules ||
                                         currentRoute == AppRoutes.teacherAvailability ||
                                         currentRoute == AppRoutes.publish ||
                                         currentRoute == AppRoutes.substituteAssignment ||
                                         currentRoute == AppRoutes.revisions ||
                                         currentRoute == AppRoutes.periodSwap,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                          children: [
                            _buildSubMenuItem(context, "Period Slots", AppRoutes.periodSlots, currentRoute),
                            _buildSubMenuItem(context, "Rooms", AppRoutes.rooms, currentRoute),
                            _buildSubMenuItem(context, "Class Timetable", AppRoutes.classTimetable, currentRoute),
                            _buildSubMenuItem(context, "Shift Timetable", AppRoutes.shiftTimetable, currentRoute),
                            _buildSubMenuItem(context, "Teacher Timetable", AppRoutes.teacherTimetable, currentRoute),
                            _buildSubMenuItem(context, "Room Timetable", AppRoutes.roomTimetable, currentRoute),
                            _buildSubMenuItem(context, "Subject Distribution Rules", AppRoutes.subjectDistributionRules, currentRoute),
                            _buildSubMenuItem(context, "Teacher Availability", AppRoutes.teacherAvailability, currentRoute),
                            _buildSubMenuItem(context, "Publish", AppRoutes.publish, currentRoute),
                            _buildSubMenuItem(context, "Substitute Assignment", AppRoutes.substituteAssignment, currentRoute),
                            _buildSubMenuItem(context, "Revisions", AppRoutes.revisions, currentRoute),
                            _buildSubMenuItem(context, "Period Swap", AppRoutes.periodSwap, currentRoute),
                          ],
                        ),
                      ),
                    ],
                  ),
                  _buildDrawerItem(
                    icon: Icons.description_outlined,
                    title: "Document Templates",
                    isSelected: currentRoute == AppRoutes.documentTemplates,
                    onTap: () => context.push(AppRoutes.documentTemplates),
                  ),

                  _buildSectionHeader("PEOPLE"),
                  _buildDrawerItem(
                    icon: Icons.people_alt_outlined,
                    title: "Students",
                    isSelected: currentRoute == AppRoutes.students,
                    onTap: () => context.push(AppRoutes.students),
                  ),
                  
                  ExpandableDrawerItem(
                    icon: Icons.person_outline,
                    title: "Teachers & Staff",
                    isInitiallyExpanded: currentRoute.contains('/teachers-staff') ||
                                         currentRoute == AppRoutes.teachers ||
                                         currentRoute == AppRoutes.staff ||
                                         currentRoute == AppRoutes.recruitment ||
                                         currentRoute == AppRoutes.leaveTypes ||
                                         currentRoute == AppRoutes.academicDesignations ||
                                         currentRoute == AppRoutes.bulkImportAssignments ||
                                         currentRoute == AppRoutes.subjectAssignmentMatrix,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                          children: [
                            _buildSubMenuItem(context, "Teachers", AppRoutes.teachers, currentRoute),
                            _buildSubMenuItem(context, "Staff", AppRoutes.staff, currentRoute),
                            _buildSubMenuItem(context, "Recruitment", AppRoutes.recruitment, currentRoute),
                            _buildSubMenuItem(context, "Leave Types", AppRoutes.leaveTypes, currentRoute),
                            _buildSubMenuItem(context, "Academic Designations", AppRoutes.academicDesignations, currentRoute),
                            _buildSubMenuItem(context, "Bulk Import Assignments", AppRoutes.bulkImportAssignments, currentRoute),
                            _buildSubMenuItem(context, "Subject Assignment Matrix", AppRoutes.subjectAssignmentMatrix, currentRoute),
                          ],
                        ),
                      ),
                    ],
                  ),
                  _buildDrawerItem(
                    icon: Icons.manage_accounts_outlined,
                    title: "Users",
                    isSelected: currentRoute == AppRoutes.users,
                    onTap: () => context.push(AppRoutes.users),
                  ),

                  _buildSectionHeader("ACADEMICS"),
                  
                  ExpandableDrawerItem(
                    icon: Icons.assignment_outlined,
                    title: "Examination",
                    isInitiallyExpanded: currentRoute.contains('/examination') ||
                                         currentRoute == AppRoutes.exams ||
                                         currentRoute == AppRoutes.examTerms ||
                                         currentRoute == AppRoutes.examTypes ||
                                         currentRoute == AppRoutes.boardSubjectCombinations ||
                                         currentRoute == AppRoutes.backlogImprovementRules ||
                                         currentRoute == AppRoutes.questionBank ||
                                         currentRoute == AppRoutes.questionPapers ||
                                         currentRoute == AppRoutes.marksEntry ||
                                         currentRoute == AppRoutes.marksApprovalQueue ||
                                         currentRoute == AppRoutes.resultCompositions ||
                                         currentRoute == AppRoutes.weightProfiles ||
                                         currentRoute == AppRoutes.rankingProfiles ||
                                         currentRoute == AppRoutes.graceMarkPolicies ||
                                         currentRoute == AppRoutes.compartmentalEligibilityPolicies ||
                                         currentRoute == AppRoutes.assessmentDomains ||
                                         currentRoute == AppRoutes.prePrimaryAssessment ||
                                         currentRoute == AppRoutes.developmentalMilestones ||
                                         currentRoute == AppRoutes.milestoneTracker,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                          children: [
                            _buildSubMenuItem(context, "Exams", AppRoutes.exams, currentRoute),
                            _buildSubMenuItem(context, "Exam Terms", AppRoutes.examTerms, currentRoute),
                            _buildSubMenuItem(context, "Exam Types", AppRoutes.examTypes, currentRoute),
                            _buildSubMenuItem(context, "Board Subject Combinations", AppRoutes.boardSubjectCombinations, currentRoute),
                            _buildSubMenuItem(context, "Backlog/Improvement Rules", AppRoutes.backlogImprovementRules, currentRoute),
                            _buildSubMenuItem(context, "Question Bank", AppRoutes.questionBank, currentRoute),
                            _buildSubMenuItem(context, "Question Papers", AppRoutes.questionPapers, currentRoute),
                            _buildSubMenuItem(context, "Marks Entry", AppRoutes.marksEntry, currentRoute),
                            _buildSubMenuItem(context, "Marks Approval Queue", AppRoutes.marksApprovalQueue, currentRoute),
                            _buildSubMenuItem(context, "Result Compositions", AppRoutes.resultCompositions, currentRoute),
                            _buildSubMenuItem(context, "Weight Profiles", AppRoutes.weightProfiles, currentRoute),
                            _buildSubMenuItem(context, "Ranking Profiles", AppRoutes.rankingProfiles, currentRoute),
                            _buildSubMenuItem(context, "Grace Mark Policies", AppRoutes.graceMarkPolicies, currentRoute),
                            _buildSubMenuItem(context, "Compartmental Eligibility Policies", AppRoutes.compartmentalEligibilityPolicies, currentRoute),
                            _buildSubMenuItem(context, "Assessment Domains", AppRoutes.assessmentDomains, currentRoute),
                            _buildSubMenuItem(context, "Pre-Primary Assessment", AppRoutes.prePrimaryAssessment, currentRoute),
                            _buildSubMenuItem(context, "Developmental Milestones", AppRoutes.developmentalMilestones, currentRoute),
                            _buildSubMenuItem(context, "Milestone Tracker", AppRoutes.milestoneTracker, currentRoute),
                          ],
                        ),
                      ),
                    ],
                  ),
                  
                  ExpandableDrawerItem(
                    icon: Icons.fact_check_outlined,
                    title: "Attendance",
                    isInitiallyExpanded: currentRoute.contains('/attendance') ||
                                         currentRoute == AppRoutes.dailySummary ||
                                         currentRoute == AppRoutes.shiftAttendance ||
                                         currentRoute == AppRoutes.monthlyAttendance ||
                                         currentRoute == AppRoutes.attendanceEligibility ||
                                         currentRoute == AppRoutes.teacherAttendance ||
                                         currentRoute == AppRoutes.staffAttendance ||
                                         currentRoute == AppRoutes.teacherMonthlyReport ||
                                         currentRoute == AppRoutes.subjectCoverageReport ||
                                         currentRoute == AppRoutes.attendanceAnalytics ||
                                         currentRoute == AppRoutes.attendanceDevices ||
                                         currentRoute == AppRoutes.instituteGateAttendance ||
                                         currentRoute == AppRoutes.attendanceEvents ||
                                         currentRoute == AppRoutes.practicalLabAttendance ||
                                         currentRoute == AppRoutes.practicalLabSummary ||
                                         currentRoute == AppRoutes.combinedEligibility,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                          children: [
                            _buildSubMenuItem(context, "Daily Summary", AppRoutes.dailySummary, currentRoute),
                            _buildSubMenuItem(context, "Shift Attendance", AppRoutes.shiftAttendance, currentRoute),
                            _buildSubMenuItem(context, "Monthly Attendance", AppRoutes.monthlyAttendance, currentRoute),
                            _buildSubMenuItem(context, "Attendance Eligibility", AppRoutes.attendanceEligibility, currentRoute),
                            _buildSubMenuItem(context, "Teacher Attendance", AppRoutes.teacherAttendance, currentRoute),
                            _buildSubMenuItem(context, "Staff Attendance", AppRoutes.staffAttendance, currentRoute),
                            _buildSubMenuItem(context, "Teacher Monthly Report", AppRoutes.teacherMonthlyReport, currentRoute),
                            _buildSubMenuItem(context, "Subject Coverage Report", AppRoutes.subjectCoverageReport, currentRoute),
                            _buildSubMenuItem(context, "Attendance Analytics", AppRoutes.attendanceAnalytics, currentRoute),
                            _buildSubMenuItem(context, "Attendance Devices", AppRoutes.attendanceDevices, currentRoute),
                            _buildSubMenuItem(context, "Institute Gate Attendance", AppRoutes.instituteGateAttendance, currentRoute),
                            _buildSubMenuItem(context, "Attendance Events", AppRoutes.attendanceEvents, currentRoute),
                            _buildSubMenuItem(context, "Practical Lab Attendance", AppRoutes.practicalLabAttendance, currentRoute),
                            _buildSubMenuItem(context, "Practical Lab Summary", AppRoutes.practicalLabSummary, currentRoute),
                            _buildSubMenuItem(context, "Combined Eligibility", AppRoutes.combinedEligibility, currentRoute),
                          ],
                        ),
                      ),
                    ],
                  ),
                  
                  ExpandableDrawerItem(
                    icon: Icons.workspace_premium_outlined,
                    title: "Certificates",
                    isInitiallyExpanded: currentRoute.contains('/certificates') ||
                                         currentRoute == AppRoutes.issueCertificates ||
                                         currentRoute == AppRoutes.templates,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                          children: [
                            _buildSubMenuItem(context, "Issue Certificates", AppRoutes.issueCertificates, currentRoute),
                            _buildSubMenuItem(context, "Templates", AppRoutes.templates, currentRoute),
                          ],
                        ),
                      ),
                    ],
                  ),

                  _buildSectionHeader("FINANCE"),
                  
                  ExpandableDrawerItem(
                    icon: Icons.account_balance_wallet_outlined,
                    title: "Fee",
                    isInitiallyExpanded: currentRoute.contains('/fee') ||
                                         currentRoute == AppRoutes.feeHeads ||
                                         currentRoute == AppRoutes.feeStructure ||
                                         currentRoute == AppRoutes.lateFeeRules ||
                                         currentRoute == AppRoutes.instalmentPlans ||
                                         currentRoute == AppRoutes.shiftFeeStructure ||
                                         currentRoute == AppRoutes.invoices ||
                                         currentRoute == AppRoutes.dueTracking ||
                                         currentRoute == AppRoutes.defaulterList ||
                                         currentRoute == AppRoutes.collectPayment ||
                                         currentRoute == AppRoutes.onlinePayments ||
                                         currentRoute == AppRoutes.duesBasedAccess ||
                                         currentRoute == AppRoutes.governmentStipend ||
                                         currentRoute == AppRoutes.feeReports ||
                                         currentRoute == AppRoutes.studentLedger,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                          children: [
                            _buildSubMenuItem(context, "Fee Heads", AppRoutes.feeHeads, currentRoute),
                            _buildSubMenuItem(context, "Fee Structure", AppRoutes.feeStructure, currentRoute),
                            _buildSubMenuItem(context, "Late Fee Rules", AppRoutes.lateFeeRules, currentRoute),
                            _buildSubMenuItem(context, "Instalment Plans", AppRoutes.instalmentPlans, currentRoute),
                            _buildSubMenuItem(context, "Shift Fee Structure", AppRoutes.shiftFeeStructure, currentRoute),
                            _buildSubMenuItem(context, "Invoices", AppRoutes.invoices, currentRoute),
                            _buildSubMenuItem(context, "Due Tracking", AppRoutes.dueTracking, currentRoute),
                            _buildSubMenuItem(context, "Defaulter List", AppRoutes.defaulterList, currentRoute),
                            _buildSubMenuItem(context, "Collect Payment", AppRoutes.collectPayment, currentRoute),
                            _buildSubMenuItem(context, "Online Payments", AppRoutes.onlinePayments, currentRoute),
                            _buildSubMenuItem(context, "Dues-Based Access", AppRoutes.duesBasedAccess, currentRoute),
                            _buildSubMenuItem(context, "Government Stipend", AppRoutes.governmentStipend, currentRoute),
                            _buildSubMenuItem(context, "Fee Reports", AppRoutes.feeReports, currentRoute),
                            _buildSubMenuItem(context, "Student Ledger", AppRoutes.studentLedger, currentRoute),
                          ],
                        ),
                      ),
                    ],
                  ),
                  
                  ExpandableDrawerItem(
                    icon: Icons.calculate_outlined,
                    title: "Finance",
                    isInitiallyExpanded: currentRoute.contains('/finance') ||
                                         currentRoute == AppRoutes.chartOfAccounts ||
                                         currentRoute == AppRoutes.vouchers ||
                                         currentRoute == AppRoutes.newVoucher ||
                                         currentRoute == AppRoutes.newDebitCreditNote ||
                                         currentRoute == AppRoutes.expenses ||
                                         currentRoute == AppRoutes.newExpense ||
                                         currentRoute == AppRoutes.income ||
                                         currentRoute == AppRoutes.newIncome ||
                                         currentRoute == AppRoutes.autoPostingSettings ||
                                         currentRoute == AppRoutes.generalLedger ||
                                         currentRoute == AppRoutes.trialBalance ||
                                         currentRoute == AppRoutes.incomeStatement ||
                                         currentRoute == AppRoutes.balanceSheet ||
                                         currentRoute == AppRoutes.cashBook ||
                                         currentRoute == AppRoutes.bankBook ||
                                         currentRoute == AppRoutes.budgets ||
                                         currentRoute == AppRoutes.budgetVsActual,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                          children: [
                            _buildSubMenuItem(context, "Chart of Accounts", AppRoutes.chartOfAccounts, currentRoute),
                            _buildSubMenuItem(context, "Vouchers", AppRoutes.vouchers, currentRoute),
                            _buildSubMenuItem(context, "New Voucher", AppRoutes.newVoucher, currentRoute),
                            _buildSubMenuItem(context, "New Debit/Credit Note", AppRoutes.newDebitCreditNote, currentRoute),
                            _buildSubMenuItem(context, "Expenses", AppRoutes.expenses, currentRoute),
                            _buildSubMenuItem(context, "New Expense", AppRoutes.newExpense, currentRoute),
                            _buildSubMenuItem(context, "Income", AppRoutes.income, currentRoute),
                            _buildSubMenuItem(context, "New Income", AppRoutes.newIncome, currentRoute),
                            _buildSubMenuItem(context, "Auto-Posting Settings", AppRoutes.autoPostingSettings, currentRoute),
                            _buildSubMenuItem(context, "General Ledger", AppRoutes.generalLedger, currentRoute),
                            _buildSubMenuItem(context, "Trial Balance", AppRoutes.trialBalance, currentRoute),
                            _buildSubMenuItem(context, "Income Statement", AppRoutes.incomeStatement, currentRoute),
                            _buildSubMenuItem(context, "Balance Sheet", AppRoutes.balanceSheet, currentRoute),
                            _buildSubMenuItem(context, "Cash Book", AppRoutes.cashBook, currentRoute),
                            _buildSubMenuItem(context, "Bank Book", AppRoutes.bankBook, currentRoute),
                            _buildSubMenuItem(context, "Budgets", AppRoutes.budgets, currentRoute),
                            _buildSubMenuItem(context, "Budget vs Actual", AppRoutes.budgetVsActual, currentRoute),
                          ],
                        ),
                      ),
                    ],
                  ),
                  _buildDrawerItem(
                    icon: Icons.credit_card,
                    title: "Payment Gateways",
                    isSelected: currentRoute == AppRoutes.paymentGateways,
                    onTap: () => context.push(AppRoutes.paymentGateways),
                  ),

                  _buildSectionHeader("OPERATIONS"),
                  _buildDrawerItem(
                    icon: Icons.article_outlined,
                    title: "Online Admission",
                    isSelected: currentRoute == AppRoutes.onlineAdmission,
                    onTap: () => context.push(AppRoutes.onlineAdmission),
                  ),
                  
                  ExpandableDrawerItem(
                    icon: Icons.inventory_2_outlined,
                    title: "Inventory",
                    isInitiallyExpanded: currentRoute.contains('/inventory') ||
                                         currentRoute == AppRoutes.assets ||
                                         currentRoute == AppRoutes.stockItems ||
                                         currentRoute == AppRoutes.warehouses ||
                                         currentRoute == AppRoutes.vendors ||
                                         currentRoute == AppRoutes.procurementRequests ||
                                         currentRoute == AppRoutes.purchaseOrders ||
                                         currentRoute == AppRoutes.goodsReceipts,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                          children: [
                            _buildSubMenuItem(context, "Assets", AppRoutes.assets, currentRoute),
                            _buildSubMenuItem(context, "Stock Items", AppRoutes.stockItems, currentRoute),
                            _buildSubMenuItem(context, "Warehouses", AppRoutes.warehouses, currentRoute),
                            _buildSubMenuItem(context, "Vendors", AppRoutes.vendors, currentRoute),
                            _buildSubMenuItem(context, "Procurement Requests", AppRoutes.procurementRequests, currentRoute),
                            _buildSubMenuItem(context, "Purchase Orders", AppRoutes.purchaseOrders, currentRoute),
                            _buildSubMenuItem(context, "Goods Receipts", AppRoutes.goodsReceipts, currentRoute),
                          ],
                        ),
                      ),
                    ],
                  ),
                  
                  ExpandableDrawerItem(
                    icon: Icons.chat_bubble_outline,
                    title: "Communication",
                    isInitiallyExpanded: currentRoute.contains('/communication') ||
                                         currentRoute == AppRoutes.bulkSms ||
                                         currentRoute == AppRoutes.bulkEmail ||
                                         currentRoute == AppRoutes.smsGateways ||
                                         currentRoute == AppRoutes.emailSettings ||
                                         currentRoute == AppRoutes.announcements ||
                                         currentRoute == AppRoutes.noticeBoard ||
                                         currentRoute == AppRoutes.emergencyBroadcast ||
                                         currentRoute == AppRoutes.messages,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                          children: [
                            _buildSubMenuItem(context, "Bulk SMS", AppRoutes.bulkSms, currentRoute),
                            _buildSubMenuItem(context, "Bulk Email", AppRoutes.bulkEmail, currentRoute),
                            _buildSubMenuItem(context, "SMS Gateways", AppRoutes.smsGateways, currentRoute),
                            _buildSubMenuItem(context, "Email Settings", AppRoutes.emailSettings, currentRoute),
                            _buildSubMenuItem(context, "Announcements", AppRoutes.announcements, currentRoute),
                            _buildSubMenuItem(context, "Notice Board", AppRoutes.noticeBoard, currentRoute),
                            _buildSubMenuItem(context, "Emergency Broadcast", AppRoutes.emergencyBroadcast, currentRoute),
                            _buildSubMenuItem(context, "Messages", AppRoutes.messages, currentRoute),
                          ],
                        ),
                      ),
                    ],
                  ),
                  _buildDrawerItem(
                    icon: Icons.language,
                    title: "Website",
                    isSelected: currentRoute == AppRoutes.website,
                    onTap: () => context.push(AppRoutes.website),
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Divider(color: AppColors.divider, height: 1),
                  ),
                  _buildDrawerItem(
                    icon: Icons.history,
                    title: "Activity Log",
                    isSelected: currentRoute == AppRoutes.activityLog,
                    onTap: () => context.push(AppRoutes.activityLog),
                  ),


                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Divider(color: AppColors.divider, height: 1),
                  ),
                  _buildDrawerItem(
                    icon: Icons.logout,
                    title: "Logout",
                    iconColor: Colors.redAccent,
                    iconBgColor: const Color(0xFFFFEBEE),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, top: 24.0, bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: AppColors.textMuted,
          letterSpacing: 1.2,
        ),
      ),
    );
  }


  Widget _buildSubMenuItem(BuildContext context, String title, String route, String currentRoute) {
    final isSelected = currentRoute == route;
    return ListTile(
      dense: true,
      visualDensity: VisualDensity.compact,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 13,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
          color: isSelected ? AppColors.primaryPurple : AppColors.textSecondary,
        ),
      ),
      onTap: () => context.push(route),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      tileColor: isSelected ? AppColors.surfaceVerySoftPurple : Colors.transparent,
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    VoidCallback? onTap,
    bool isSelected = false,
    bool hasTrailing = false,
    Color? iconColor,
    Color? iconBgColor,
  }) {
    final defaultIconColor = isSelected
        ? AppColors.primaryPurple
        : AppColors.textSecondary;
    final defaultBgColor = isSelected
        ? AppColors.surfaceVerySoftPurple
        : Colors.transparent;

    return Container(
      margin: const EdgeInsets.only(bottom: 4.0),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: AppColors.primaryPurple.withOpacity(0.04),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]
            : [],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap ?? () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 10.0,
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: iconBgColor ?? defaultBgColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: iconColor ?? defaultIconColor,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w500,
                      color: isSelected
                          ? AppColors.primaryPurple
                          : AppColors.textPrimary,
                    ),
                  ),
                ),
                if (hasTrailing)
                  const Icon(
                    Icons.chevron_right,
                    color: AppColors.inactiveIcon,
                    size: 20,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class ExpandableDrawerItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final List<Widget> children;
  final bool isInitiallyExpanded;

  const ExpandableDrawerItem({
    super.key,
    required this.icon,
    required this.title,
    required this.children,
    this.isInitiallyExpanded = false,
  });

  @override
  State<ExpandableDrawerItem> createState() => _ExpandableDrawerItemState();
}

class _ExpandableDrawerItemState extends State<ExpandableDrawerItem> with SingleTickerProviderStateMixin {
  late bool _isExpanded;
  late AnimationController _controller;
  late Animation<double> _iconTurns;
  late Animation<double> _heightFactor;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.isInitiallyExpanded;
    _controller = AnimationController(duration: const Duration(milliseconds: 200), vsync: this);
    _iconTurns = Tween<double>(begin: 0.0, end: 0.5).animate(_controller);
    _heightFactor = _controller.drive(CurveTween(curve: Curves.easeIn));

    if (_isExpanded) {
      _controller.value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final iconColor = _isExpanded ? AppColors.primaryPurple : AppColors.textSecondary;
    final textColor = _isExpanded ? AppColors.primaryPurple : AppColors.textSecondary;

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 4.0),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: _handleTap,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                child: Row(
                  children: [
                    Icon(widget.icon, color: iconColor, size: 22),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: textColor,
                        ),
                      ),
                    ),
                    RotationTransition(
                      turns: _iconTurns,
                      child: Icon(Icons.keyboard_arrow_down, color: AppColors.inactiveIcon, size: 20),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        ClipRect(
          child: AnimatedBuilder(
            animation: _controller.view,
            builder: _buildChildren,
            child: Column(children: widget.children),
          ),
        ),
      ],
    );
  }

  Widget _buildChildren(BuildContext context, Widget? child) {
    return Align(
      heightFactor: _heightFactor.value,
      child: child,
    );
  }
}
