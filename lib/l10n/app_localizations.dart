import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_bn.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('bn'),
    Locale('en'),
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'SchoolMate'**
  String get appTitle;

  /// No description provided for @dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// No description provided for @institutionAdmin.
  ///
  /// In en, this message translates to:
  /// **'Institution Admin'**
  String get institutionAdmin;

  /// No description provided for @quickActions.
  ///
  /// In en, this message translates to:
  /// **'Quick Actions'**
  String get quickActions;

  /// No description provided for @addStudent.
  ///
  /// In en, this message translates to:
  /// **'Add Student'**
  String get addStudent;

  /// No description provided for @addTeacher.
  ///
  /// In en, this message translates to:
  /// **'Add Teacher'**
  String get addTeacher;

  /// No description provided for @collectFee.
  ///
  /// In en, this message translates to:
  /// **'Collect Fee'**
  String get collectFee;

  /// No description provided for @enterMarks.
  ///
  /// In en, this message translates to:
  /// **'Enter Marks'**
  String get enterMarks;

  /// No description provided for @makeAnnouncement.
  ///
  /// In en, this message translates to:
  /// **'Make Announcement'**
  String get makeAnnouncement;

  /// No description provided for @students.
  ///
  /// In en, this message translates to:
  /// **'Students'**
  String get students;

  /// No description provided for @todaysAttendance.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Attendance'**
  String get todaysAttendance;

  /// No description provided for @presentTeachers.
  ///
  /// In en, this message translates to:
  /// **'Present Teachers'**
  String get presentTeachers;

  /// No description provided for @presentStaff.
  ///
  /// In en, this message translates to:
  /// **'Present Staff'**
  String get presentStaff;

  /// No description provided for @gateArrivals.
  ///
  /// In en, this message translates to:
  /// **'Gate Arrivals'**
  String get gateArrivals;

  /// No description provided for @feeCollectionThisMonth.
  ///
  /// In en, this message translates to:
  /// **'Fee Collection This Month'**
  String get feeCollectionThisMonth;

  /// No description provided for @studentsByClass.
  ///
  /// In en, this message translates to:
  /// **'Students by Class'**
  String get studentsByClass;

  /// No description provided for @feeCollectionTrend.
  ///
  /// In en, this message translates to:
  /// **'Fee Collection Trend'**
  String get feeCollectionTrend;

  /// No description provided for @upcomingExams.
  ///
  /// In en, this message translates to:
  /// **'Upcoming Exams'**
  String get upcomingExams;

  /// No description provided for @pendingApprovals.
  ///
  /// In en, this message translates to:
  /// **'Pending Approvals'**
  String get pendingApprovals;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// No description provided for @roleSelectionBadge.
  ///
  /// In en, this message translates to:
  /// **'Role Selection'**
  String get roleSelectionBadge;

  /// No description provided for @roleSelectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Which role will you enter?'**
  String get roleSelectionTitle;

  /// No description provided for @roleSelectionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Select your role, we will customize the app accordingly.'**
  String get roleSelectionSubtitle;

  /// No description provided for @roleStudent.
  ///
  /// In en, this message translates to:
  /// **'Student'**
  String get roleStudent;

  /// No description provided for @roleStudentEn.
  ///
  /// In en, this message translates to:
  /// **'Student'**
  String get roleStudentEn;

  /// No description provided for @roleStudentDesc.
  ///
  /// In en, this message translates to:
  /// **'View classes, homework, results & fees'**
  String get roleStudentDesc;

  /// No description provided for @roleTeacher.
  ///
  /// In en, this message translates to:
  /// **'Teacher'**
  String get roleTeacher;

  /// No description provided for @roleTeacherEn.
  ///
  /// In en, this message translates to:
  /// **'Teacher'**
  String get roleTeacherEn;

  /// No description provided for @roleTeacherDesc.
  ///
  /// In en, this message translates to:
  /// **'Manage attendance, assignments & marks'**
  String get roleTeacherDesc;

  /// No description provided for @roleAdmin.
  ///
  /// In en, this message translates to:
  /// **'Institution'**
  String get roleAdmin;

  /// No description provided for @roleAdminEn.
  ///
  /// In en, this message translates to:
  /// **'EIIN / Admin'**
  String get roleAdminEn;

  /// No description provided for @roleAdminDesc.
  ///
  /// In en, this message translates to:
  /// **'Manage students, teachers, fees & reports'**
  String get roleAdminDesc;

  /// No description provided for @roleInfoText.
  ///
  /// In en, this message translates to:
  /// **'If you haven\'t received an ID, please contact your school admin or class teacher.'**
  String get roleInfoText;

  /// No description provided for @appTitleMain.
  ///
  /// In en, this message translates to:
  /// **'SchoolMate'**
  String get appTitleMain;

  /// No description provided for @appTitleSub.
  ///
  /// In en, this message translates to:
  /// **'SchoolMate'**
  String get appTitleSub;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @loginTrouble.
  ///
  /// In en, this message translates to:
  /// **'Having trouble logging in?'**
  String get loginTrouble;

  /// No description provided for @getHelp.
  ///
  /// In en, this message translates to:
  /// **'Get help'**
  String get getHelp;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Preferences & Account'**
  String get settingsSubtitle;

  /// No description provided for @settingsGeneral.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get settingsGeneral;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @settingsLanguageDesc.
  ///
  /// In en, this message translates to:
  /// **'Change app language (English / Bengali)'**
  String get settingsLanguageDesc;

  /// No description provided for @settingsTheme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get settingsTheme;

  /// No description provided for @settingsThemeDesc.
  ///
  /// In en, this message translates to:
  /// **'Light / Dark mode'**
  String get settingsThemeDesc;

  /// No description provided for @settingsAccount.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get settingsAccount;

  /// No description provided for @settingsChangePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get settingsChangePassword;

  /// No description provided for @settingsChangePasswordDesc.
  ///
  /// In en, this message translates to:
  /// **'Update your login password'**
  String get settingsChangePasswordDesc;

  /// No description provided for @settingsNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get settingsNotifications;

  /// No description provided for @settingsNotificationsDesc.
  ///
  /// In en, this message translates to:
  /// **'Manage alert preferences'**
  String get settingsNotificationsDesc;

  /// No description provided for @settingsSupport.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get settingsSupport;

  /// No description provided for @settingsHelpSupport.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get settingsHelpSupport;

  /// No description provided for @settingsHelpSupportDesc.
  ///
  /// In en, this message translates to:
  /// **'Contact our support team'**
  String get settingsHelpSupportDesc;

  /// No description provided for @settingsAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get settingsAbout;

  /// No description provided for @settingsAboutDesc.
  ///
  /// In en, this message translates to:
  /// **'App version and info'**
  String get settingsAboutDesc;

  /// No description provided for @settingsLogOut.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get settingsLogOut;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light Mode'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get themeDark;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'System Default'**
  String get themeSystem;

  /// No description provided for @institutionProfileTitle.
  ///
  /// In en, this message translates to:
  /// **'Institution Profile'**
  String get institutionProfileTitle;

  /// No description provided for @instIdentity.
  ///
  /// In en, this message translates to:
  /// **'Identity'**
  String get instIdentity;

  /// No description provided for @instEIIN.
  ///
  /// In en, this message translates to:
  /// **'EIIN'**
  String get instEIIN;

  /// No description provided for @instReportLang.
  ///
  /// In en, this message translates to:
  /// **'Report Language'**
  String get instReportLang;

  /// No description provided for @instBoth.
  ///
  /// In en, this message translates to:
  /// **'Both'**
  String get instBoth;

  /// No description provided for @instEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get instEnglish;

  /// No description provided for @instBangla.
  ///
  /// In en, this message translates to:
  /// **'Bangla'**
  String get instBangla;

  /// No description provided for @instContact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get instContact;

  /// No description provided for @instEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get instEmail;

  /// No description provided for @instPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get instPhone;

  /// No description provided for @instWebsite.
  ///
  /// In en, this message translates to:
  /// **'Website'**
  String get instWebsite;

  /// No description provided for @instEnterWebsite.
  ///
  /// In en, this message translates to:
  /// **'Enter website URL'**
  String get instEnterWebsite;

  /// No description provided for @instAddress.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get instAddress;

  /// No description provided for @instDivision.
  ///
  /// In en, this message translates to:
  /// **'Division'**
  String get instDivision;

  /// No description provided for @instSelectDivision.
  ///
  /// In en, this message translates to:
  /// **'Select Division'**
  String get instSelectDivision;

  /// No description provided for @instDistrict.
  ///
  /// In en, this message translates to:
  /// **'District'**
  String get instDistrict;

  /// No description provided for @instSelectDistrict.
  ///
  /// In en, this message translates to:
  /// **'Select District'**
  String get instSelectDistrict;

  /// No description provided for @instUpazila.
  ///
  /// In en, this message translates to:
  /// **'Upazila'**
  String get instUpazila;

  /// No description provided for @instSelectUpazila.
  ///
  /// In en, this message translates to:
  /// **'Select Upazila'**
  String get instSelectUpazila;

  /// No description provided for @instUnionName.
  ///
  /// In en, this message translates to:
  /// **'Union Name'**
  String get instUnionName;

  /// No description provided for @instEnterUnion.
  ///
  /// In en, this message translates to:
  /// **'Enter Union Name'**
  String get instEnterUnion;

  /// No description provided for @instVillage.
  ///
  /// In en, this message translates to:
  /// **'Village'**
  String get instVillage;

  /// No description provided for @instEnterVillage.
  ///
  /// In en, this message translates to:
  /// **'Enter Village'**
  String get instEnterVillage;

  /// No description provided for @instPostCode.
  ///
  /// In en, this message translates to:
  /// **'Post Code'**
  String get instPostCode;

  /// No description provided for @instEnterPostCode.
  ///
  /// In en, this message translates to:
  /// **'Enter Post Code'**
  String get instEnterPostCode;

  /// No description provided for @instCertSignature.
  ///
  /// In en, this message translates to:
  /// **'Certificate Signature Block'**
  String get instCertSignature;

  /// No description provided for @instCertSignatureDesc.
  ///
  /// In en, this message translates to:
  /// **'Printed on the signature line of every generated certificate (character certificate, testimonial, etc.).'**
  String get instCertSignatureDesc;

  /// No description provided for @instHeadName.
  ///
  /// In en, this message translates to:
  /// **'Principal / Head of Institution Name'**
  String get instHeadName;

  /// No description provided for @instHeadNameHint.
  ///
  /// In en, this message translates to:
  /// **'Optional — printed above the signature line'**
  String get instHeadNameHint;

  /// No description provided for @instDesignation.
  ///
  /// In en, this message translates to:
  /// **'Designation'**
  String get instDesignation;

  /// No description provided for @instPrincipalHead.
  ///
  /// In en, this message translates to:
  /// **'Principal / Head of Institution'**
  String get instPrincipalHead;

  /// No description provided for @instLogo.
  ///
  /// In en, this message translates to:
  /// **'Institution Logo'**
  String get instLogo;

  /// No description provided for @instUploadLogo.
  ///
  /// In en, this message translates to:
  /// **'Upload Logo'**
  String get instUploadLogo;

  /// No description provided for @instStamp.
  ///
  /// In en, this message translates to:
  /// **'Institution Stamp'**
  String get instStamp;

  /// No description provided for @instUploadStamp.
  ///
  /// In en, this message translates to:
  /// **'Upload Stamp'**
  String get instUploadStamp;

  /// No description provided for @instSaveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get instSaveChanges;

  /// No description provided for @drawerInstitutionSetup.
  ///
  /// In en, this message translates to:
  /// **'INSTITUTION SETUP'**
  String get drawerInstitutionSetup;

  /// No description provided for @drawerPeople.
  ///
  /// In en, this message translates to:
  /// **'PEOPLE'**
  String get drawerPeople;

  /// No description provided for @drawerAcademics.
  ///
  /// In en, this message translates to:
  /// **'ACADEMICS'**
  String get drawerAcademics;

  /// No description provided for @drawerFinance.
  ///
  /// In en, this message translates to:
  /// **'FINANCE'**
  String get drawerFinance;

  /// No description provided for @drawerOperations.
  ///
  /// In en, this message translates to:
  /// **'OPERATIONS'**
  String get drawerOperations;

  /// No description provided for @drawerAcademic.
  ///
  /// In en, this message translates to:
  /// **'Academic'**
  String get drawerAcademic;

  /// No description provided for @drawerTimetable.
  ///
  /// In en, this message translates to:
  /// **'Timetable'**
  String get drawerTimetable;

  /// No description provided for @drawerTeachersStaff.
  ///
  /// In en, this message translates to:
  /// **'Teachers & Staff'**
  String get drawerTeachersStaff;

  /// No description provided for @drawerExamination.
  ///
  /// In en, this message translates to:
  /// **'Examination'**
  String get drawerExamination;

  /// No description provided for @drawerAttendance.
  ///
  /// In en, this message translates to:
  /// **'Attendance'**
  String get drawerAttendance;

  /// No description provided for @drawerCertificates.
  ///
  /// In en, this message translates to:
  /// **'Certificates'**
  String get drawerCertificates;

  /// No description provided for @drawerFee.
  ///
  /// In en, this message translates to:
  /// **'Fee'**
  String get drawerFee;

  /// No description provided for @drawerInventory.
  ///
  /// In en, this message translates to:
  /// **'Inventory'**
  String get drawerInventory;

  /// No description provided for @drawerCommunication.
  ///
  /// In en, this message translates to:
  /// **'Communication'**
  String get drawerCommunication;

  /// No description provided for @drawerDashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get drawerDashboard;

  /// No description provided for @drawerMultitrack.
  ///
  /// In en, this message translates to:
  /// **'Multi-Track'**
  String get drawerMultitrack;

  /// No description provided for @drawerBoardAffiliations.
  ///
  /// In en, this message translates to:
  /// **'Board Affiliations'**
  String get drawerBoardAffiliations;

  /// No description provided for @drawerSmcGoverningBody.
  ///
  /// In en, this message translates to:
  /// **'SMC / Governing Body'**
  String get drawerSmcGoverningBody;

  /// No description provided for @drawerCampuses.
  ///
  /// In en, this message translates to:
  /// **'Campuses'**
  String get drawerCampuses;

  /// No description provided for @drawerBranches.
  ///
  /// In en, this message translates to:
  /// **'Branches'**
  String get drawerBranches;

  /// No description provided for @drawerDocumentTemplates.
  ///
  /// In en, this message translates to:
  /// **'Document Templates'**
  String get drawerDocumentTemplates;

  /// No description provided for @drawerStudents.
  ///
  /// In en, this message translates to:
  /// **'Students'**
  String get drawerStudents;

  /// No description provided for @drawerUsers.
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get drawerUsers;

  /// No description provided for @drawerPaymentGateways.
  ///
  /// In en, this message translates to:
  /// **'Payment Gateways'**
  String get drawerPaymentGateways;

  /// No description provided for @drawerOnlineAdmission.
  ///
  /// In en, this message translates to:
  /// **'Online Admission'**
  String get drawerOnlineAdmission;

  /// No description provided for @drawerWebsite.
  ///
  /// In en, this message translates to:
  /// **'Website'**
  String get drawerWebsite;

  /// No description provided for @drawerActivityLog.
  ///
  /// In en, this message translates to:
  /// **'Activity Log'**
  String get drawerActivityLog;

  /// No description provided for @drawerLogout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get drawerLogout;

  /// No description provided for @drawerYears.
  ///
  /// In en, this message translates to:
  /// **'Years'**
  String get drawerYears;

  /// No description provided for @drawerCalendar.
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get drawerCalendar;

  /// No description provided for @drawerShifts.
  ///
  /// In en, this message translates to:
  /// **'Shifts'**
  String get drawerShifts;

  /// No description provided for @drawerProgramStructures.
  ///
  /// In en, this message translates to:
  /// **'Program Structures'**
  String get drawerProgramStructures;

  /// No description provided for @drawerGradingScales.
  ///
  /// In en, this message translates to:
  /// **'Grading Scales'**
  String get drawerGradingScales;

  /// No description provided for @drawerComponentTypes.
  ///
  /// In en, this message translates to:
  /// **'Component Types'**
  String get drawerComponentTypes;

  /// No description provided for @drawerClassesSections.
  ///
  /// In en, this message translates to:
  /// **'Classes & Sections'**
  String get drawerClassesSections;

  /// No description provided for @drawerGroupsStreams.
  ///
  /// In en, this message translates to:
  /// **'Groups / Streams'**
  String get drawerGroupsStreams;

  /// No description provided for @drawerSubjects.
  ///
  /// In en, this message translates to:
  /// **'Subjects'**
  String get drawerSubjects;

  /// No description provided for @drawerSubjectAssignments.
  ///
  /// In en, this message translates to:
  /// **'Subject Assignments'**
  String get drawerSubjectAssignments;

  /// No description provided for @drawerPreprimary.
  ///
  /// In en, this message translates to:
  /// **'Pre-Primary'**
  String get drawerPreprimary;

  /// No description provided for @drawerLessonPlans.
  ///
  /// In en, this message translates to:
  /// **'Lesson Plans'**
  String get drawerLessonPlans;

  /// No description provided for @drawerCurriculum.
  ///
  /// In en, this message translates to:
  /// **'Curriculum'**
  String get drawerCurriculum;

  /// No description provided for @drawerSyllabus.
  ///
  /// In en, this message translates to:
  /// **'Syllabus'**
  String get drawerSyllabus;

  /// No description provided for @drawerStudyPlans.
  ///
  /// In en, this message translates to:
  /// **'Study Plans'**
  String get drawerStudyPlans;

  /// No description provided for @drawerPeriodSlots.
  ///
  /// In en, this message translates to:
  /// **'Period Slots'**
  String get drawerPeriodSlots;

  /// No description provided for @drawerRooms.
  ///
  /// In en, this message translates to:
  /// **'Rooms'**
  String get drawerRooms;

  /// No description provided for @drawerClassTimetable.
  ///
  /// In en, this message translates to:
  /// **'Class Timetable'**
  String get drawerClassTimetable;

  /// No description provided for @drawerShiftTimetable.
  ///
  /// In en, this message translates to:
  /// **'Shift Timetable'**
  String get drawerShiftTimetable;

  /// No description provided for @drawerTeacherTimetable.
  ///
  /// In en, this message translates to:
  /// **'Teacher Timetable'**
  String get drawerTeacherTimetable;

  /// No description provided for @drawerRoomTimetable.
  ///
  /// In en, this message translates to:
  /// **'Room Timetable'**
  String get drawerRoomTimetable;

  /// No description provided for @drawerSubjectDistributionRules.
  ///
  /// In en, this message translates to:
  /// **'Subject Distribution Rules'**
  String get drawerSubjectDistributionRules;

  /// No description provided for @drawerTeacherAvailability.
  ///
  /// In en, this message translates to:
  /// **'Teacher Availability'**
  String get drawerTeacherAvailability;

  /// No description provided for @drawerPublish.
  ///
  /// In en, this message translates to:
  /// **'Publish'**
  String get drawerPublish;

  /// No description provided for @drawerSubstituteAssignment.
  ///
  /// In en, this message translates to:
  /// **'Substitute Assignment'**
  String get drawerSubstituteAssignment;

  /// No description provided for @drawerRevisions.
  ///
  /// In en, this message translates to:
  /// **'Revisions'**
  String get drawerRevisions;

  /// No description provided for @drawerPeriodSwap.
  ///
  /// In en, this message translates to:
  /// **'Period Swap'**
  String get drawerPeriodSwap;

  /// No description provided for @drawerTeachers.
  ///
  /// In en, this message translates to:
  /// **'Teachers'**
  String get drawerTeachers;

  /// No description provided for @drawerStaff.
  ///
  /// In en, this message translates to:
  /// **'Staff'**
  String get drawerStaff;

  /// No description provided for @drawerRecruitment.
  ///
  /// In en, this message translates to:
  /// **'Recruitment'**
  String get drawerRecruitment;

  /// No description provided for @drawerLeaveTypes.
  ///
  /// In en, this message translates to:
  /// **'Leave Types'**
  String get drawerLeaveTypes;

  /// No description provided for @drawerAcademicDesignations.
  ///
  /// In en, this message translates to:
  /// **'Academic Designations'**
  String get drawerAcademicDesignations;

  /// No description provided for @drawerBulkImportAssignments.
  ///
  /// In en, this message translates to:
  /// **'Bulk Import Assignments'**
  String get drawerBulkImportAssignments;

  /// No description provided for @drawerSubjectAssignmentMatrix.
  ///
  /// In en, this message translates to:
  /// **'Subject Assignment Matrix'**
  String get drawerSubjectAssignmentMatrix;

  /// No description provided for @drawerExams.
  ///
  /// In en, this message translates to:
  /// **'Exams'**
  String get drawerExams;

  /// No description provided for @drawerExamTerms.
  ///
  /// In en, this message translates to:
  /// **'Exam Terms'**
  String get drawerExamTerms;

  /// No description provided for @drawerExamTypes.
  ///
  /// In en, this message translates to:
  /// **'Exam Types'**
  String get drawerExamTypes;

  /// No description provided for @drawerBoardSubjectCombinations.
  ///
  /// In en, this message translates to:
  /// **'Board Subject Combinations'**
  String get drawerBoardSubjectCombinations;

  /// No description provided for @drawerBacklogimprovementRules.
  ///
  /// In en, this message translates to:
  /// **'Backlog/Improvement Rules'**
  String get drawerBacklogimprovementRules;

  /// No description provided for @drawerQuestionBank.
  ///
  /// In en, this message translates to:
  /// **'Question Bank'**
  String get drawerQuestionBank;

  /// No description provided for @drawerQuestionPapers.
  ///
  /// In en, this message translates to:
  /// **'Question Papers'**
  String get drawerQuestionPapers;

  /// No description provided for @drawerMarksEntry.
  ///
  /// In en, this message translates to:
  /// **'Marks Entry'**
  String get drawerMarksEntry;

  /// No description provided for @drawerMarksApprovalQueue.
  ///
  /// In en, this message translates to:
  /// **'Marks Approval Queue'**
  String get drawerMarksApprovalQueue;

  /// No description provided for @drawerResultCompositions.
  ///
  /// In en, this message translates to:
  /// **'Result Compositions'**
  String get drawerResultCompositions;

  /// No description provided for @drawerWeightProfiles.
  ///
  /// In en, this message translates to:
  /// **'Weight Profiles'**
  String get drawerWeightProfiles;

  /// No description provided for @drawerRankingProfiles.
  ///
  /// In en, this message translates to:
  /// **'Ranking Profiles'**
  String get drawerRankingProfiles;

  /// No description provided for @drawerGraceMarkPolicies.
  ///
  /// In en, this message translates to:
  /// **'Grace Mark Policies'**
  String get drawerGraceMarkPolicies;

  /// No description provided for @drawerCompartmentalEligibilityPolicies.
  ///
  /// In en, this message translates to:
  /// **'Compartmental Eligibility Policies'**
  String get drawerCompartmentalEligibilityPolicies;

  /// No description provided for @drawerAssessmentDomains.
  ///
  /// In en, this message translates to:
  /// **'Assessment Domains'**
  String get drawerAssessmentDomains;

  /// No description provided for @drawerPreprimaryAssessment.
  ///
  /// In en, this message translates to:
  /// **'Pre-Primary Assessment'**
  String get drawerPreprimaryAssessment;

  /// No description provided for @drawerDevelopmentalMilestones.
  ///
  /// In en, this message translates to:
  /// **'Developmental Milestones'**
  String get drawerDevelopmentalMilestones;

  /// No description provided for @drawerMilestoneTracker.
  ///
  /// In en, this message translates to:
  /// **'Milestone Tracker'**
  String get drawerMilestoneTracker;

  /// No description provided for @drawerDailySummary.
  ///
  /// In en, this message translates to:
  /// **'Daily Summary'**
  String get drawerDailySummary;

  /// No description provided for @drawerShiftAttendance.
  ///
  /// In en, this message translates to:
  /// **'Shift Attendance'**
  String get drawerShiftAttendance;

  /// No description provided for @drawerMonthlyAttendance.
  ///
  /// In en, this message translates to:
  /// **'Monthly Attendance'**
  String get drawerMonthlyAttendance;

  /// No description provided for @drawerAttendanceEligibility.
  ///
  /// In en, this message translates to:
  /// **'Attendance Eligibility'**
  String get drawerAttendanceEligibility;

  /// No description provided for @drawerTeacherAttendance.
  ///
  /// In en, this message translates to:
  /// **'Teacher Attendance'**
  String get drawerTeacherAttendance;

  /// No description provided for @drawerStaffAttendance.
  ///
  /// In en, this message translates to:
  /// **'Staff Attendance'**
  String get drawerStaffAttendance;

  /// No description provided for @drawerTeacherMonthlyReport.
  ///
  /// In en, this message translates to:
  /// **'Teacher Monthly Report'**
  String get drawerTeacherMonthlyReport;

  /// No description provided for @drawerSubjectCoverageReport.
  ///
  /// In en, this message translates to:
  /// **'Subject Coverage Report'**
  String get drawerSubjectCoverageReport;

  /// No description provided for @drawerAttendanceAnalytics.
  ///
  /// In en, this message translates to:
  /// **'Attendance Analytics'**
  String get drawerAttendanceAnalytics;

  /// No description provided for @drawerAttendanceDevices.
  ///
  /// In en, this message translates to:
  /// **'Attendance Devices'**
  String get drawerAttendanceDevices;

  /// No description provided for @drawerInstituteGateAttendance.
  ///
  /// In en, this message translates to:
  /// **'Institute Gate Attendance'**
  String get drawerInstituteGateAttendance;

  /// No description provided for @drawerAttendanceEvents.
  ///
  /// In en, this message translates to:
  /// **'Attendance Events'**
  String get drawerAttendanceEvents;

  /// No description provided for @drawerPracticalLabAttendance.
  ///
  /// In en, this message translates to:
  /// **'Practical Lab Attendance'**
  String get drawerPracticalLabAttendance;

  /// No description provided for @drawerPracticalLabSummary.
  ///
  /// In en, this message translates to:
  /// **'Practical Lab Summary'**
  String get drawerPracticalLabSummary;

  /// No description provided for @drawerCombinedEligibility.
  ///
  /// In en, this message translates to:
  /// **'Combined Eligibility'**
  String get drawerCombinedEligibility;

  /// No description provided for @drawerIssueCertificates.
  ///
  /// In en, this message translates to:
  /// **'Issue Certificates'**
  String get drawerIssueCertificates;

  /// No description provided for @drawerTemplates.
  ///
  /// In en, this message translates to:
  /// **'Templates'**
  String get drawerTemplates;

  /// No description provided for @drawerFeeHeads.
  ///
  /// In en, this message translates to:
  /// **'Fee Heads'**
  String get drawerFeeHeads;

  /// No description provided for @drawerFeeStructure.
  ///
  /// In en, this message translates to:
  /// **'Fee Structure'**
  String get drawerFeeStructure;

  /// No description provided for @drawerLateFeeRules.
  ///
  /// In en, this message translates to:
  /// **'Late Fee Rules'**
  String get drawerLateFeeRules;

  /// No description provided for @drawerInstalmentPlans.
  ///
  /// In en, this message translates to:
  /// **'Instalment Plans'**
  String get drawerInstalmentPlans;

  /// No description provided for @drawerShiftFeeStructure.
  ///
  /// In en, this message translates to:
  /// **'Shift Fee Structure'**
  String get drawerShiftFeeStructure;

  /// No description provided for @drawerInvoices.
  ///
  /// In en, this message translates to:
  /// **'Invoices'**
  String get drawerInvoices;

  /// No description provided for @drawerDueTracking.
  ///
  /// In en, this message translates to:
  /// **'Due Tracking'**
  String get drawerDueTracking;

  /// No description provided for @drawerDefaulterList.
  ///
  /// In en, this message translates to:
  /// **'Defaulter List'**
  String get drawerDefaulterList;

  /// No description provided for @drawerCollectPayment.
  ///
  /// In en, this message translates to:
  /// **'Collect Payment'**
  String get drawerCollectPayment;

  /// No description provided for @drawerOnlinePayments.
  ///
  /// In en, this message translates to:
  /// **'Online Payments'**
  String get drawerOnlinePayments;

  /// No description provided for @drawerDuesbasedAccess.
  ///
  /// In en, this message translates to:
  /// **'Dues-Based Access'**
  String get drawerDuesbasedAccess;

  /// No description provided for @drawerGovernmentStipend.
  ///
  /// In en, this message translates to:
  /// **'Government Stipend'**
  String get drawerGovernmentStipend;

  /// No description provided for @drawerFeeReports.
  ///
  /// In en, this message translates to:
  /// **'Fee Reports'**
  String get drawerFeeReports;

  /// No description provided for @drawerStudentLedger.
  ///
  /// In en, this message translates to:
  /// **'Student Ledger'**
  String get drawerStudentLedger;

  /// No description provided for @drawerChartOfAccounts.
  ///
  /// In en, this message translates to:
  /// **'Chart of Accounts'**
  String get drawerChartOfAccounts;

  /// No description provided for @drawerVouchers.
  ///
  /// In en, this message translates to:
  /// **'Vouchers'**
  String get drawerVouchers;

  /// No description provided for @drawerNewVoucher.
  ///
  /// In en, this message translates to:
  /// **'New Voucher'**
  String get drawerNewVoucher;

  /// No description provided for @drawerNewDebitcreditNote.
  ///
  /// In en, this message translates to:
  /// **'New Debit/Credit Note'**
  String get drawerNewDebitcreditNote;

  /// No description provided for @drawerExpenses.
  ///
  /// In en, this message translates to:
  /// **'Expenses'**
  String get drawerExpenses;

  /// No description provided for @drawerNewExpense.
  ///
  /// In en, this message translates to:
  /// **'New Expense'**
  String get drawerNewExpense;

  /// No description provided for @drawerIncome.
  ///
  /// In en, this message translates to:
  /// **'Income'**
  String get drawerIncome;

  /// No description provided for @drawerNewIncome.
  ///
  /// In en, this message translates to:
  /// **'New Income'**
  String get drawerNewIncome;

  /// No description provided for @drawerAutopostingSettings.
  ///
  /// In en, this message translates to:
  /// **'Auto-Posting Settings'**
  String get drawerAutopostingSettings;

  /// No description provided for @drawerGeneralLedger.
  ///
  /// In en, this message translates to:
  /// **'General Ledger'**
  String get drawerGeneralLedger;

  /// No description provided for @drawerTrialBalance.
  ///
  /// In en, this message translates to:
  /// **'Trial Balance'**
  String get drawerTrialBalance;

  /// No description provided for @drawerIncomeStatement.
  ///
  /// In en, this message translates to:
  /// **'Income Statement'**
  String get drawerIncomeStatement;

  /// No description provided for @drawerBalanceSheet.
  ///
  /// In en, this message translates to:
  /// **'Balance Sheet'**
  String get drawerBalanceSheet;

  /// No description provided for @drawerCashBook.
  ///
  /// In en, this message translates to:
  /// **'Cash Book'**
  String get drawerCashBook;

  /// No description provided for @drawerBankBook.
  ///
  /// In en, this message translates to:
  /// **'Bank Book'**
  String get drawerBankBook;

  /// No description provided for @drawerBudgets.
  ///
  /// In en, this message translates to:
  /// **'Budgets'**
  String get drawerBudgets;

  /// No description provided for @drawerBudgetVsActual.
  ///
  /// In en, this message translates to:
  /// **'Budget vs Actual'**
  String get drawerBudgetVsActual;

  /// No description provided for @drawerAssets.
  ///
  /// In en, this message translates to:
  /// **'Assets'**
  String get drawerAssets;

  /// No description provided for @drawerStockItems.
  ///
  /// In en, this message translates to:
  /// **'Stock Items'**
  String get drawerStockItems;

  /// No description provided for @drawerWarehouses.
  ///
  /// In en, this message translates to:
  /// **'Warehouses'**
  String get drawerWarehouses;

  /// No description provided for @drawerVendors.
  ///
  /// In en, this message translates to:
  /// **'Vendors'**
  String get drawerVendors;

  /// No description provided for @drawerProcurementRequests.
  ///
  /// In en, this message translates to:
  /// **'Procurement Requests'**
  String get drawerProcurementRequests;

  /// No description provided for @drawerPurchaseOrders.
  ///
  /// In en, this message translates to:
  /// **'Purchase Orders'**
  String get drawerPurchaseOrders;

  /// No description provided for @drawerGoodsReceipts.
  ///
  /// In en, this message translates to:
  /// **'Goods Receipts'**
  String get drawerGoodsReceipts;

  /// No description provided for @drawerBulkSms.
  ///
  /// In en, this message translates to:
  /// **'Bulk SMS'**
  String get drawerBulkSms;

  /// No description provided for @drawerBulkEmail.
  ///
  /// In en, this message translates to:
  /// **'Bulk Email'**
  String get drawerBulkEmail;

  /// No description provided for @drawerSmsGateways.
  ///
  /// In en, this message translates to:
  /// **'SMS Gateways'**
  String get drawerSmsGateways;

  /// No description provided for @drawerEmailSettings.
  ///
  /// In en, this message translates to:
  /// **'Email Settings'**
  String get drawerEmailSettings;

  /// No description provided for @drawerAnnouncements.
  ///
  /// In en, this message translates to:
  /// **'Announcements'**
  String get drawerAnnouncements;

  /// No description provided for @drawerNoticeBoard.
  ///
  /// In en, this message translates to:
  /// **'Notice Board'**
  String get drawerNoticeBoard;

  /// No description provided for @drawerEmergencyBroadcast.
  ///
  /// In en, this message translates to:
  /// **'Emergency Broadcast'**
  String get drawerEmergencyBroadcast;

  /// No description provided for @drawerMessages.
  ///
  /// In en, this message translates to:
  /// **'Messages'**
  String get drawerMessages;

  /// No description provided for @drawerViewInstitutionProfile.
  ///
  /// In en, this message translates to:
  /// **'View Institution Profile'**
  String get drawerViewInstitutionProfile;

  /// No description provided for @drawerFindAPage.
  ///
  /// In en, this message translates to:
  /// **'Find a page...'**
  String get drawerFindAPage;

  /// No description provided for @drawerSchoolName.
  ///
  /// In en, this message translates to:
  /// **'Dhaka Public School'**
  String get drawerSchoolName;

  /// No description provided for @multiTrackTitle.
  ///
  /// In en, this message translates to:
  /// **'Multi-Track'**
  String get multiTrackTitle;

  /// No description provided for @multiTrackSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Manage Institution Tracks'**
  String get multiTrackSubtitle;

  /// No description provided for @multiTrackAddTrack.
  ///
  /// In en, this message translates to:
  /// **'Add Track'**
  String get multiTrackAddTrack;

  /// No description provided for @multiTrackNoTracks.
  ///
  /// In en, this message translates to:
  /// **'No tracks configured.'**
  String get multiTrackNoTracks;

  /// No description provided for @multiTrackEmptyDesc.
  ///
  /// In en, this message translates to:
  /// **'Add a track if your institution runs multiple programs under different boards.'**
  String get multiTrackEmptyDesc;

  /// No description provided for @boardAffiliationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Board Affiliations'**
  String get boardAffiliationsTitle;

  /// No description provided for @boardAffiliationsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Manage Institution Boards'**
  String get boardAffiliationsSubtitle;

  /// No description provided for @boardAffiliationsAdd.
  ///
  /// In en, this message translates to:
  /// **'Add Affiliation'**
  String get boardAffiliationsAdd;

  /// No description provided for @boardAffiliationsNoData.
  ///
  /// In en, this message translates to:
  /// **'No board affiliations configured.'**
  String get boardAffiliationsNoData;

  /// No description provided for @boardAffiliationsEmptyDesc.
  ///
  /// In en, this message translates to:
  /// **'Add a board here to set its regional center, subject code prefix, and result import format for board-format mark sheets and admit cards.'**
  String get boardAffiliationsEmptyDesc;

  /// No description provided for @smcBodyTitle.
  ///
  /// In en, this message translates to:
  /// **'SMC / Governing Body'**
  String get smcBodyTitle;

  /// No description provided for @smcBodySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Manage Committees'**
  String get smcBodySubtitle;

  /// No description provided for @smcBodyAdd.
  ///
  /// In en, this message translates to:
  /// **'New SMC Body'**
  String get smcBodyAdd;

  /// No description provided for @smcBodyNoData.
  ///
  /// In en, this message translates to:
  /// **'No governing body configured yet.'**
  String get smcBodyNoData;

  /// No description provided for @campusTitle.
  ///
  /// In en, this message translates to:
  /// **'Campus Management'**
  String get campusTitle;

  /// No description provided for @campusSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Manage Institution Campuses'**
  String get campusSubtitle;

  /// No description provided for @campusDesc.
  ///
  /// In en, this message translates to:
  /// **'Manage physical campuses of this institution'**
  String get campusDesc;

  /// No description provided for @campusAddBtn.
  ///
  /// In en, this message translates to:
  /// **'Add Campus'**
  String get campusAddBtn;

  /// No description provided for @campusNoData.
  ///
  /// In en, this message translates to:
  /// **'No campuses yet'**
  String get campusNoData;

  /// No description provided for @campusEmptyDesc.
  ///
  /// In en, this message translates to:
  /// **'Add your first campus to get started'**
  String get campusEmptyDesc;

  /// No description provided for @branchTitle.
  ///
  /// In en, this message translates to:
  /// **'Branch Management'**
  String get branchTitle;

  /// No description provided for @branchSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Manage Institution Branches'**
  String get branchSubtitle;

  /// No description provided for @branchDesc.
  ///
  /// In en, this message translates to:
  /// **'Manage branches of this institution'**
  String get branchDesc;

  /// No description provided for @branchAddBtn.
  ///
  /// In en, this message translates to:
  /// **'Add Branch'**
  String get branchAddBtn;

  /// No description provided for @branchNoData.
  ///
  /// In en, this message translates to:
  /// **'No branches yet'**
  String get branchNoData;

  /// No description provided for @branchEmptyDesc.
  ///
  /// In en, this message translates to:
  /// **'Add your first branch to get started'**
  String get branchEmptyDesc;

  /// No description provided for @docTempAdmitCard.
  ///
  /// In en, this message translates to:
  /// **'Admit Card'**
  String get docTempAdmitCard;

  /// No description provided for @docTempBoardAdmitCard.
  ///
  /// In en, this message translates to:
  /// **'Board Admit Card'**
  String get docTempBoardAdmitCard;

  /// No description provided for @docTempSeatPlan.
  ///
  /// In en, this message translates to:
  /// **'Seat Plan'**
  String get docTempSeatPlan;

  /// No description provided for @docTempIdCard.
  ///
  /// In en, this message translates to:
  /// **'ID Card'**
  String get docTempIdCard;

  /// No description provided for @docTempTitle.
  ///
  /// In en, this message translates to:
  /// **'Document Templates'**
  String get docTempTitle;

  /// No description provided for @docTempSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Manage Institution Documents'**
  String get docTempSubtitle;

  /// No description provided for @docTempDesc.
  ///
  /// In en, this message translates to:
  /// **'Pick a layout and an optional background for the Admit Card, Board Admit Card, Seat Plan and ID Card documents this institution prints.'**
  String get docTempDesc;

  /// No description provided for @docTempAddBtn.
  ///
  /// In en, this message translates to:
  /// **'New Template'**
  String get docTempAddBtn;

  /// No description provided for @docTempNoDataMsg.
  ///
  /// In en, this message translates to:
  /// **'No custom template yet — {tabName} prints with the default classic layout and no background.'**
  String docTempNoDataMsg(String tabName);

  /// No description provided for @studentsTitle.
  ///
  /// In en, this message translates to:
  /// **'Students'**
  String get studentsTitle;

  /// No description provided for @studentsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Student Management'**
  String get studentsSubtitle;

  /// No description provided for @studentsBtnPromotion.
  ///
  /// In en, this message translates to:
  /// **'Promotion'**
  String get studentsBtnPromotion;

  /// No description provided for @studentsBtnPrintID.
  ///
  /// In en, this message translates to:
  /// **'Print ID Cards'**
  String get studentsBtnPrintID;

  /// No description provided for @studentsBtnStipend.
  ///
  /// In en, this message translates to:
  /// **'Stipend Roll'**
  String get studentsBtnStipend;

  /// No description provided for @studentsBtnImport.
  ///
  /// In en, this message translates to:
  /// **'Import from Excel'**
  String get studentsBtnImport;

  /// No description provided for @studentsBtnAdmit.
  ///
  /// In en, this message translates to:
  /// **'Admit Student'**
  String get studentsBtnAdmit;

  /// No description provided for @studentsDesc.
  ///
  /// In en, this message translates to:
  /// **'Search, filter, and manage enrolled students'**
  String get studentsDesc;

  /// No description provided for @studentsSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search by name, BRC, or phone...'**
  String get studentsSearchHint;

  /// No description provided for @studentsFilterClasses.
  ///
  /// In en, this message translates to:
  /// **'All classes'**
  String get studentsFilterClasses;

  /// No description provided for @studentsFilterSections.
  ///
  /// In en, this message translates to:
  /// **'All sections'**
  String get studentsFilterSections;

  /// No description provided for @studentsFilterStatuses.
  ///
  /// In en, this message translates to:
  /// **'All statuses'**
  String get studentsFilterStatuses;

  /// No description provided for @studentsFilterNSID.
  ///
  /// In en, this message translates to:
  /// **'NSID: All'**
  String get studentsFilterNSID;

  /// No description provided for @studentsTableStudent.
  ///
  /// In en, this message translates to:
  /// **'Student'**
  String get studentsTableStudent;

  /// No description provided for @studentsTableBRC.
  ///
  /// In en, this message translates to:
  /// **'BRC'**
  String get studentsTableBRC;

  /// No description provided for @studentsTableClassSec.
  ///
  /// In en, this message translates to:
  /// **'Class / Section'**
  String get studentsTableClassSec;

  /// No description provided for @studentsTableGuardian.
  ///
  /// In en, this message translates to:
  /// **'Guardian Mobile'**
  String get studentsTableGuardian;

  /// No description provided for @studentsTableStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get studentsTableStatus;

  /// No description provided for @studentsTableActions.
  ///
  /// In en, this message translates to:
  /// **'Actions'**
  String get studentsTableActions;

  /// No description provided for @actionView.
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get actionView;

  /// No description provided for @actionEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get actionEdit;

  /// No description provided for @actionDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get actionDelete;

  /// No description provided for @statusActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get statusActive;

  /// No description provided for @statusNsidPending.
  ///
  /// In en, this message translates to:
  /// **'NSID Pending'**
  String get statusNsidPending;

  /// No description provided for @usersTitle.
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get usersTitle;

  /// No description provided for @usersSubtitle.
  ///
  /// In en, this message translates to:
  /// **'System User Accounts'**
  String get usersSubtitle;

  /// No description provided for @usersDesc.
  ///
  /// In en, this message translates to:
  /// **'Login accounts for this institution — staff sign in with these. Link one to a teacher from the teacher\'s own form.'**
  String get usersDesc;

  /// No description provided for @usersAddBtn.
  ///
  /// In en, this message translates to:
  /// **'New User'**
  String get usersAddBtn;

  /// No description provided for @usersSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search by name, email or phone...'**
  String get usersSearchHint;

  /// No description provided for @usersFilterRoles.
  ///
  /// In en, this message translates to:
  /// **'All roles'**
  String get usersFilterRoles;

  /// No description provided for @usersIsYou.
  ///
  /// In en, this message translates to:
  /// **'(you)'**
  String get usersIsYou;

  /// No description provided for @roleParent.
  ///
  /// In en, this message translates to:
  /// **'Parent'**
  String get roleParent;

  /// No description provided for @roleInstitutionAdmin.
  ///
  /// In en, this message translates to:
  /// **'Institution Admin'**
  String get roleInstitutionAdmin;

  /// No description provided for @payGatewayTitle.
  ///
  /// In en, this message translates to:
  /// **'Payment Gateways'**
  String get payGatewayTitle;

  /// No description provided for @payGatewaySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Manage Online Payments'**
  String get payGatewaySubtitle;

  /// No description provided for @payGatewayDesc.
  ///
  /// In en, this message translates to:
  /// **'Configure how your institution collects online fees — SSLCommerz (bKash / Nagad / Rocket / card in one checkout), a direct bKash or ShurjoPay account, a custom API-based gateway, or any manual option confirmed by staff.'**
  String get payGatewayDesc;

  /// No description provided for @payGatewayAddBtn.
  ///
  /// In en, this message translates to:
  /// **'Add Gateway'**
  String get payGatewayAddBtn;

  /// No description provided for @payGatewayNoData.
  ///
  /// In en, this message translates to:
  /// **'No payment gateway configured yet — Online Admission fee payment will fall back to the platform\'s shared SSLCommerz sandbox until you add one here.'**
  String get payGatewayNoData;

  /// No description provided for @onlineAdmissionTitle.
  ///
  /// In en, this message translates to:
  /// **'Online Admission'**
  String get onlineAdmissionTitle;

  /// No description provided for @onlineAdmissionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Admission Cycles & Quotas'**
  String get onlineAdmissionSubtitle;

  /// No description provided for @onlineAdmissionDesc.
  ///
  /// In en, this message translates to:
  /// **'Configure admission cycles, application windows, fees, and seat allocation per class.'**
  String get onlineAdmissionDesc;

  /// No description provided for @onlineAdmissionBtnQuota.
  ///
  /// In en, this message translates to:
  /// **'Quota Types'**
  String get onlineAdmissionBtnQuota;

  /// No description provided for @onlineAdmissionBtnNewCycle.
  ///
  /// In en, this message translates to:
  /// **'New Cycle'**
  String get onlineAdmissionBtnNewCycle;

  /// No description provided for @onlineAdmissionNoData.
  ///
  /// In en, this message translates to:
  /// **'No admission cycles configured yet.'**
  String get onlineAdmissionNoData;

  /// No description provided for @websiteTitle.
  ///
  /// In en, this message translates to:
  /// **'Website'**
  String get websiteTitle;

  /// No description provided for @websiteSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Manage Public Website'**
  String get websiteSubtitle;

  /// No description provided for @websiteLiveSiteBtn.
  ///
  /// In en, this message translates to:
  /// **'View live site'**
  String get websiteLiveSiteBtn;

  /// No description provided for @websiteUnpublishBtn.
  ///
  /// In en, this message translates to:
  /// **'Unpublish'**
  String get websiteUnpublishBtn;

  /// No description provided for @webTabSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get webTabSettings;

  /// No description provided for @webTabHero.
  ///
  /// In en, this message translates to:
  /// **'Hero'**
  String get webTabHero;

  /// No description provided for @webTabAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get webTabAbout;

  /// No description provided for @webTabPrincipalMsg.
  ///
  /// In en, this message translates to:
  /// **'Principal\'s Message'**
  String get webTabPrincipalMsg;

  /// No description provided for @webTabNotices.
  ///
  /// In en, this message translates to:
  /// **'Notices'**
  String get webTabNotices;

  /// No description provided for @webTabGallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get webTabGallery;

  /// No description provided for @webTabContact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get webTabContact;

  /// No description provided for @webTabMission.
  ///
  /// In en, this message translates to:
  /// **'Mission & Vision'**
  String get webTabMission;

  /// No description provided for @webTabWhyChoose.
  ///
  /// In en, this message translates to:
  /// **'Why Choose Us'**
  String get webTabWhyChoose;

  /// No description provided for @webTabClasses.
  ///
  /// In en, this message translates to:
  /// **'Classes'**
  String get webTabClasses;

  /// No description provided for @webTabEvents.
  ///
  /// In en, this message translates to:
  /// **'Events'**
  String get webTabEvents;

  /// No description provided for @webTabTestimonials.
  ///
  /// In en, this message translates to:
  /// **'Testimonials'**
  String get webTabTestimonials;

  /// No description provided for @webTabVideos.
  ///
  /// In en, this message translates to:
  /// **'Videos'**
  String get webTabVideos;

  /// No description provided for @webTabFaq.
  ///
  /// In en, this message translates to:
  /// **'FAQ'**
  String get webTabFaq;

  /// No description provided for @webTabTeachers.
  ///
  /// In en, this message translates to:
  /// **'Teachers'**
  String get webTabTeachers;

  /// No description provided for @webTabCommittee.
  ///
  /// In en, this message translates to:
  /// **'Committee'**
  String get webTabCommittee;

  /// No description provided for @webTabAdmissions.
  ///
  /// In en, this message translates to:
  /// **'Admissions'**
  String get webTabAdmissions;

  /// No description provided for @webTabResults.
  ///
  /// In en, this message translates to:
  /// **'Results'**
  String get webTabResults;

  /// No description provided for @webTabInbox.
  ///
  /// In en, this message translates to:
  /// **'Inbox'**
  String get webTabInbox;

  /// No description provided for @webHeroSubtitle.
  ///
  /// In en, this message translates to:
  /// **'The first thing visitors see.'**
  String get webHeroSubtitle;

  /// No description provided for @webHeroHeadlineLbl.
  ///
  /// In en, this message translates to:
  /// **'Headline'**
  String get webHeroHeadlineLbl;

  /// No description provided for @webHeroHeadlineHint.
  ///
  /// In en, this message translates to:
  /// **'Your institution\'s name or slogan'**
  String get webHeroHeadlineHint;

  /// No description provided for @webHeroSubheadlineLbl.
  ///
  /// In en, this message translates to:
  /// **'Subheadline'**
  String get webHeroSubheadlineLbl;

  /// No description provided for @webHeroCtaLbl.
  ///
  /// In en, this message translates to:
  /// **'Call-to-Action Button Text'**
  String get webHeroCtaLbl;

  /// No description provided for @webHeroCtaHint.
  ///
  /// In en, this message translates to:
  /// **'Admission Open'**
  String get webHeroCtaHint;

  /// No description provided for @webHeroBgLbl.
  ///
  /// In en, this message translates to:
  /// **'Background Image'**
  String get webHeroBgLbl;

  /// No description provided for @webHeroUploadBtn.
  ///
  /// In en, this message translates to:
  /// **'Upload'**
  String get webHeroUploadBtn;

  /// No description provided for @webHeroShowSection.
  ///
  /// In en, this message translates to:
  /// **'Show this section on the public site'**
  String get webHeroShowSection;

  /// No description provided for @webHeroSaveBtn.
  ///
  /// In en, this message translates to:
  /// **'Save Section'**
  String get webHeroSaveBtn;

  /// No description provided for @webSettingsComingSoon.
  ///
  /// In en, this message translates to:
  /// **'{tabName} settings coming soon.'**
  String webSettingsComingSoon(String tabName);

  /// No description provided for @activityLogTitle.
  ///
  /// In en, this message translates to:
  /// **'Activity Log'**
  String get activityLogTitle;

  /// No description provided for @activityLogSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Audit trail of all create, update, and delete actions'**
  String get activityLogSubtitle;

  /// No description provided for @activityLogAllEvents.
  ///
  /// In en, this message translates to:
  /// **'All events'**
  String get activityLogAllEvents;

  /// No description provided for @activityLogCreated.
  ///
  /// In en, this message translates to:
  /// **'Created'**
  String get activityLogCreated;

  /// No description provided for @activityLogUpdated.
  ///
  /// In en, this message translates to:
  /// **'Updated'**
  String get activityLogUpdated;

  /// No description provided for @activityLogDeleted.
  ///
  /// In en, this message translates to:
  /// **'Deleted'**
  String get activityLogDeleted;

  /// No description provided for @activityLogFilterUserId.
  ///
  /// In en, this message translates to:
  /// **'Filter by user ID'**
  String get activityLogFilterUserId;

  /// No description provided for @activityLogDateFormat.
  ///
  /// In en, this message translates to:
  /// **'dd/mm/yyyy'**
  String get activityLogDateFormat;

  /// No description provided for @activityLogFieldsChanged.
  ///
  /// In en, this message translates to:
  /// **'{count} field(s) changed'**
  String activityLogFieldsChanged(String count);

  /// No description provided for @notificationsPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsPageTitle;

  /// No description provided for @notificationsPageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your recent alerts and messages'**
  String get notificationsPageSubtitle;

  /// No description provided for @notificationsMarkAllRead.
  ///
  /// In en, this message translates to:
  /// **'Mark all as read'**
  String get notificationsMarkAllRead;

  /// No description provided for @notificationSystemUpdateTitle.
  ///
  /// In en, this message translates to:
  /// **'System Update'**
  String get notificationSystemUpdateTitle;

  /// No description provided for @notificationSystemUpdateDesc.
  ///
  /// In en, this message translates to:
  /// **'SchoolMate v2.4 has been successfully installed. Check out the new Finance reports feature.'**
  String get notificationSystemUpdateDesc;

  /// No description provided for @notificationTime10MinsAgo.
  ///
  /// In en, this message translates to:
  /// **'10 mins ago'**
  String get notificationTime10MinsAgo;

  /// No description provided for @notificationAdmissionTitle.
  ///
  /// In en, this message translates to:
  /// **'New Admission Application'**
  String get notificationAdmissionTitle;

  /// No description provided for @notificationAdmissionDesc.
  ///
  /// In en, this message translates to:
  /// **'Md Rakib Molla has submitted a new admission form for Class 10.'**
  String get notificationAdmissionDesc;

  /// No description provided for @notificationTime2HoursAgo.
  ///
  /// In en, this message translates to:
  /// **'2 hours ago'**
  String get notificationTime2HoursAgo;

  /// No description provided for @notificationFeePaymentTitle.
  ///
  /// In en, this message translates to:
  /// **'Fee Payment Received'**
  String get notificationFeePaymentTitle;

  /// No description provided for @notificationFeePaymentDesc.
  ///
  /// In en, this message translates to:
  /// **'Invoice #INV-2026-0045 has been paid via SSLCommerz.'**
  String get notificationFeePaymentDesc;

  /// No description provided for @notificationTimeYesterday430.
  ///
  /// In en, this message translates to:
  /// **'Yesterday, 04:30 PM'**
  String get notificationTimeYesterday430;

  /// No description provided for @notificationLeaveRequestTitle.
  ///
  /// In en, this message translates to:
  /// **'Leave Request'**
  String get notificationLeaveRequestTitle;

  /// No description provided for @notificationLeaveRequestDesc.
  ///
  /// In en, this message translates to:
  /// **'Teacher Asaduzzaman applied for 2 days of casual leave.'**
  String get notificationLeaveRequestDesc;

  /// No description provided for @notificationTimeYesterday915.
  ///
  /// In en, this message translates to:
  /// **'Yesterday, 09:15 AM'**
  String get notificationTimeYesterday915;

  /// No description provided for @notificationInventoryAlertTitle.
  ///
  /// In en, this message translates to:
  /// **'Inventory Alert'**
  String get notificationInventoryAlertTitle;

  /// No description provided for @notificationInventoryAlertDesc.
  ///
  /// In en, this message translates to:
  /// **'Stock for \'A4 Print Paper\' is running low (Current: 5 reams).'**
  String get notificationInventoryAlertDesc;

  /// No description provided for @notificationTimeOct01.
  ///
  /// In en, this message translates to:
  /// **'01 Oct 2026'**
  String get notificationTimeOct01;

  /// No description provided for @academicYears.
  ///
  /// In en, this message translates to:
  /// **'Years'**
  String get academicYears;

  /// No description provided for @academicManagement.
  ///
  /// In en, this message translates to:
  /// **'Academic Management'**
  String get academicManagement;

  /// No description provided for @academicYearsDesc.
  ///
  /// In en, this message translates to:
  /// **'Manage academic years, activate the current one, and configure sessions within each year'**
  String get academicYearsDesc;

  /// No description provided for @newAcademicYear.
  ///
  /// In en, this message translates to:
  /// **'New Academic Year'**
  String get newAcademicYear;

  /// No description provided for @currentYear.
  ///
  /// In en, this message translates to:
  /// **'Current year'**
  String get currentYear;

  /// No description provided for @sessionLabel.
  ///
  /// In en, this message translates to:
  /// **'Session'**
  String get sessionLabel;

  /// No description provided for @sessionYear.
  ///
  /// In en, this message translates to:
  /// **'Session 2026'**
  String get sessionYear;

  /// No description provided for @exampleYear2026.
  ///
  /// In en, this message translates to:
  /// **'2026'**
  String get exampleYear2026;

  /// No description provided for @exampleYear2026Bn.
  ///
  /// In en, this message translates to:
  /// **'২০২৬'**
  String get exampleYear2026Bn;

  /// No description provided for @exampleDateRange.
  ///
  /// In en, this message translates to:
  /// **'01 Jan 2026 → 31 Dec 2026'**
  String get exampleDateRange;

  /// No description provided for @exampleSessionBn.
  ///
  /// In en, this message translates to:
  /// **'সেশন ২০২৬'**
  String get exampleSessionBn;

  /// No description provided for @yearsActiveCycle.
  ///
  /// In en, this message translates to:
  /// **'Active Cycle'**
  String get yearsActiveCycle;

  /// No description provided for @yearsActiveCycleBn.
  ///
  /// In en, this message translates to:
  /// **'সক্রিয় চক্র'**
  String get yearsActiveCycleBn;

  /// No description provided for @years2026.
  ///
  /// In en, this message translates to:
  /// **'2026'**
  String get years2026;

  /// No description provided for @years2026Bn.
  ///
  /// In en, this message translates to:
  /// **'২০২৬'**
  String get years2026Bn;

  /// No description provided for @yearsSetAsCurrent.
  ///
  /// In en, this message translates to:
  /// **'Set 2026 as current year'**
  String get yearsSetAsCurrent;

  /// No description provided for @yearsEditYear.
  ///
  /// In en, this message translates to:
  /// **'Edit Year'**
  String get yearsEditYear;

  /// No description provided for @yearsDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get yearsDelete;

  /// No description provided for @yearsSessionsIn2026.
  ///
  /// In en, this message translates to:
  /// **'Sessions in 2026'**
  String get yearsSessionsIn2026;

  /// No description provided for @yearsSession2026.
  ///
  /// In en, this message translates to:
  /// **'Session 2026'**
  String get yearsSession2026;

  /// No description provided for @yearsSession2026Bn.
  ///
  /// In en, this message translates to:
  /// **'সেশন ২০২৬'**
  String get yearsSession2026Bn;

  /// No description provided for @yearsActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get yearsActive;

  /// No description provided for @years01Jan2026.
  ///
  /// In en, this message translates to:
  /// **'01 Jan 2026'**
  String get years01Jan2026;

  /// No description provided for @years31Dec2026.
  ///
  /// In en, this message translates to:
  /// **'31 Dec 2026'**
  String get years31Dec2026;

  /// No description provided for @yearsEnrolledStats.
  ///
  /// In en, this message translates to:
  /// **'1,240 enrolled • 8 classes'**
  String get yearsEnrolledStats;

  /// No description provided for @yearsAddAnotherSession.
  ///
  /// In en, this message translates to:
  /// **'Add another session to 2026'**
  String get yearsAddAnotherSession;

  /// No description provided for @years2025.
  ///
  /// In en, this message translates to:
  /// **'2025'**
  String get years2025;

  /// No description provided for @years2025Bn.
  ///
  /// In en, this message translates to:
  /// **'২০২৫'**
  String get years2025Bn;

  /// No description provided for @years2025Duration.
  ///
  /// In en, this message translates to:
  /// **'01 Jan 2025 - 31 Dec\n2025'**
  String get years2025Duration;

  /// No description provided for @years3.
  ///
  /// In en, this message translates to:
  /// **'3'**
  String get years3;

  /// No description provided for @yearsSessions.
  ///
  /// In en, this message translates to:
  /// **'Sessions'**
  String get yearsSessions;

  /// No description provided for @yearsArchived.
  ///
  /// In en, this message translates to:
  /// **'Archived'**
  String get yearsArchived;

  /// No description provided for @yearsDay114Of365.
  ///
  /// In en, this message translates to:
  /// **'Day 114 of 365'**
  String get yearsDay114Of365;

  /// No description provided for @yearsNewYear.
  ///
  /// In en, this message translates to:
  /// **'New Year'**
  String get yearsNewYear;

  /// No description provided for @yearsManageTerms.
  ///
  /// In en, this message translates to:
  /// **'Manage terms, active calendar\n& sessions'**
  String get yearsManageTerms;

  /// No description provided for @yearsTermElapsed.
  ///
  /// In en, this message translates to:
  /// **'2026 Term Elapsed'**
  String get yearsTermElapsed;

  /// No description provided for @yearsPercent31.
  ///
  /// In en, this message translates to:
  /// **'31.2%'**
  String get yearsPercent31;

  /// No description provided for @yearsQuarter.
  ///
  /// In en, this message translates to:
  /// **'QUARTER'**
  String get yearsQuarter;

  /// No description provided for @yearsQ2Spring.
  ///
  /// In en, this message translates to:
  /// **'Q2 • Spring'**
  String get yearsQ2Spring;

  /// No description provided for @yearsLowercaseActive.
  ///
  /// In en, this message translates to:
  /// **'active'**
  String get yearsLowercaseActive;

  /// No description provided for @yearsCurrentYear.
  ///
  /// In en, this message translates to:
  /// **'Current year'**
  String get yearsCurrentYear;

  /// No description provided for @yearsSessionSingle.
  ///
  /// In en, this message translates to:
  /// **'Session'**
  String get yearsSessionSingle;

  /// No description provided for @yearsEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get yearsEdit;

  /// No description provided for @yearsAssociatedSessions.
  ///
  /// In en, this message translates to:
  /// **'ASSOCIATED SESSIONS'**
  String get yearsAssociatedSessions;

  /// No description provided for @years1Total.
  ///
  /// In en, this message translates to:
  /// **'1 Total'**
  String get years1Total;

  /// No description provided for @calendarTitle.
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get calendarTitle;

  /// No description provided for @calendarSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Holidays, exam periods, vacations and events'**
  String get calendarSubtitle;

  /// No description provided for @calendarAcademicYear.
  ///
  /// In en, this message translates to:
  /// **'Academic Year'**
  String get calendarAcademicYear;

  /// No description provided for @calendarAddEvent.
  ///
  /// In en, this message translates to:
  /// **'Add Event'**
  String get calendarAddEvent;

  /// No description provided for @calendarHoliday.
  ///
  /// In en, this message translates to:
  /// **'Holiday'**
  String get calendarHoliday;

  /// No description provided for @calendarExamPeriod.
  ///
  /// In en, this message translates to:
  /// **'Exam Period'**
  String get calendarExamPeriod;

  /// No description provided for @calendarVacation.
  ///
  /// In en, this message translates to:
  /// **'Vacation'**
  String get calendarVacation;

  /// No description provided for @calendarEvent.
  ///
  /// In en, this message translates to:
  /// **'Event'**
  String get calendarEvent;

  /// No description provided for @calendarTimetableSkip.
  ///
  /// In en, this message translates to:
  /// **'Timetable Skip'**
  String get calendarTimetableSkip;

  /// No description provided for @addEventDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Calendar Event'**
  String get addEventDialogTitle;

  /// No description provided for @addEventTitleEnglish.
  ///
  /// In en, this message translates to:
  /// **'Title (English)'**
  String get addEventTitleEnglish;

  /// No description provided for @addEventTitleBangla.
  ///
  /// In en, this message translates to:
  /// **'Title (Bangla)'**
  String get addEventTitleBangla;

  /// No description provided for @addEventType.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get addEventType;

  /// No description provided for @addEventStartDate.
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get addEventStartDate;

  /// No description provided for @addEventEndDate.
  ///
  /// In en, this message translates to:
  /// **'End Date'**
  String get addEventEndDate;

  /// No description provided for @addEventDateFormat.
  ///
  /// In en, this message translates to:
  /// **'dd/mm/yyyy'**
  String get addEventDateFormat;

  /// No description provided for @addEventDescription.
  ///
  /// In en, this message translates to:
  /// **'Description (optional)'**
  String get addEventDescription;

  /// No description provided for @addEventCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get addEventCancel;

  /// No description provided for @addEventSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get addEventSave;

  /// No description provided for @shiftsPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Shifts'**
  String get shiftsPageTitle;

  /// No description provided for @shiftsPageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Academic Management'**
  String get shiftsPageSubtitle;

  /// No description provided for @shiftsPageDescription.
  ///
  /// In en, this message translates to:
  /// **'Define morning, day, evening and custom shifts with period schedules'**
  String get shiftsPageDescription;

  /// No description provided for @shiftsPageNewShift.
  ///
  /// In en, this message translates to:
  /// **'New Shift'**
  String get shiftsPageNewShift;

  /// No description provided for @shiftsPageEmptyState.
  ///
  /// In en, this message translates to:
  /// **'No shifts configured. Add one to get started.'**
  String get shiftsPageEmptyState;

  /// No description provided for @programStructuresTitle.
  ///
  /// In en, this message translates to:
  /// **'Program Structures'**
  String get programStructuresTitle;

  /// No description provided for @programStructuresSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Academic Management'**
  String get programStructuresSubtitle;

  /// No description provided for @programStructuresDescription.
  ///
  /// In en, this message translates to:
  /// **'Define program types (year-based, semester-based, BTEB diploma, etc.)'**
  String get programStructuresDescription;

  /// No description provided for @programStructuresNew.
  ///
  /// In en, this message translates to:
  /// **'New Structure'**
  String get programStructuresNew;

  /// No description provided for @programStructuresEmpty.
  ///
  /// In en, this message translates to:
  /// **'No program structures defined yet.'**
  String get programStructuresEmpty;

  /// No description provided for @gradingScalesTitle.
  ///
  /// In en, this message translates to:
  /// **'Grading Scales'**
  String get gradingScalesTitle;

  /// No description provided for @gradingScalesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Academic Management'**
  String get gradingScalesSubtitle;

  /// No description provided for @gradingScalesDescription.
  ///
  /// In en, this message translates to:
  /// **'Define grade bands (letter, point, mark range) and assign a scale to each class'**
  String get gradingScalesDescription;

  /// No description provided for @gradingScalesNew.
  ///
  /// In en, this message translates to:
  /// **'New Grading Scale'**
  String get gradingScalesNew;

  /// No description provided for @gradingScalePreset.
  ///
  /// In en, this message translates to:
  /// **'Preset'**
  String get gradingScalePreset;

  /// No description provided for @componentTypesTitle.
  ///
  /// In en, this message translates to:
  /// **'Component Types'**
  String get componentTypesTitle;

  /// No description provided for @componentTypesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Academic Management'**
  String get componentTypesSubtitle;

  /// No description provided for @componentTypesDescription.
  ///
  /// In en, this message translates to:
  /// **'The mark buckets (Written/CQ, MCQ, Practical, ...) used when building a subject\'s paper components'**
  String get componentTypesDescription;

  /// No description provided for @componentTypesNew.
  ///
  /// In en, this message translates to:
  /// **'New Component'**
  String get componentTypesNew;

  /// No description provided for @componentTypesColName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get componentTypesColName;

  /// No description provided for @componentTypesColShortLabel.
  ///
  /// In en, this message translates to:
  /// **'Short Label'**
  String get componentTypesColShortLabel;

  /// No description provided for @componentTypesColStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get componentTypesColStatus;

  /// No description provided for @classesSectionsHeaderBadge.
  ///
  /// In en, this message translates to:
  /// **'Class & Section Configuration'**
  String get classesSectionsHeaderBadge;

  /// No description provided for @classesSectionsHeaderDesc.
  ///
  /// In en, this message translates to:
  /// **'Define the hierarchical structure of classes, sections, shifts, and assign responsible teachers.'**
  String get classesSectionsHeaderDesc;

  /// No description provided for @classesSectionsTotalClasses.
  ///
  /// In en, this message translates to:
  /// **'Total Classes: {count}'**
  String classesSectionsTotalClasses(int count);

  /// No description provided for @classesSectionsTotalSections.
  ///
  /// In en, this message translates to:
  /// **'Total Sections: {count}'**
  String classesSectionsTotalSections(int count);

  /// No description provided for @classesSectionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Classes & Sections'**
  String get classesSectionsTitle;

  /// No description provided for @classesSectionsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Manage class hierarchy and shift-based sections'**
  String get classesSectionsSubtitle;

  /// No description provided for @classesSectionsAddClass.
  ///
  /// In en, this message translates to:
  /// **'Add Class'**
  String get classesSectionsAddClass;

  /// No description provided for @classesSectionsTree.
  ///
  /// In en, this message translates to:
  /// **'Class Tree'**
  String get classesSectionsTree;

  /// No description provided for @classesSectionsAddSection.
  ///
  /// In en, this message translates to:
  /// **'Section'**
  String get classesSectionsAddSection;

  /// No description provided for @classesSectionsCollapseAll.
  ///
  /// In en, this message translates to:
  /// **'Collapse All'**
  String get classesSectionsCollapseAll;

  /// No description provided for @classesSectionsExpandAll.
  ///
  /// In en, this message translates to:
  /// **'Expand All'**
  String get classesSectionsExpandAll;

  /// No description provided for @classesSectionsStudents.
  ///
  /// In en, this message translates to:
  /// **'Students'**
  String get classesSectionsStudents;

  /// No description provided for @classesSectionsTeacher.
  ///
  /// In en, this message translates to:
  /// **'Teacher'**
  String get classesSectionsTeacher;

  /// No description provided for @componentTypesHeaderBadge.
  ///
  /// In en, this message translates to:
  /// **'Mark Distribution Configuration'**
  String get componentTypesHeaderBadge;

  /// No description provided for @componentTypesHeaderDesc.
  ///
  /// In en, this message translates to:
  /// **'Define and organize subject-based mark buckets (Written/CQ, MCQ, Lab, etc.).'**
  String get componentTypesHeaderDesc;

  /// No description provided for @componentTypesTotal.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get componentTypesTotal;

  /// No description provided for @componentTypesActiveCount.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get componentTypesActiveCount;

  /// No description provided for @componentTypesSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search component or code (e.g. CQ, MCQ)...'**
  String get componentTypesSearchHint;

  /// No description provided for @componentTypesFilterAll.
  ///
  /// In en, this message translates to:
  /// **'All Buckets'**
  String get componentTypesFilterAll;

  /// No description provided for @componentTypesFilterTheory.
  ///
  /// In en, this message translates to:
  /// **'Theory / Written'**
  String get componentTypesFilterTheory;

  /// No description provided for @componentTypesFilterObjective.
  ///
  /// In en, this message translates to:
  /// **'Objective'**
  String get componentTypesFilterObjective;

  /// No description provided for @componentTypesFilterPractical.
  ///
  /// In en, this message translates to:
  /// **'Practical / Lab'**
  String get componentTypesFilterPractical;

  /// No description provided for @componentTypesListTitle.
  ///
  /// In en, this message translates to:
  /// **'Component List'**
  String get componentTypesListTitle;

  /// No description provided for @componentTypesSortOrder.
  ///
  /// In en, this message translates to:
  /// **'Sort Serial'**
  String get componentTypesSortOrder;

  /// No description provided for @componentTypesCodeLabel.
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get componentTypesCodeLabel;

  /// No description provided for @componentTypesActiveBadge.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get componentTypesActiveBadge;

  /// No description provided for @componentTypesStandardWeight.
  ///
  /// In en, this message translates to:
  /// **'Standard weight'**
  String get componentTypesStandardWeight;

  /// No description provided for @componentTypesTotalCount.
  ///
  /// In en, this message translates to:
  /// **'Total: {count}'**
  String componentTypesTotalCount(int count);

  /// No description provided for @componentTypesActiveCountValue.
  ///
  /// In en, this message translates to:
  /// **'Active: {count}'**
  String componentTypesActiveCountValue(int count);

  /// No description provided for @componentTypesFilterAllCount.
  ///
  /// In en, this message translates to:
  /// **'All Buckets ({count})'**
  String componentTypesFilterAllCount(int count);

  /// No description provided for @componentTypesListTitleCount.
  ///
  /// In en, this message translates to:
  /// **'Component List ({count})'**
  String componentTypesListTitleCount(int count);

  /// No description provided for @componentTypesTheoryBucket.
  ///
  /// In en, this message translates to:
  /// **'Theory Bucket'**
  String get componentTypesTheoryBucket;

  /// No description provided for @componentTypesObjectiveBucket.
  ///
  /// In en, this message translates to:
  /// **'Objective Bucket'**
  String get componentTypesObjectiveBucket;

  /// No description provided for @componentTypesWeightText.
  ///
  /// In en, this message translates to:
  /// **'Standard weight: {percent}%'**
  String componentTypesWeightText(int percent);

  /// No description provided for @componentTypesOmrText.
  ///
  /// In en, this message translates to:
  /// **'OMR Evaluation • {percent}%'**
  String componentTypesOmrText(int percent);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['bn', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'bn':
      return AppLocalizationsBn();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
