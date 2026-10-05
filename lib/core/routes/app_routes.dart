import 'package:schoolmate/core/file_path.dart';
import 'package:schoolmate/features/onboarding/presentation/pages/role_selection_page.dart';
import 'package:schoolmate/features/onboarding/presentation/pages/splash_page.dart';
import 'package:schoolmate/features/settings/presentation/pages/change_password_page.dart';

class AppRoutes {
  // === Auth & Initial Routes ===
  static const String initial = SplashPage.routeName;
  static const String login = '/login';
  static const String onboarding = OnboardingPage.routeName;
  static const String roleSelection = RoleSelectionPage.routeName;
  static const String more = MorePage.routeName;
  static const String settings = SettingsPage.routeName;

  // === Core Dashboards ===
  static const String institutionAdminDashboard =
      InstitutionAdminDashboardPage.routeName;
  static const String teacherDashboard = TeacherDashboardPage.routeName;
  static const String studentDashboard = StudentDashboardPage.routeName;

  // === Institution Admin Drawer Pages ===
  static const String institutionProfile = InstitutionProfilePage.routeName;
  static const String multiTrack = MultiTrackPage.routeName;
  static const String boardAffiliations = BoardAffiliationsPage.routeName;
  static const String smcGoverningBody = SmcGoverningBodyPage.routeName;
  static const String campuses = CampusesPage.routeName;
  static const String branches = BranchesPage.routeName;
  static const String academic = AcademicPage.routeName;
  static const String timetable = TimetablePage.routeName;
  static const String documentTemplates = DocumentTemplatesPage.routeName;
  static const String students = StudentsPage.routeName;
  static const String teachersStaff = TeachersStaffPage.routeName;
  static const String users = UsersPage.routeName;
  static const String examination = ExaminationPage.routeName;
  static const String attendance = AttendancePage.routeName;
  static const String certificates = CertificatesPage.routeName;
  static const String fee = FeePage.routeName;
  static const String finance = FinancePage.routeName;
  static const String paymentGateways = PaymentGatewaysPage.routeName;
  static const String onlineAdmission = OnlineAdmissionPage.routeName;
  static const String inventory = InventoryPage.routeName;
  static const String communication = CommunicationPage.routeName;
  static const String website = WebsitePage.routeName;
  static const String activityLog = ActivityLogPage.routeName;
  static const String account = AccountPage.routeName;
  static const String changePassword = ChangePasswordPage.routeName;

  // === Academic Sub-pages ===
  static final String years = YearsPage.routeName;
  static const String calendar = CalendarPage.routeName;
  static const String shifts = ShiftsPage.routeName;
  static const String programStructures = ProgramStructuresPage.routeName;
  static const String gradingScales = GradingScalesPage.routeName;
  static const String componentTypes = ComponentTypesPage.routeName;
  static const String classesSections = ClassesSectionsPage.routeName;
  static const String groupsStreams = GroupsStreamsPage.routeName;
  static const String subjects = SubjectsPage.routeName;
  static const String subjectAssignments = SubjectAssignmentsPage.routeName;
  static const String prePrimary = PrePrimaryPage.routeName;
  static const String lessonPlans = LessonPlansPage.routeName;
  static const String curriculum = CurriculumPage.routeName;
  static const String syllabus = SyllabusPage.routeName;
  static const String studyPlans = StudyPlansPage.routeName;

  // === Timetable Sub-pages ===
  static const String periodSlots = PeriodSlotsPage.routeName;
  static const String rooms = RoomsPage.routeName;
  static const String classTimetable = ClassTimetablePage.routeName;
  static const String shiftTimetable = ShiftTimetablePage.routeName;
  static const String teacherTimetable = TeacherTimetablePage.routeName;
  static const String roomTimetable = RoomTimetablePage.routeName;
  static const String subjectDistributionRules =
      SubjectDistributionRulesPage.routeName;
  static const String teacherAvailability = TeacherAvailabilityPage.routeName;
  static const String publish = PublishPage.routeName;
  static const String substituteAssignment = SubstituteAssignmentPage.routeName;
  static const String revisions = RevisionsPage.routeName;
  static const String periodSwap = PeriodSwapPage.routeName;

  // === Teachers & Staff Sub-pages ===
  static const String teachers = TeachersPage.routeName;
  static const String staff = StaffPage.routeName;
  static const String recruitment = RecruitmentPage.routeName;
  static const String leaveTypes = LeaveTypesPage.routeName;
  static const String academicDesignations = AcademicDesignationsPage.routeName;
  static const String bulkImportAssignments =
      BulkImportAssignmentsPage.routeName;
  static const String subjectAssignmentMatrix =
      SubjectAssignmentMatrixPage.routeName;

