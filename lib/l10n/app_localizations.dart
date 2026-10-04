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
