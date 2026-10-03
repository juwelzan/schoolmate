// === Core & Feature Imports ===
import 'package:go_router/go_router.dart';
import 'package:schoolmate/core/file_path.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.initial,
    routes: [
      GoRoute(
        path: AppRoutes.notifications,
        builder: (context, state) => const NotificationsPage(),
      ),

      GoRoute(
        path: AppRoutes.settings,
        builder: (context, state) => const SettingsPage(),
      ),
      
      // === Academic Sub-pages ===
      GoRoute(
        path: AppRoutes.years,
        builder: (context, state) => const YearsPage(),
      ),
      GoRoute(
        path: AppRoutes.calendar,
        builder: (context, state) => const CalendarPage(),
      ),
      GoRoute(
        path: AppRoutes.shifts,
        builder: (context, state) => const ShiftsPage(),
      ),
      GoRoute(
        path: AppRoutes.programStructures,
        builder: (context, state) => const ProgramStructuresPage(),
      ),
      GoRoute(
        path: AppRoutes.gradingScales,
        builder: (context, state) => const GradingScalesPage(),
      ),
      GoRoute(
        path: AppRoutes.componentTypes,
        builder: (context, state) => const ComponentTypesPage(),
      ),
      GoRoute(
        path: AppRoutes.classesSections,
        builder: (context, state) => const ClassesSectionsPage(),
      ),
      GoRoute(
        path: AppRoutes.groupsStreams,
        builder: (context, state) => const GroupsStreamsPage(),
      ),
      GoRoute(
        path: AppRoutes.subjects,
        builder: (context, state) => const SubjectsPage(),
      ),
      GoRoute(
        path: AppRoutes.subjectAssignments,
        builder: (context, state) => const SubjectAssignmentsPage(),
      ),
      GoRoute(
        path: AppRoutes.prePrimary,
        builder: (context, state) => const PrePrimaryPage(),
      ),
      GoRoute(
        path: AppRoutes.lessonPlans,
        builder: (context, state) => const LessonPlansPage(),
      ),
      GoRoute(
        path: AppRoutes.curriculum,
        builder: (context, state) => const CurriculumPage(),
      ),
      GoRoute(
        path: AppRoutes.syllabus,
        builder: (context, state) => const SyllabusPage(),
      ),
      GoRoute(
        path: AppRoutes.studyPlans,
        builder: (context, state) => const StudyPlansPage(),
      ),
      
      // === Timetable Sub-pages ===
      GoRoute(
        path: AppRoutes.periodSlots,
        builder: (context, state) => const PeriodSlotsPage(),
      ),
      GoRoute(
        path: AppRoutes.rooms,
        builder: (context, state) => const RoomsPage(),
      ),
      GoRoute(
        path: AppRoutes.classTimetable,
        builder: (context, state) => const ClassTimetablePage(),
      ),
      GoRoute(
        path: AppRoutes.shiftTimetable,
        builder: (context, state) => const ShiftTimetablePage(),
      ),
      GoRoute(
        path: AppRoutes.teacherTimetable,
        builder: (context, state) => const TeacherTimetablePage(),
      ),
      GoRoute(
        path: AppRoutes.roomTimetable,
        builder: (context, state) => const RoomTimetablePage(),
      ),
      GoRoute(
        path: AppRoutes.subjectDistributionRules,
        builder: (context, state) => const SubjectDistributionRulesPage(),
      ),
      GoRoute(
        path: AppRoutes.teacherAvailability,
        builder: (context, state) => const TeacherAvailabilityPage(),
      ),
      GoRoute(
        path: AppRoutes.publish,
        builder: (context, state) => const PublishPage(),
      ),
      GoRoute(
        path: AppRoutes.substituteAssignment,
        builder: (context, state) => const SubstituteAssignmentPage(),
      ),
      GoRoute(
        path: AppRoutes.revisions,
        builder: (context, state) => const RevisionsPage(),
      ),
      GoRoute(
        path: AppRoutes.periodSwap,
        builder: (context, state) => const PeriodSwapPage(),
      ),
      
      // === Teachers & Staff Sub-pages ===
      GoRoute(
        path: AppRoutes.teachers,
        builder: (context, state) => const TeachersPage(),
      ),
      GoRoute(
        path: AppRoutes.staff,
        builder: (context, state) => const StaffPage(),
      ),
      GoRoute(
        path: AppRoutes.recruitment,
        builder: (context, state) => const RecruitmentPage(),
      ),
      GoRoute(
        path: AppRoutes.leaveTypes,
        builder: (context, state) => const LeaveTypesPage(),
      ),
      GoRoute(
        path: AppRoutes.academicDesignations,
        builder: (context, state) => const AcademicDesignationsPage(),
      ),
      GoRoute(
        path: AppRoutes.bulkImportAssignments,
        builder: (context, state) => const BulkImportAssignmentsPage(),
      ),
      GoRoute(
        path: AppRoutes.subjectAssignmentMatrix,
        builder: (context, state) => const SubjectAssignmentMatrixPage(),
      ),
      
      // === Examination Sub-pages ===
      GoRoute(
        path: AppRoutes.exams,
        builder: (context, state) => const ExamsPage(),
      ),
      GoRoute(
        path: AppRoutes.examTerms,
        builder: (context, state) => const ExamTermsPage(),
      ),
      GoRoute(
        path: AppRoutes.examTypes,
        builder: (context, state) => const ExamTypesPage(),
      ),
      GoRoute(
        path: AppRoutes.boardSubjectCombinations,
        builder: (context, state) => const BoardSubjectCombinationsPage(),
      ),
      GoRoute(
        path: AppRoutes.backlogImprovementRules,
        builder: (context, state) => const BacklogImprovementRulesPage(),
      ),
      GoRoute(
        path: AppRoutes.questionBank,
        builder: (context, state) => const QuestionBankPage(),
      ),
      GoRoute(
        path: AppRoutes.questionPapers,
        builder: (context, state) => const QuestionPapersPage(),
      ),
      GoRoute(
        path: AppRoutes.marksEntry,
        builder: (context, state) => const MarksEntryPage(),
      ),
      GoRoute(
        path: AppRoutes.marksApprovalQueue,
        builder: (context, state) => const MarksApprovalQueuePage(),
      ),
      GoRoute(
        path: AppRoutes.resultCompositions,
        builder: (context, state) => const ResultCompositionsPage(),
      ),
      GoRoute(
        path: AppRoutes.weightProfiles,
        builder: (context, state) => const WeightProfilesPage(),
      ),
      GoRoute(
        path: AppRoutes.rankingProfiles,
        builder: (context, state) => const RankingProfilesPage(),
      ),
      GoRoute(
        path: AppRoutes.graceMarkPolicies,
        builder: (context, state) => const GraceMarkPoliciesPage(),
      ),
      GoRoute(
        path: AppRoutes.compartmentalEligibilityPolicies,
        builder: (context, state) => const CompartmentalEligibilityPoliciesPage(),
      ),
      GoRoute(
        path: AppRoutes.assessmentDomains,
        builder: (context, state) => const AssessmentDomainsPage(),
      ),
      GoRoute(
        path: AppRoutes.prePrimaryAssessment,
        builder: (context, state) => const PrePrimaryAssessmentPage(),
      ),
      GoRoute(
        path: AppRoutes.developmentalMilestones,
        builder: (context, state) => const DevelopmentalMilestonesPage(),
      ),
      GoRoute(
        path: AppRoutes.milestoneTracker,
        builder: (context, state) => const MilestoneTrackerPage(),
      ),
      
      // === Attendance Sub-pages ===
      GoRoute(
        path: AppRoutes.dailySummary,
        builder: (context, state) => const DailySummaryPage(),
      ),
      GoRoute(
        path: AppRoutes.shiftAttendance,
        builder: (context, state) => const ShiftAttendancePage(),
      ),
      GoRoute(
        path: AppRoutes.monthlyAttendance,
        builder: (context, state) => const MonthlyAttendancePage(),
      ),
      GoRoute(
        path: AppRoutes.attendanceEligibility,
        builder: (context, state) => const AttendanceEligibilityPage(),
      ),
      GoRoute(
        path: AppRoutes.teacherAttendance,
        builder: (context, state) => const TeacherAttendancePage(),
      ),
      GoRoute(
        path: AppRoutes.staffAttendance,
        builder: (context, state) => const StaffAttendancePage(),
      ),
      GoRoute(
        path: AppRoutes.teacherMonthlyReport,
        builder: (context, state) => const TeacherMonthlyReportPage(),
      ),
      GoRoute(
        path: AppRoutes.subjectCoverageReport,
        builder: (context, state) => const SubjectCoverageReportPage(),
      ),
      GoRoute(
        path: AppRoutes.attendanceAnalytics,
        builder: (context, state) => const AttendanceAnalyticsPage(),
      ),
      GoRoute(
        path: AppRoutes.attendanceDevices,
        builder: (context, state) => const AttendanceDevicesPage(),
      ),
      GoRoute(
        path: AppRoutes.instituteGateAttendance,
        builder: (context, state) => const InstituteGateAttendancePage(),
      ),
      GoRoute(
        path: AppRoutes.attendanceEvents,
        builder: (context, state) => const AttendanceEventsPage(),
      ),
      GoRoute(
        path: AppRoutes.practicalLabAttendance,
        builder: (context, state) => const PracticalLabAttendancePage(),
      ),
      GoRoute(
        path: AppRoutes.practicalLabSummary,
        builder: (context, state) => const PracticalLabSummaryPage(),
      ),
      GoRoute(
        path: AppRoutes.combinedEligibility,
        builder: (context, state) => const CombinedEligibilityPage(),
      ),
      
      // === Certificates Sub-pages ===
      GoRoute(
        path: AppRoutes.issueCertificates,
        builder: (context, state) => const IssueCertificatesPage(),
      ),
      GoRoute(
        path: AppRoutes.templates,
        builder: (context, state) => const TemplatesPage(),
      ),
      
      // === Fee Sub-pages ===
      GoRoute(
        path: AppRoutes.feeHeads,
        builder: (context, state) => const FeeHeadsPage(),
      ),
      GoRoute(
        path: AppRoutes.feeStructure,
        builder: (context, state) => const FeeStructurePage(),
      ),
      GoRoute(
        path: AppRoutes.lateFeeRules,
        builder: (context, state) => const LateFeeRulesPage(),
      ),
      GoRoute(
        path: AppRoutes.instalmentPlans,
        builder: (context, state) => const InstalmentPlansPage(),
      ),
      GoRoute(
        path: AppRoutes.shiftFeeStructure,
        builder: (context, state) => const ShiftFeeStructurePage(),
      ),
      GoRoute(
        path: AppRoutes.invoices,
        builder: (context, state) => const InvoicesPage(),
      ),
      GoRoute(
        path: AppRoutes.dueTracking,
        builder: (context, state) => const DueTrackingPage(),
      ),
      GoRoute(
        path: AppRoutes.defaulterList,
        builder: (context, state) => const DefaulterListPage(),
      ),
      GoRoute(
        path: AppRoutes.collectPayment,
        builder: (context, state) => const CollectPaymentPage(),
      ),
      GoRoute(
        path: AppRoutes.onlinePayments,
        builder: (context, state) => const OnlinePaymentsPage(),
      ),
      GoRoute(
        path: AppRoutes.duesBasedAccess,
        builder: (context, state) => const DuesBasedAccessPage(),
      ),
      GoRoute(
        path: AppRoutes.governmentStipend,
        builder: (context, state) => const GovernmentStipendPage(),
      ),
      GoRoute(
        path: AppRoutes.feeReports,
        builder: (context, state) => const FeeReportsPage(),
      ),
      GoRoute(
        path: AppRoutes.studentLedger,
        builder: (context, state) => const StudentLedgerPage(),
      ),
      
      // === Finance Sub-pages ===
      GoRoute(
        path: AppRoutes.chartOfAccounts,
        builder: (context, state) => const ChartOfAccountsPage(),
      ),
      GoRoute(
        path: AppRoutes.vouchers,
        builder: (context, state) => const VouchersPage(),
      ),
      GoRoute(
        path: AppRoutes.newVoucher,
        builder: (context, state) => const NewVoucherPage(),
      ),
      GoRoute(
        path: AppRoutes.newDebitCreditNote,
        builder: (context, state) => const NewDebitCreditNotePage(),
      ),
      GoRoute(
        path: AppRoutes.expenses,
        builder: (context, state) => const ExpensesPage(),
      ),
      GoRoute(
        path: AppRoutes.newExpense,
        builder: (context, state) => const NewExpensePage(),
      ),
      GoRoute(
        path: AppRoutes.income,
        builder: (context, state) => const IncomePage(),
      ),
      GoRoute(
        path: AppRoutes.newIncome,
        builder: (context, state) => const NewIncomePage(),
      ),
      GoRoute(
        path: AppRoutes.autoPostingSettings,
        builder: (context, state) => const AutoPostingSettingsPage(),
      ),
      GoRoute(
        path: AppRoutes.generalLedger,
        builder: (context, state) => const GeneralLedgerPage(),
      ),
      GoRoute(
        path: AppRoutes.trialBalance,
        builder: (context, state) => const TrialBalancePage(),
      ),
      GoRoute(
        path: AppRoutes.incomeStatement,
        builder: (context, state) => const IncomeStatementPage(),
      ),
      GoRoute(
        path: AppRoutes.balanceSheet,
        builder: (context, state) => const BalanceSheetPage(),
      ),
      GoRoute(
        path: AppRoutes.cashBook,
        builder: (context, state) => const CashBookPage(),
      ),
      GoRoute(
        path: AppRoutes.bankBook,
        builder: (context, state) => const BankBookPage(),
      ),
      GoRoute(
        path: AppRoutes.budgets,
        builder: (context, state) => const BudgetsPage(),
      ),
      GoRoute(
        path: AppRoutes.budgetVsActual,
        builder: (context, state) => const BudgetVsActualPage(),
      ),
      
      // === Inventory Sub-pages ===
      GoRoute(
        path: AppRoutes.assets,
        builder: (context, state) => const AssetsPage(),
      ),
      GoRoute(
        path: AppRoutes.stockItems,
        builder: (context, state) => const StockItemsPage(),
      ),
      GoRoute(
        path: AppRoutes.warehouses,
        builder: (context, state) => const WarehousesPage(),
      ),
      GoRoute(
        path: AppRoutes.vendors,
        builder: (context, state) => const VendorsPage(),
      ),
      GoRoute(
        path: AppRoutes.procurementRequests,
        builder: (context, state) => const ProcurementRequestsPage(),
      ),
      GoRoute(
        path: AppRoutes.purchaseOrders,
        builder: (context, state) => const PurchaseOrdersPage(),
      ),
      GoRoute(
        path: AppRoutes.goodsReceipts,
        builder: (context, state) => const GoodsReceiptsPage(),
      ),
      
      // === Communication Sub-pages ===
      GoRoute(
        path: AppRoutes.bulkSms,
        builder: (context, state) => const BulkSmsPage(),
      ),
      GoRoute(
        path: AppRoutes.bulkEmail,
        builder: (context, state) => const BulkEmailPage(),
      ),
      GoRoute(
        path: AppRoutes.smsGateways,
        builder: (context, state) => const SmsGatewaysPage(),
      ),
      GoRoute(
        path: AppRoutes.emailSettings,
        builder: (context, state) => const EmailSettingsPage(),
      ),
      GoRoute(
        path: AppRoutes.announcements,
        builder: (context, state) => const AnnouncementsPage(),
      ),
      GoRoute(
        path: AppRoutes.noticeBoard,
        builder: (context, state) => const NoticeBoardPage(),
      ),
      GoRoute(
        path: AppRoutes.emergencyBroadcast,
        builder: (context, state) => const EmergencyBroadcastPage(),
      ),
      GoRoute(
        path: AppRoutes.messages,
        builder: (context, state) => const MessagesPage(),
      ),
      // === Institution Admin Drawer Routes ===
      GoRoute(
        path: AppRoutes.institutionProfile,
        builder: (context, state) => const InstitutionProfilePage(),
      ),
      GoRoute(
        path: AppRoutes.multiTrack,
        builder: (context, state) => const MultiTrackPage(),
      ),
      GoRoute(
        path: AppRoutes.boardAffiliations,
        builder: (context, state) => const BoardAffiliationsPage(),
      ),
      GoRoute(
        path: AppRoutes.smcGoverningBody,
        builder: (context, state) => const SmcGoverningBodyPage(),
      ),
      GoRoute(
        path: AppRoutes.campuses,
        builder: (context, state) => const CampusesPage(),
      ),
      GoRoute(
        path: AppRoutes.branches,
        builder: (context, state) => const BranchesPage(),
      ),
      GoRoute(
        path: AppRoutes.academic,
        builder: (context, state) => const AcademicPage(),
      ),
      GoRoute(
        path: AppRoutes.timetable,
        builder: (context, state) => const TimetablePage(),
      ),
      GoRoute(
        path: AppRoutes.documentTemplates,
        builder: (context, state) => const DocumentTemplatesPage(),
      ),
      GoRoute(
        path: AppRoutes.students,
        builder: (context, state) => const StudentsPage(),
      ),
      GoRoute(
        path: AppRoutes.teachersStaff,
        builder: (context, state) => const TeachersStaffPage(),
      ),
      GoRoute(
        path: AppRoutes.users,
        builder: (context, state) => const UsersPage(),
      ),
      GoRoute(
        path: AppRoutes.examination,
        builder: (context, state) => const ExaminationPage(),
      ),
      GoRoute(
        path: AppRoutes.attendance,
        builder: (context, state) => const AttendancePage(),
      ),
      GoRoute(
        path: AppRoutes.certificates,
        builder: (context, state) => const CertificatesPage(),
      ),
      GoRoute(
        path: AppRoutes.fee,
        builder: (context, state) => const FeePage(),
      ),
      GoRoute(
        path: AppRoutes.finance,
        builder: (context, state) => const FinancePage(),
      ),
      GoRoute(
        path: AppRoutes.paymentGateways,
        builder: (context, state) => const PaymentGatewaysPage(),
      ),
      GoRoute(
        path: AppRoutes.onlineAdmission,
        builder: (context, state) => const OnlineAdmissionPage(),
      ),
      GoRoute(
        path: AppRoutes.inventory,
        builder: (context, state) => const InventoryPage(),
      ),
      GoRoute(
        path: AppRoutes.communication,
        builder: (context, state) => const CommunicationPage(),
      ),
      GoRoute(
        path: AppRoutes.website,
        builder: (context, state) => const WebsitePage(),
      ),
      GoRoute(
        path: AppRoutes.activityLog,
        builder: (context, state) => const ActivityLogPage(),
      ),
      GoRoute(
        path: AppRoutes.account,
        builder: (context, state) => const AccountPage(),
      ),

      // === Initial & Auth Routes ===
      GoRoute(
        path: AppRoutes.initial,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: AppRoutes.roleSelection,
        builder: (context, state) => const RoleSelectionPage(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const Scaffold(
          body: Center(child: Text('Login Screen (Placeholder)')),
        ),
      ),
      // === Main Dashboard Routes ===
      GoRoute(
        path: AppRoutes.institutionAdminDashboard,
        builder: (context, state) => const InstitutionAdminDashboardPage(),
      ),
      GoRoute(
        path: AppRoutes.teacherDashboard,
        builder: (context, state) => const TeacherDashboardPage(),
      ),
      GoRoute(
        path: AppRoutes.studentDashboard,
        builder: (context, state) => const StudentDashboardPage(),
      ),
      GoRoute(
        path: AppRoutes.more,
        builder: (context, state) => const MorePage(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('No route defined for ${state.uri.toString()}'),
      ),
    ),
  );
}
