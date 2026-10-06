import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:schoolmate/l10n/app_localizations.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/routes/app_routes.dart';

import 'package:schoolmate/core/widgets/language_toggle_button.dart';

class OnboardingPage extends StatefulWidget {
  static const String routeName = '/onboarding';
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      context.go(AppRoutes.roleSelection);
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _skip() {
    context.go(AppRoutes.roleSelection);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_currentPage == 0)
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? AppColors.darkBadgePurpleBg
                                : const Color(0xFFF0EFFF),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.school,
                            color: AppColors.primaryPurple,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Schoolmate',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ],
                    )
                  else
                    InkWell(
                      onTap: _previousPage,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppColors.darkSurface
                              : Colors.grey.shade100,
                        ),
                        child: Icon(
                          Icons.chevron_left,
                          size: 24,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ),

                  const LanguageToggleButton(),
                ],
              ),
            ),

            // Page View
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  _buildPage1(context),
                  _buildPage2(context),
                  _buildPage3(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _localizedText(
    BuildContext context,
    String english, {
    String? bangla,
  }) {
    final locale = AppLocalizations.of(context)?.localeName ?? 'en';
    return locale.startsWith('bn') ? (bangla ?? english) : english;
  }

  Widget _buildPage1(BuildContext context) {
    return _buildOnboardingContent(
      illustrationBg: const Color(0xFFF0F7FF),
      illustration: _buildStudentIllustration(context),
      title: _localizedText(
        context,
        'Track your learning',
        bangla: 'আপনার শেখা ট্র্যাক করুন',
      ),
      subtitle: _localizedText(
        context,
        'Stay updated with classes, homework, results and fees in one place.',
        bangla: 'একই জায়গায় ক্লাস, হোমওয়ার্ক, রেজাল্ট ও ফি দেখুন।',
      ),
      buttonColor: const Color(0xFF7B52F4),
      buttonText: _localizedText(context, 'Next', bangla: 'পরবর্তী'),
      dotColor: const Color(0xFF7B52F4),
      pageIndex: 0,
      bottomNote: _localizedText(
        context,
        'Made for students and families.',
        bangla: 'শিক্ষার্থী ও পরিবারদের জন্য ডিজাইন করা।',
      ),
    );
  }

  Widget _buildPage2(BuildContext context) {
    return _buildOnboardingContent(
      illustrationBg: const Color(0xFFE9F9F4),
      illustration: _buildTeacherIllustration(context),
      title: _localizedText(
        context,
        'Manage your classroom',
        bangla: 'আপনার শ্রেণি পরিচালনা করুন',
      ),
      subtitle: _localizedText(
        context,
        'Review attendance, assignments and student progress with less effort.',
        bangla: 'কম কষ্টে হাজিরা, অ্যাসাইনমেন্ট ও শিক্ষার্থীর অগ্রগতি দেখুন।',
      ),
      buttonColor: const Color(0xFF0F7A69),
      buttonText: _localizedText(context, 'Next', bangla: 'পরবর্তী'),
      dotColor: const Color(0xFF0F7A69),
      pageIndex: 1,
    );
  }

  Widget _buildPage3(BuildContext context) {
    return _buildOnboardingContent(
      illustrationBg: const Color(0xFFF7F0FF),
      illustration: _buildInstitutionIllustration(context),
      topBadgeText: _localizedText(
        context,
        'Institution edition',
        bangla: 'প্রতিষ্ঠান সংস্করণ',
      ),
      title: _localizedText(
        context,
        'Everything in one place',
        bangla: 'সবকিছু এক জায়গায়',
      ),
      subtitle: _localizedText(
        context,
        'Monitor students, teachers, fees and reports from your school dashboard.',
        bangla: 'আপনার স্কুল ড্যাশবোর্ড থেকে শিক্ষার্থী, শিক্ষক, ফি ও রিপোর্ট দেখুন।',
      ),
      buttonColor: const Color(0xFF8A4DFF),
      buttonText: _localizedText(context, 'Get started', bangla: 'শুরু করুন'),
      dotColor: const Color(0xFF8A4DFF),
      pageIndex: 2,
    );
  }

  Widget _buildOnboardingContent({
    required Color illustrationBg,
    required Widget illustration,
    String? topBadgeText,
    required String title,
    required String subtitle,
    required Color buttonColor,
    required String buttonText,
    required Color dotColor,
    required int pageIndex,
    String? bottomNote,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 20),
                      Container(
                        height: constraints.maxHeight > 700 ? 360 : 300,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: illustrationBg,
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: illustration,
                      ),
                    ],
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(height: 24),
                      if (topBadgeText != null) ...[
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? AppColors.darkBadgePurpleBg
                                : const Color(0xFFF0EFFF),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.verified,
                                size: 14,
                                color: AppColors.primaryPurple,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                topBadgeText,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primaryPurple,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        subtitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white70
                              : (Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.color ??
                                    AppColors.textSecondary),
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(3, (index) {
                          final isActive = index == pageIndex;
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            height: 6,
                            width: isActive ? 24 : 6,
                            decoration: BoxDecoration(
                              color: isActive
                                  ? dotColor
                                  : (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? AppColors.darkBorder
                                        : Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(3),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 32),
                      Row(
                        children: [
                          if (pageIndex < 2) ...[
                            TextButton(
                              onPressed: _skip,
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 16,
                                ),
                              ),
                              child: Text(
                                _localizedText(
                                  context,
                                  'Skip',
                                  bangla: 'এড়িয়ে যান',
                                ),
                                style: TextStyle(
                                  color:
                                      Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white54
                                      : (Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.color ??
                                            AppColors.textSecondary),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                          ],
                          Expanded(
                            child: SizedBox(
                              height: 54,
                              child: ElevatedButton(
                                onPressed: _nextPage,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: buttonColor,
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  buttonText,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (bottomNote != null) ...[
                        const SizedBox(height: 16),
                        Text(
                          bottomNote,
                          style: TextStyle(
                            fontSize: 11,
                            color:
                                (Theme.of(context).textTheme.bodySmall?.color ??
                                AppColors.textMuted),
                          ),
                        ),
                      ],
                      const SizedBox(height: 24),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // --- MOCK ILLUSTRATIONS ---
  Widget _buildStudentIllustration(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 140,
          height: 140,
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? const Color(0xFF0F2B40)
                : const Color(0xFFC7E0F4),
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: Icon(Icons.person, size: 100, color: Color(0xFF1B4965)),
          ),
        ),
        Positioned(
          top: 40,
          left: -10,
          child: _buildFloatingBadge(
            context,
            Icons.emoji_events,
            _localizedText(context, 'Results', bangla: 'ফলাফল'),
            _localizedText(
              context,
              'View academic progress',
              bangla: 'শিক্ষাগত অগ্রগতি দেখুন',
            ),
            const Color(0xFF38B2AC),
          ),
        ),
        Positioned(
          top: 60,
          right: 0,
          child: _buildFloatingBadge(
            context,
            Icons.check_circle,
            _localizedText(context, 'Attendance', bangla: 'হাজিরা'),
            _localizedText(
              context,
              'Track classroom presence',
              bangla: 'ক্লাসের উপস্থিতি দেখুন',
            ),
            const Color(0xFF7B52F4),
          ),
        ),
        Positioned(
          bottom: 70,
          left: 10,
          child: _buildFloatingBadge(
            context,
            Icons.assignment,
            _localizedText(context, 'Homework', bangla: 'হোমওয়ার্ক'),
            _localizedText(context, 'Assignments due', bangla: 'নির্ধারিত কাজ'),
            const Color(0xFFDD6B20),
          ),
        ),
        Positioned(
          bottom: 20,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.darkSurface
                  : Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.transparent
                      : Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Text(
              _localizedText(context, 'Classes', bangla: 'ক্লাস'),
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTeacherIllustration(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 140,
          height: 140,
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? const Color(0xFF133824)
                : const Color(0xFFC6F6D5),
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: Icon(
              Icons.support_agent,
              size: 90,
              color: Color(0xFF234E52),
            ),
          ),
        ),
        Positioned(
          top: 40,
          left: 0,
          child: _buildFloatingBadge(
            context,
            Icons.fact_check,
            _localizedText(
              context,
              'Digital attendance',
              bangla: 'ডিজিটাল হাজিরা',
            ),
            _localizedText(
              context,
              'Live student tracking',
              bangla: 'লাইভ ছাত্র ট্র্যাকিং',
            ),
            const Color(0xFF38B2AC),
          ),
        ),
        Positioned(
          top: 70,
          right: -10,
          child: _buildFloatingBadge(
            context,
            Icons.assignment_turned_in,
            _localizedText(context, 'Assignments', bangla: 'অ্যাসাইনমেন্ট'),
            _localizedText(
              context,
              'Submit and review',
              bangla: 'জমা ও পর্যালোচনা',
            ),
            const Color(0xFFDD6B20),
          ),
        ),
        Positioned(
          bottom: 40,
          left: 20,
          child: _buildFloatingBadge(
            context,
            Icons.message,
            _localizedText(context, 'Messages', bangla: 'বার্তা'),
            _localizedText(context, 'School updates', bangla: 'স্কুল আপডেট'),
            const Color(0xFF2B6CB0),
          ),
        ),
      ],
    );
  }

  Widget _buildInstitutionIllustration(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? const Color(0xFF2B1A4A)
                : const Color(0xFFE9D8FD),
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: Icon(
              Icons.account_balance,
              size: 90,
              color: Color(0xFF44337A),
            ),
          ),
        ),
        Positioned(
          top: 30,
          right: 0,
          child: _buildFloatingBadge(
            context,
            Icons.groups,
            _localizedText(context, 'Total students', bangla: 'মোট শিক্ষার্থী'),
            _localizedText(
              context,
              'Everything in one view',
              bangla: 'সবকিছু এক দৃষ্টিতে',
            ),
            const Color(0xFF8A4DFF),
          ),
        ),
        Positioned(
          top: 70,
          left: -10,
          child: _buildFloatingBadge(
            context,
            Icons.insights,
            _localizedText(context, 'Reports', bangla: 'রিপোর্ট'),
            _localizedText(
              context,
              'Track performance',
              bangla: 'কর্মক্ষমতা দেখুন',
            ),
            const Color(0xFFD69E2E),
          ),
        ),
        Positioned(
          bottom: 30,
          left: 10,
          child: _buildFloatingBadge(
            context,
            Icons.account_balance_wallet,
            _localizedText(context, 'Fees', bangla: 'ফি'),
            _localizedText(context, 'Due & payments', bangla: 'বকেয়া ও পরিশোধ'),
            const Color(0xFF38B2AC),
          ),
        ),
      ],
    );
  }

  Widget _buildFloatingBadge(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
    Color iconColor,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.darkSurface
            : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.transparent
                : Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? iconColor.withValues(alpha: 0.2)
                  : iconColor.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 14, color: iconColor),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 9,
                  color:
                      (Theme.of(context).textTheme.bodyMedium?.color ??
                      AppColors.textSecondary),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
