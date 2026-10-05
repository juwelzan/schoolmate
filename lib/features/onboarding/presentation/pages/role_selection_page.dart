import 'package:schoolmate/core/file_path.dart';
import 'package:schoolmate/core/widgets/language_toggle_button.dart';

enum UserRole { student, teacher, admin }

class RoleSelectionPage extends StatefulWidget {
  static const String routeName = '/role-selection';

  const RoleSelectionPage({super.key});

  @override
  State<RoleSelectionPage> createState() => _RoleSelectionPageState();
}

class _RoleSelectionPageState extends State<RoleSelectionPage> {
  UserRole _selectedRole = UserRole.student;

  void _handleContinue() {
    switch (_selectedRole) {
      case UserRole.student:
        context.go(AppRoutes.studentDashboard);
        break;
      case UserRole.teacher:
        context.go(AppRoutes.teacherDashboard);
        break;
      case UserRole.admin:
        context.go(AppRoutes.institutionAdminDashboard);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Top App Bar Area (Logo + Language Toggle)
            _buildTopBar(context),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    // Badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: isDark
                            ? AppColors.darkBadgePurpleBg
                            : Theme.of(context).colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.assignment_ind,
                            size: 14,
                            color: isDark
                                ? AppColors.darkPrimaryPurple
                                : Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            l10n.roleSelectionBadge,
                            style: TextStyle(
                              fontSize: 12,
                              color: isDark
                                  ? AppColors.darkPrimaryPurple
                                  : Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Title & Subtitle
                    Text(
                      l10n.roleSelectionTitle,
                      style: CustomTextStyles.bengali(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.onSurface,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      l10n.roleSelectionSubtitle,
                      style: CustomTextStyles.bengali(
                        fontSize: 14,
                        color:
                            Theme.of(context).textTheme.bodyMedium?.color ??
                            AppColors.textSecondary,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Role Options
                    _buildRoleCard(
                      role: UserRole.student,
                      title: l10n.roleStudent,
                      badgeText: l10n.roleStudentEn,
                      description: l10n.roleStudentDesc,
                      icon: Icons.school,
                      iconColor: isDark
                          ? AppColors.darkPrimaryPurple
                          : Theme.of(context).colorScheme.primary,
                      iconBgColor: isDark
                          ? AppColors.darkBadgePurpleBg
                          : Theme.of(context).colorScheme.surfaceContainerHighest,
                    ),
                    const SizedBox(height: 16),

                    _buildRoleCard(
                      role: UserRole.teacher,
                      title: l10n.roleTeacher,
                      badgeText: l10n.roleTeacherEn,
                      description: l10n.roleTeacherDesc,
                      icon: Icons.person,
                      iconColor: isDark
                          ? const Color(0xFF2DD4BF)
                          : Theme.of(context).colorScheme.primary,
                      iconBgColor: isDark
                          ? const Color(0xFF134E4A)
                          : Theme.of(context).colorScheme.surfaceContainerHighest,
                    ),
                    const SizedBox(height: 16),

                    _buildRoleCard(
                      role: UserRole.admin,
                      title: l10n.roleAdmin,
                      badgeText: l10n.roleAdminEn,
                      description: l10n.roleAdminDesc,
                      icon: Icons.account_balance,
                      iconColor: isDark
                          ? const Color(0xFFFBBF24)
                          : AppColors.warmGold,
                      iconBgColor: isDark
                          ? const Color(0xFF713F12)
                          : AppColors.softWarmGold,
                    ),

                    const SizedBox(height: 32),

                    // Info Box
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isDark
                            ? const Color(0xFF1E293B)
                            : AppColors.paleBlueSurface,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.info,
                            size: 20,
                            color: isDark
                                ? AppColors.darkPrimaryPurple
                                : Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              l10n.roleInfoText,
                              style: CustomTextStyles.bengali(
                                fontSize: 13,
                                color:
                                    Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.color ??
                                    AppColors.textSecondary,
                                height: 1.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),

            // Bottom Sticky Section
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: _handleContinue,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isDark
                            ? AppColors.darkPrimaryPurple
                            : Theme.of(context).colorScheme.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                        elevation: 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            l10n.continueButton,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            Icons.arrow_forward,
                            color: Theme.of(context).colorScheme.onPrimary,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        l10n.loginTrouble,
                        style: TextStyle(
                          fontSize: 13,
                          color:
                              Theme.of(context).textTheme.bodyMedium?.color ??
                              AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        l10n.getHelp,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: isDark
                              ? AppColors.darkPrimaryPurple
                              : Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: isDark
                          ? Colors.transparent
                          : Theme.of(context).colorScheme.primary.withOpacity(0.08),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.school,
                    color: Theme.of(context).colorScheme.primary,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.appTitleMain,
                    style: CustomTextStyles.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  Text(
                    l10n.appTitleSub,
                    style: CustomTextStyles.bengali(
                      fontSize: 12,
                      color: isDark
                          ? AppColors.darkPrimaryPurple
                          : Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const LanguageToggleButton(),
        ],
      ),
    );
  }

  Widget _buildRoleCard({
    required UserRole role,
    required String title,
    required String badgeText,
    required String description,
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bool isSelected = _selectedRole == role;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedRole = role;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? (isDark
                    ? Theme.of(context).colorScheme.surfaceContainerHighest
                    : Theme.of(context).colorScheme.surface)
              : (isDark
                    ? Theme.of(context).colorScheme.surface
                    : Theme.of(context).scaffoldBackgroundColor),
          borderRadius: BorderRadius.circular(16),
          border: isSelected
              ? Border.all(
                  color: isDark
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.primary,
                  width: 1.5,
                )
              : Border.all(
                  color: isDark ? AppColors.darkBorder : Colors.transparent,
                  width: 1.5,
                ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: isDark
                        ? Colors.transparent
                        : Theme.of(context).colorScheme.primary.withOpacity(0.08),
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  ),
                ]
              : [],
        ),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: iconBgColor,
                shape: BoxShape.circle,
              ),
              child: Center(child: Icon(icon, color: iconColor, size: 28)),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: CustomTextStyles.bengali(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: isDark
                              ? AppColors.darkBadgePurpleBg
                              : Theme.of(context).colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          badgeText,
                          style: TextStyle(
                            fontSize: 10,
                            color: isDark
                                ? AppColors.darkPrimaryPurple
                                : Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: CustomTextStyles.bengali(
                      fontSize: 12,
                      color:
                          Theme.of(context).textTheme.bodyMedium?.color ??
                          AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: isSelected
                    ? (isDark
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.primary)
                    : (isDark
                          ? AppColors.darkBorder
                          : AppColors.divider.withOpacity(0.5)),
                shape: BoxShape.circle,
              ),
              child: isSelected
                  ? Icon(Icons.check, color: Theme.of(context).colorScheme.onPrimary, size: 16)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
