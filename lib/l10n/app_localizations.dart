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
