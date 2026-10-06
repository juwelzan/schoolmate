import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:schoolmate/core/routes/app_routes.dart';
import 'package:schoolmate/core/theme/app_colors.dart';
import 'package:schoolmate/core/widgets/custom_text_style.dart';
import 'package:schoolmate/l10n/app_localizations.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  String _searchQuery = '';

  bool _matches(String text) {
    if (_searchQuery.isEmpty) return true;
    return text.toLowerCase().contains(_searchQuery.toLowerCase());
  }

  bool _expandableMatches(String title, List<String> childTitles) {
    if (_matches(title)) return true;
    for (var child in childTitles) {
      if (_matches(child)) return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final String currentRoute = GoRouterState.of(context).uri.toString();
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                padding: const EdgeInsets.only(
                  top: 32.0,
                  bottom: 24.0,
                  left: 24.0,
                  right: 24.0,
                ),
                decoration: BoxDecoration(
                  color: (Theme.of(context).brightness == Brightness.dark
                      ? AppColors.darkSurface
                      : AppColors.white),
                  border: Border(
                    bottom: BorderSide(
                      color: (Theme.of(context).brightness == Brightness.dark
                          ? AppColors.darkBorder
                          : AppColors.divider),
                      width: 1,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor
                            .withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).primaryColor
                              .withValues(alpha: 0.2),
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.domain,
                          color: Theme.of(context).primaryColor,
                          size: 32,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      l10n.drawerSchoolName,
                      style: CustomTextStyles.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          l10n.drawerViewInstitutionProfile,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.arrow_forward,
                          color: Theme.of(context).primaryColor,
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
                  color: (Theme.of(context).brightness == Brightness.dark
                      ? AppColors.darkSurface
                      : AppColors.white),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).primaryColor
                          .withValues(alpha: 0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  onChanged: (val) => setState(() => _searchQuery = val),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  decoration: InputDecoration(
                    hintText: l10n.drawerFindAPage,
                    hintStyle: TextStyle(
                      color: (Theme.of(context).brightness == Brightness.dark
                          ? AppColors.darkTextMuted
                          : AppColors.textMuted),
                    ),
                    prefixIcon: Icon(
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
                    context,
                    icon: Icons.bar_chart,
                    title: l10n.drawerDashboard,
                    iconColor: Theme.of(context).primaryColor,
                    iconBgColor:
                        (Theme.of(context).brightness == Brightness.dark
                        ? AppColors.darkBadgePurpleBg
                        : AppColors.surfaceVerySoftPurple),
                    isSelected:
                        currentRoute == AppRoutes.institutionAdminDashboard,
                    onTap: () =>
                        context.push(AppRoutes.institutionAdminDashboard),
                  ),

                  _buildSectionHeader(context, l10n.drawerInstitutionSetup),

                  _buildDrawerItem(
                    context,
                    icon: Icons.layers_outlined,
                    title: l10n.drawerMultitrack,
                    isSelected: currentRoute == AppRoutes.multiTrack,
                    onTap: () => context.push(AppRoutes.multiTrack),
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.account_balance,
                    title: l10n.drawerBoardAffiliations,
                    isSelected: currentRoute == AppRoutes.boardAffiliations,
                    onTap: () => context.push(AppRoutes.boardAffiliations),
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.people_outline,
                    title: l10n.drawerSmcGoverningBody,
                    isSelected: currentRoute == AppRoutes.smcGoverningBody,
                    onTap: () => context.push(AppRoutes.smcGoverningBody),
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.location_on_outlined,
                    title: l10n.drawerCampuses,
                    isSelected: currentRoute == AppRoutes.campuses,
                    onTap: () => context.push(AppRoutes.campuses),
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.account_tree_outlined,
                    title: l10n.drawerBranches,
                    isSelected: currentRoute == AppRoutes.branches,
                    onTap: () => context.push(AppRoutes.branches),
                  ),

                  ExpandableDrawerItem(
                    isVisible: _expandableMatches(l10n.drawerAcademic, [
                      l10n.drawerYears,
                      l10n.drawerCalendar,
                      l10n.drawerShifts,
                      l10n.drawerProgramStructures,
                      l10n.drawerGradingScales,
                      l10n.drawerComponentTypes,
                      l10n.drawerClassesSections,
                      l10n.drawerGroupsStreams,
                      l10n.drawerSubjects,
                      l10n.drawerSubjectAssignments,
                      l10n.drawerPreprimary,
                      l10n.drawerLessonPlans,
                      l10n.drawerCurriculum,
                      l10n.drawerSyllabus,
                      l10n.drawerStudyPlans,
                    ]),
                    forceExpand: _searchQuery.isNotEmpty,
                    icon: Icons.calendar_today_outlined,
                    title: l10n.drawerAcademic,
                    isInitiallyExpanded:
                        currentRoute.contains('/academic') ||
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
                            _buildSubMenuItem(
                              context,
                              l10n.drawerYears,
                              AppRoutes.years,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerCalendar,
                              AppRoutes.calendar,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerShifts,
                              AppRoutes.shifts,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerProgramStructures,
                              AppRoutes.programStructures,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerGradingScales,
                              AppRoutes.gradingScales,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerComponentTypes,
                              AppRoutes.componentTypes,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerClassesSections,
                              AppRoutes.classesSections,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerGroupsStreams,
                              AppRoutes.groupsStreams,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerSubjects,
                              AppRoutes.subjects,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerSubjectAssignments,
                              AppRoutes.subjectAssignments,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerPreprimary,
                              AppRoutes.prePrimary,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerLessonPlans,
                              AppRoutes.lessonPlans,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerCurriculum,
                              AppRoutes.curriculum,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerSyllabus,
                              AppRoutes.syllabus,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerStudyPlans,
                              AppRoutes.studyPlans,
                              currentRoute,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  ExpandableDrawerItem(
                    isVisible: _expandableMatches(l10n.drawerTimetable, [
                      l10n.drawerPeriodSlots,
                      l10n.drawerRooms,
                      l10n.drawerClassTimetable,
                      l10n.drawerShiftTimetable,
                      l10n.drawerTeacherTimetable,
                      l10n.drawerRoomTimetable,
                      l10n.drawerSubjectDistributionRules,
                      l10n.drawerTeacherAvailability,
                      l10n.drawerPublish,
                      l10n.drawerSubstituteAssignment,
                      l10n.drawerRevisions,
                      l10n.drawerPeriodSwap,
                    ]),
                    forceExpand: _searchQuery.isNotEmpty,
                    icon: Icons.access_time,
                    title: l10n.drawerTimetable,
                    isInitiallyExpanded:
                        currentRoute.contains('/timetable') ||
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
                            _buildSubMenuItem(
                              context,
                              l10n.drawerPeriodSlots,
                              AppRoutes.periodSlots,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerRooms,
                              AppRoutes.rooms,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerClassTimetable,
                              AppRoutes.classTimetable,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerShiftTimetable,
                              AppRoutes.shiftTimetable,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerTeacherTimetable,
                              AppRoutes.teacherTimetable,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerRoomTimetable,
                              AppRoutes.roomTimetable,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerSubjectDistributionRules,
                              AppRoutes.subjectDistributionRules,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerTeacherAvailability,
                              AppRoutes.teacherAvailability,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerPublish,
                              AppRoutes.publish,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerSubstituteAssignment,
                              AppRoutes.substituteAssignment,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerRevisions,
                              AppRoutes.revisions,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerPeriodSwap,
                              AppRoutes.periodSwap,
                              currentRoute,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.description_outlined,
                    title: l10n.drawerDocumentTemplates,
                    isSelected: currentRoute == AppRoutes.documentTemplates,
                    onTap: () => context.push(AppRoutes.documentTemplates),
                  ),

                  _buildSectionHeader(context, l10n.drawerPeople),
                  _buildDrawerItem(
                    context,
                    icon: Icons.people_alt_outlined,
                    title: l10n.drawerStudents,
                    isSelected: currentRoute == AppRoutes.students,
                    onTap: () => context.push(AppRoutes.students),
                  ),

                  ExpandableDrawerItem(
                    isVisible: _expandableMatches(l10n.drawerTeachersStaff, [
                      l10n.drawerTeachers,
                      l10n.drawerStaff,
                      l10n.drawerRecruitment,
                      l10n.drawerLeaveTypes,
                      l10n.drawerAcademicDesignations,
                      l10n.drawerBulkImportAssignments,
                      l10n.drawerSubjectAssignmentMatrix,
                    ]),
                    forceExpand: _searchQuery.isNotEmpty,
                    icon: Icons.person_outline,
                    title: l10n.drawerTeachersStaff,
                    isInitiallyExpanded:
                        currentRoute.contains('/teachers-staff') ||
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
                            _buildSubMenuItem(
                              context,
                              l10n.drawerTeachers,
                              AppRoutes.teachers,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerStaff,
                              AppRoutes.staff,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerRecruitment,
                              AppRoutes.recruitment,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerLeaveTypes,
                              AppRoutes.leaveTypes,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerAcademicDesignations,
                              AppRoutes.academicDesignations,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerBulkImportAssignments,
                              AppRoutes.bulkImportAssignments,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerSubjectAssignmentMatrix,
                              AppRoutes.subjectAssignmentMatrix,
                              currentRoute,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.manage_accounts_outlined,
                    title: l10n.drawerUsers,
                    isSelected: currentRoute == AppRoutes.users,
                    onTap: () => context.push(AppRoutes.users),
                  ),

                  _buildSectionHeader(context, l10n.drawerAcademics),

                  ExpandableDrawerItem(
                    isVisible: _expandableMatches(l10n.drawerExamination, [
                      l10n.drawerExams,
                      l10n.drawerExamTerms,
                      l10n.drawerExamTypes,
                      l10n.drawerBoardSubjectCombinations,
                      l10n.drawerBacklogimprovementRules,
                      l10n.drawerQuestionBank,
                      l10n.drawerQuestionPapers,
                      l10n.drawerMarksEntry,
                      l10n.drawerMarksApprovalQueue,
                      l10n.drawerResultCompositions,
                      l10n.drawerWeightProfiles,
                      l10n.drawerRankingProfiles,
                      l10n.drawerGraceMarkPolicies,
                      l10n.drawerCompartmentalEligibilityPolicies,
                      l10n.drawerAssessmentDomains,
                      l10n.drawerPreprimaryAssessment,
                      l10n.drawerDevelopmentalMilestones,
                      l10n.drawerMilestoneTracker,
                    ]),
                    forceExpand: _searchQuery.isNotEmpty,
                    icon: Icons.assignment_outlined,
                    title: l10n.drawerExamination,
                    isInitiallyExpanded:
                        currentRoute.contains('/examination') ||
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
                        currentRoute ==
                            AppRoutes.compartmentalEligibilityPolicies ||
                        currentRoute == AppRoutes.assessmentDomains ||
                        currentRoute == AppRoutes.prePrimaryAssessment ||
                        currentRoute == AppRoutes.developmentalMilestones ||
                        currentRoute == AppRoutes.milestoneTracker,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                          children: [
                            _buildSubMenuItem(
                              context,
                              l10n.drawerExams,
                              AppRoutes.exams,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerExamTerms,
                              AppRoutes.examTerms,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerExamTypes,
                              AppRoutes.examTypes,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerBoardSubjectCombinations,
                              AppRoutes.boardSubjectCombinations,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerBacklogimprovementRules,
                              AppRoutes.backlogImprovementRules,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerQuestionBank,
                              AppRoutes.questionBank,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerQuestionPapers,
                              AppRoutes.questionPapers,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerMarksEntry,
                              AppRoutes.marksEntry,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerMarksApprovalQueue,
                              AppRoutes.marksApprovalQueue,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerResultCompositions,
                              AppRoutes.resultCompositions,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerWeightProfiles,
                              AppRoutes.weightProfiles,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerRankingProfiles,
                              AppRoutes.rankingProfiles,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerGraceMarkPolicies,
                              AppRoutes.graceMarkPolicies,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerCompartmentalEligibilityPolicies,
                              AppRoutes.compartmentalEligibilityPolicies,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerAssessmentDomains,
                              AppRoutes.assessmentDomains,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerPreprimaryAssessment,
                              AppRoutes.prePrimaryAssessment,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerDevelopmentalMilestones,
                              AppRoutes.developmentalMilestones,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerMilestoneTracker,
                              AppRoutes.milestoneTracker,
                              currentRoute,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  ExpandableDrawerItem(
                    isVisible: _expandableMatches(l10n.drawerAttendance, [
                      l10n.drawerDailySummary,
                      l10n.drawerShiftAttendance,
                      l10n.drawerMonthlyAttendance,
                      l10n.drawerAttendanceEligibility,
                      l10n.drawerTeacherAttendance,
                      l10n.drawerStaffAttendance,
                      l10n.drawerTeacherMonthlyReport,
                      l10n.drawerSubjectCoverageReport,
                      l10n.drawerAttendanceAnalytics,
                      l10n.drawerAttendanceDevices,
                      l10n.drawerInstituteGateAttendance,
                      l10n.drawerAttendanceEvents,
                      l10n.drawerPracticalLabAttendance,
                      l10n.drawerPracticalLabSummary,
                      l10n.drawerCombinedEligibility,
                    ]),
                    forceExpand: _searchQuery.isNotEmpty,
                    icon: Icons.fact_check_outlined,
                    title: l10n.drawerAttendance,
                    isInitiallyExpanded:
                        currentRoute.contains('/attendance') ||
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
                            _buildSubMenuItem(
                              context,
                              l10n.drawerDailySummary,
                              AppRoutes.dailySummary,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerShiftAttendance,
                              AppRoutes.shiftAttendance,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerMonthlyAttendance,
                              AppRoutes.monthlyAttendance,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerAttendanceEligibility,
                              AppRoutes.attendanceEligibility,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerTeacherAttendance,
                              AppRoutes.teacherAttendance,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerStaffAttendance,
                              AppRoutes.staffAttendance,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerTeacherMonthlyReport,
                              AppRoutes.teacherMonthlyReport,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerSubjectCoverageReport,
                              AppRoutes.subjectCoverageReport,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerAttendanceAnalytics,
                              AppRoutes.attendanceAnalytics,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerAttendanceDevices,
                              AppRoutes.attendanceDevices,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerInstituteGateAttendance,
                              AppRoutes.instituteGateAttendance,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerAttendanceEvents,
                              AppRoutes.attendanceEvents,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerPracticalLabAttendance,
                              AppRoutes.practicalLabAttendance,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerPracticalLabSummary,
                              AppRoutes.practicalLabSummary,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerCombinedEligibility,
                              AppRoutes.combinedEligibility,
                              currentRoute,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  ExpandableDrawerItem(
                    isVisible: _expandableMatches(l10n.drawerCertificates, [
                      l10n.drawerIssueCertificates,
                      l10n.drawerTemplates,
                    ]),
                    forceExpand: _searchQuery.isNotEmpty,
                    icon: Icons.workspace_premium_outlined,
                    title: l10n.drawerCertificates,
                    isInitiallyExpanded:
                        currentRoute.contains('/certificates') ||
                        currentRoute == AppRoutes.issueCertificates ||
                        currentRoute == AppRoutes.templates,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                          children: [
                            _buildSubMenuItem(
                              context,
                              l10n.drawerIssueCertificates,
                              AppRoutes.issueCertificates,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerTemplates,
                              AppRoutes.templates,
                              currentRoute,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  _buildSectionHeader(context, l10n.drawerFinance),

                  ExpandableDrawerItem(
                    isVisible: _expandableMatches(l10n.drawerFee, [
                      l10n.drawerFeeHeads,
                      l10n.drawerFeeStructure,
                      l10n.drawerLateFeeRules,
                      l10n.drawerInstalmentPlans,
                      l10n.drawerShiftFeeStructure,
                      l10n.drawerInvoices,
                      l10n.drawerDueTracking,
                      l10n.drawerDefaulterList,
                      l10n.drawerCollectPayment,
                      l10n.drawerOnlinePayments,
                      l10n.drawerDuesbasedAccess,
                      l10n.drawerGovernmentStipend,
                      l10n.drawerFeeReports,
                      l10n.drawerStudentLedger,
                    ]),
                    forceExpand: _searchQuery.isNotEmpty,
                    icon: Icons.account_balance_wallet_outlined,
                    title: l10n.drawerFee,
                    isInitiallyExpanded:
                        currentRoute.contains('/fee') ||
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
                            _buildSubMenuItem(
                              context,
                              l10n.drawerFeeHeads,
                              AppRoutes.feeHeads,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerFeeStructure,
                              AppRoutes.feeStructure,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerLateFeeRules,
                              AppRoutes.lateFeeRules,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerInstalmentPlans,
                              AppRoutes.instalmentPlans,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerShiftFeeStructure,
                              AppRoutes.shiftFeeStructure,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerInvoices,
                              AppRoutes.invoices,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerDueTracking,
                              AppRoutes.dueTracking,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerDefaulterList,
                              AppRoutes.defaulterList,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerCollectPayment,
                              AppRoutes.collectPayment,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerOnlinePayments,
                              AppRoutes.onlinePayments,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerDuesbasedAccess,
                              AppRoutes.duesBasedAccess,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerGovernmentStipend,
                              AppRoutes.governmentStipend,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerFeeReports,
                              AppRoutes.feeReports,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerStudentLedger,
                              AppRoutes.studentLedger,
                              currentRoute,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  ExpandableDrawerItem(
                    isVisible: _expandableMatches("Finance", [
                      l10n.drawerChartOfAccounts,
                      l10n.drawerVouchers,
                      l10n.drawerNewVoucher,
                      l10n.drawerNewDebitcreditNote,
                      l10n.drawerExpenses,
                      l10n.drawerNewExpense,
                      l10n.drawerIncome,
                      l10n.drawerNewIncome,
                      l10n.drawerAutopostingSettings,
                      l10n.drawerGeneralLedger,
                      l10n.drawerTrialBalance,
                      l10n.drawerIncomeStatement,
                      l10n.drawerBalanceSheet,
                      l10n.drawerCashBook,
                      l10n.drawerBankBook,
                      l10n.drawerBudgets,
                      l10n.drawerBudgetVsActual,
                    ]),
                    forceExpand: _searchQuery.isNotEmpty,
                    icon: Icons.calculate_outlined,
                    title: "Finance",
                    isInitiallyExpanded:
                        currentRoute.contains('/finance') ||
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
                            _buildSubMenuItem(
                              context,
                              l10n.drawerChartOfAccounts,
                              AppRoutes.chartOfAccounts,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerVouchers,
                              AppRoutes.vouchers,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerNewVoucher,
                              AppRoutes.newVoucher,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerNewDebitcreditNote,
                              AppRoutes.newDebitCreditNote,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerExpenses,
                              AppRoutes.expenses,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerNewExpense,
                              AppRoutes.newExpense,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerIncome,
                              AppRoutes.income,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerNewIncome,
                              AppRoutes.newIncome,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerAutopostingSettings,
                              AppRoutes.autoPostingSettings,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerGeneralLedger,
                              AppRoutes.generalLedger,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerTrialBalance,
                              AppRoutes.trialBalance,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerIncomeStatement,
                              AppRoutes.incomeStatement,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerBalanceSheet,
                              AppRoutes.balanceSheet,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerCashBook,
                              AppRoutes.cashBook,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerBankBook,
                              AppRoutes.bankBook,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerBudgets,
                              AppRoutes.budgets,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerBudgetVsActual,
                              AppRoutes.budgetVsActual,
                              currentRoute,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.credit_card,
                    title: l10n.drawerPaymentGateways,
                    isSelected: currentRoute == AppRoutes.paymentGateways,
                    onTap: () => context.push(AppRoutes.paymentGateways),
                  ),

                  _buildSectionHeader(context, l10n.drawerOperations),
                  _buildDrawerItem(
                    context,
                    icon: Icons.article_outlined,
                    title: l10n.drawerOnlineAdmission,
                    isSelected: currentRoute == AppRoutes.onlineAdmission,
                    onTap: () => context.push(AppRoutes.onlineAdmission),
                  ),

                  ExpandableDrawerItem(
                    isVisible: _expandableMatches(l10n.drawerInventory, [
                      l10n.drawerAssets,
                      l10n.drawerStockItems,
                      l10n.drawerWarehouses,
                      l10n.drawerVendors,
                      l10n.drawerProcurementRequests,
                      l10n.drawerPurchaseOrders,
                      l10n.drawerGoodsReceipts,
                    ]),
                    forceExpand: _searchQuery.isNotEmpty,
                    icon: Icons.inventory_2_outlined,
                    title: l10n.drawerInventory,
                    isInitiallyExpanded:
                        currentRoute.contains('/inventory') ||
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
                            _buildSubMenuItem(
                              context,
                              l10n.drawerAssets,
                              AppRoutes.assets,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerStockItems,
                              AppRoutes.stockItems,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerWarehouses,
                              AppRoutes.warehouses,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerVendors,
                              AppRoutes.vendors,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerProcurementRequests,
                              AppRoutes.procurementRequests,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerPurchaseOrders,
                              AppRoutes.purchaseOrders,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerGoodsReceipts,
                              AppRoutes.goodsReceipts,
                              currentRoute,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  ExpandableDrawerItem(
                    isVisible: _expandableMatches(l10n.drawerCommunication, [
                      l10n.drawerBulkSms,
                      l10n.drawerBulkEmail,
                      l10n.drawerSmsGateways,
                      l10n.drawerEmailSettings,
                      l10n.drawerAnnouncements,
                      l10n.drawerNoticeBoard,
                      l10n.drawerEmergencyBroadcast,
                      l10n.drawerMessages,
                    ]),
                    forceExpand: _searchQuery.isNotEmpty,
                    icon: Icons.chat_bubble_outline,
                    title: l10n.drawerCommunication,
                    isInitiallyExpanded:
                        currentRoute.contains('/communication') ||
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
                            _buildSubMenuItem(
                              context,
                              l10n.drawerBulkSms,
                              AppRoutes.bulkSms,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerBulkEmail,
                              AppRoutes.bulkEmail,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerSmsGateways,
                              AppRoutes.smsGateways,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerEmailSettings,
                              AppRoutes.emailSettings,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerAnnouncements,
                              AppRoutes.announcements,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerNoticeBoard,
                              AppRoutes.noticeBoard,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerEmergencyBroadcast,
                              AppRoutes.emergencyBroadcast,
                              currentRoute,
                            ),
                            _buildSubMenuItem(
                              context,
                              l10n.drawerMessages,
                              AppRoutes.messages,
                              currentRoute,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.language,
                    title: l10n.drawerWebsite,
                    isSelected: currentRoute == AppRoutes.website,
                    onTap: () => context.push(AppRoutes.website),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Divider(
                      color: (Theme.of(context).brightness == Brightness.dark
                          ? AppColors.darkBorder
                          : AppColors.divider),
                      height: 1,
                    ),
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.history,
                    title: l10n.drawerActivityLog,
                    isSelected: currentRoute == AppRoutes.activityLog,
                    onTap: () => context.push(AppRoutes.activityLog),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Divider(
                      color: (Theme.of(context).brightness == Brightness.dark
                          ? AppColors.darkBorder
                          : AppColors.divider),
                      height: 1,
                    ),
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.logout,
                    title: l10n.drawerLogout,
                    iconColor: Colors.redAccent,
                    iconBgColor:
                        (Theme.of(context).brightness == Brightness.dark
                        ? Colors.redAccent.withValues(alpha: 0.15)
                        : Color(0xFFFFEBEE)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    if (_searchQuery.isNotEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, top: 24.0, bottom: 8.0),
      child: Text(
        title,
        style: CustomTextStyles.inter(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: (Theme.of(context).brightness == Brightness.dark
              ? AppColors.darkTextMuted
              : AppColors.textMuted),
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildSubMenuItem(
    BuildContext context,
    String title,
    String route,
    String currentRoute, [
    String? parentQuery,
  ]) {
    final query = parentQuery ?? _searchQuery;
    if (query.isNotEmpty && !title.toLowerCase().contains(query.toLowerCase())) {
      return const SizedBox.shrink();
    }
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
          color: isSelected
              ? Theme.of(context).primaryColor
              : (Theme.of(context).textTheme.bodyMedium?.color ??
                    AppColors.textSecondary),
        ),
      ),
      onTap: () => context.push(route),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      tileColor: isSelected
          ? (Theme.of(context).brightness == Brightness.dark
                ? AppColors.darkBadgePurpleBg
                : AppColors.surfaceVerySoftPurple)
          : Colors.transparent,
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    VoidCallback? onTap,
    bool isSelected = false,
    bool hasTrailing = false,
    Color? iconColor,
    Color? iconBgColor,
  }) {
    if (_searchQuery.isNotEmpty &&
        !title.toLowerCase().contains(_searchQuery.toLowerCase())) {
      return const SizedBox.shrink();
    }
    final defaultIconColor = isSelected
        ? Theme.of(context).primaryColor
        : (Theme.of(context).textTheme.bodyMedium?.color ??
              AppColors.textSecondary);
    final defaultBgColor = isSelected
        ? (Theme.of(context).brightness == Brightness.dark
              ? AppColors.darkBadgePurpleBg
              : AppColors.surfaceVerySoftPurple)
        : Colors.transparent;

    return Container(
      margin: const EdgeInsets.only(bottom: 4.0),
      decoration: BoxDecoration(
        color: isSelected
            ? (Theme.of(context).brightness == Brightness.dark
                  ? AppColors.darkSurface
                  : AppColors.white)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: Theme.of(context).primaryColor.withValues(alpha: 0.04),
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
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: CustomTextStyles.inter(
                      fontSize: 14,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w500,
                      color: isSelected
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
                if (hasTrailing)
                  Icon(
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
  final bool isVisible;
  final bool forceExpand;

  const ExpandableDrawerItem({
    super.key,
    required this.icon,
    required this.title,
    required this.children,
    required this.isVisible,
    required this.forceExpand,
    this.isInitiallyExpanded = false,
  });

  @override
  State<ExpandableDrawerItem> createState() => _ExpandableDrawerItemState();
}

class _ExpandableDrawerItemState extends State<ExpandableDrawerItem>
    with SingleTickerProviderStateMixin {
  late bool _isExpanded;
  late AnimationController _controller;
  late Animation<double> _iconTurns;
  late Animation<double> _heightFactor;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.isInitiallyExpanded;
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
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
    if (!widget.isVisible) return const SizedBox.shrink();
    final bool displayExpanded = _isExpanded || widget.forceExpand;
    final iconColor = displayExpanded
        ? Theme.of(context).primaryColor
        : (Theme.of(context).textTheme.bodyMedium?.color ??
              AppColors.textSecondary);
    final textColor = displayExpanded
        ? Theme.of(context).primaryColor
        : (Theme.of(context).textTheme.bodyMedium?.color ??
              AppColors.textSecondary);

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
              onTap: widget.forceExpand ? null : _handleTap,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
                child: Row(
                  children: [
                    Icon(widget.icon, color: iconColor, size: 22),
                    SizedBox(width: 12),
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
                      turns: widget.forceExpand
                          ? const AlwaysStoppedAnimation(0.5)
                          : _iconTurns,
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.inactiveIcon,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        ClipRect(
          child: AnimatedBuilder(
            animation: widget.forceExpand
                ? const AlwaysStoppedAnimation(1.0)
                : _controller.view,
            builder: _buildChildren,
            child: Column(children: widget.children),
          ),
        ),
      ],
    );
  }

  Widget _buildChildren(BuildContext context, Widget? child) {
    return Align(heightFactor: _heightFactor.value, child: child);
  }
}