  // === Examination Sub-pages ===
  static const String exams = ExamsPage.routeName;
  static const String examTerms = ExamTermsPage.routeName;
  static const String examTypes = ExamTypesPage.routeName;
  static const String boardSubjectCombinations =
      BoardSubjectCombinationsPage.routeName;
  static const String backlogImprovementRules =
      BacklogImprovementRulesPage.routeName;
  static const String questionBank = QuestionBankPage.routeName;
  static const String questionPapers = QuestionPapersPage.routeName;
  static const String marksEntry = MarksEntryPage.routeName;
  static const String marksApprovalQueue = MarksApprovalQueuePage.routeName;
  static const String resultCompositions = ResultCompositionsPage.routeName;
  static const String weightProfiles = WeightProfilesPage.routeName;
  static const String rankingProfiles = RankingProfilesPage.routeName;
  static const String graceMarkPolicies = GraceMarkPoliciesPage.routeName;
  static const String compartmentalEligibilityPolicies =
      CompartmentalEligibilityPoliciesPage.routeName;
  static const String assessmentDomains = AssessmentDomainsPage.routeName;
  static const String prePrimaryAssessment = PrePrimaryAssessmentPage.routeName;
  static const String developmentalMilestones =
      DevelopmentalMilestonesPage.routeName;
  static const String milestoneTracker = MilestoneTrackerPage.routeName;

  // === Attendance Sub-pages ===
  static const String dailySummary = DailySummaryPage.routeName;
  static const String shiftAttendance = ShiftAttendancePage.routeName;
  static const String monthlyAttendance = MonthlyAttendancePage.routeName;
  static const String attendanceEligibility =
      AttendanceEligibilityPage.routeName;
  static const String teacherAttendance = TeacherAttendancePage.routeName;
  static const String staffAttendance = StaffAttendancePage.routeName;
  static const String teacherMonthlyReport = TeacherMonthlyReportPage.routeName;
  static const String subjectCoverageReport =
      SubjectCoverageReportPage.routeName;
  static const String attendanceAnalytics = AttendanceAnalyticsPage.routeName;
  static const String attendanceDevices = AttendanceDevicesPage.routeName;
  static const String instituteGateAttendance =
      InstituteGateAttendancePage.routeName;
  static const String attendanceEvents = AttendanceEventsPage.routeName;
  static const String practicalLabAttendance =
      PracticalLabAttendancePage.routeName;
  static const String practicalLabSummary = PracticalLabSummaryPage.routeName;
  static const String combinedEligibility = CombinedEligibilityPage.routeName;

  // === Certificates Sub-pages ===
  static const String issueCertificates = IssueCertificatesPage.routeName;
  static const String templates = TemplatesPage.routeName;

  // === Fee Sub-pages ===
  static const String feeHeads = FeeHeadsPage.routeName;
  static const String feeStructure = FeeStructurePage.routeName;
  static const String lateFeeRules = LateFeeRulesPage.routeName;
  static const String instalmentPlans = InstalmentPlansPage.routeName;
  static const String shiftFeeStructure = ShiftFeeStructurePage.routeName;
  static const String invoices = InvoicesPage.routeName;
  static const String dueTracking = DueTrackingPage.routeName;
  static const String defaulterList = DefaulterListPage.routeName;
  static const String collectPayment = CollectPaymentPage.routeName;
  static const String onlinePayments = OnlinePaymentsPage.routeName;
  static const String duesBasedAccess = DuesBasedAccessPage.routeName;
  static const String governmentStipend = GovernmentStipendPage.routeName;
  static const String feeReports = FeeReportsPage.routeName;
  static const String studentLedger = StudentLedgerPage.routeName;

  // === Finance Sub-pages ===
  static const String chartOfAccounts = ChartOfAccountsPage.routeName;
  static const String vouchers = VouchersPage.routeName;
  static const String newVoucher = NewVoucherPage.routeName;
  static const String newDebitCreditNote = NewDebitCreditNotePage.routeName;
  static const String expenses = ExpensesPage.routeName;
  static const String newExpense = NewExpensePage.routeName;
  static const String income = IncomePage.routeName;
  static const String newIncome = NewIncomePage.routeName;
  static const String autoPostingSettings = AutoPostingSettingsPage.routeName;
  static const String generalLedger = GeneralLedgerPage.routeName;
  static const String trialBalance = TrialBalancePage.routeName;
  static const String incomeStatement = IncomeStatementPage.routeName;
  static const String balanceSheet = BalanceSheetPage.routeName;
  static const String cashBook = CashBookPage.routeName;
  static const String bankBook = BankBookPage.routeName;
  static const String budgets = BudgetsPage.routeName;
  static const String budgetVsActual = BudgetVsActualPage.routeName;

  // === Inventory Sub-pages ===
  static const String assets = AssetsPage.routeName;
  static const String stockItems = StockItemsPage.routeName;
  static const String warehouses = WarehousesPage.routeName;
  static const String vendors = VendorsPage.routeName;
  static const String procurementRequests = ProcurementRequestsPage.routeName;
  static const String purchaseOrders = PurchaseOrdersPage.routeName;
  static const String goodsReceipts = GoodsReceiptsPage.routeName;

  // === Communication Sub-pages ===
  static const String bulkSms = BulkSmsPage.routeName;
  static const String bulkEmail = BulkEmailPage.routeName;
  static const String smsGateways = SmsGatewaysPage.routeName;
  static const String emailSettings = EmailSettingsPage.routeName;
  static const String announcements = AnnouncementsPage.routeName;
  static const String noticeBoard = NoticeBoardPage.routeName;
  static const String emergencyBroadcast = EmergencyBroadcastPage.routeName;
  static const String messages = MessagesPage.routeName;
  static const String notifications = NotificationsPage.routeName;
}
