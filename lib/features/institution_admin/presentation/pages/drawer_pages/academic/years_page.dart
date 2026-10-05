import 'package:schoolmate/core/file_path.dart';

class YearsPage extends StatefulWidget {
  static String routeName = '/years';

  const YearsPage({super.key});

  @override
  State<YearsPage> createState() => _YearsPageState();
}

class _YearsPageState extends State<YearsPage> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    // Theme aware colors
    final bgColor = Theme.of(context).scaffoldBackgroundColor;
    final cardColor = Theme.of(context).colorScheme.surface;
    final cyanAccent = Theme.of(context).colorScheme.primary;
    final textPrimary = Theme.of(context).colorScheme.onSurface;
    final textSecondary =
        Theme.of(context).textTheme.bodyMedium?.color ??
        Theme.of(context).colorScheme.onSurfaceVariant;
    final borderColor = Theme.of(context).colorScheme.outlineVariant;
    final greenAccent = AppColors.successGreen;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: SchoolMateAppBar(
        title: l10n.academicYears,
        subtitle: l10n.academicManagement,
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Active Cycle Card
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: borderColor),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    runSpacing: 12,
                    children: [
                      Wrap(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: isDark
                                  ? Color(0xFF1A3330)
                                  : AppColors.surfaceVerySoftPurple,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: (isDark
                                    ? const Color(0xFF2E5950)
                                    : Theme.of(context).colorScheme.primary.withValues(
                                        alpha: 0.3,
                                      )),
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.circle, size: 8, color: greenAccent),
                                SizedBox(width: 6),
                                Text(
                                  l10n.yearsActiveCycle,
                                  style: CustomTextStyles.inter(
                                    color: greenAccent,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 12),
                          Text(
                            l10n.yearsDay114Of365,
                            style: CustomTextStyles.inter(
                              color: textSecondary,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: cyanAccent.withValues(alpha: 0.9),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: cyanAccent.withValues(alpha: 0.3),
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.add, size: 18, color: AppColors.white),
                            SizedBox(width: 4),
                            Text(
                              l10n.yearsNewYear,
                              style: CustomTextStyles.inter(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    l10n.yearsManageTerms,
                    style: CustomTextStyles.inter(
                      color: textPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      height: 1.3,
                    ),
                  ),
                  SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        l10n.yearsTermElapsed,
                        style: CustomTextStyles.inter(
                          color: textSecondary,
                          fontSize: 12,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            l10n.yearsPercent31,
                            style: CustomTextStyles.inter(
                              color: cyanAccent,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 32),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                l10n.yearsQuarter,
                                style: CustomTextStyles.inter(
                                  color: textSecondary,
                                  fontSize: 10,
                                  letterSpacing: 1,
                                ),
                              ),
                              Text(
                                l10n.yearsQ2Spring,
                                style: CustomTextStyles.inter(
                                  color: textPrimary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  // Progress bar
                  Container(
                    height: 6,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: (isDark
                          ? AppColors.darkBorder
                          : AppColors.divider),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: 0.312,
                      child: Container(
                        decoration: BoxDecoration(
                          color: cyanAccent,
                          borderRadius: BorderRadius.circular(3),
                          boxShadow: [
                            BoxShadow(
                              color: cyanAccent.withValues(alpha: 0.5),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),

            // 2026 Card
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: borderColor),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            l10n.years2026,
                            style: CustomTextStyles.inter(
                              color: textPrimary,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 12),
                          Text(
                            l10n.years2026Bn,
                            style: CustomTextStyles.bengali(
                              color: textSecondary,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(width: 12),
                          Icon(Icons.verified, color: cyanAccent, size: 18),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: isDark
                                  ? Color(0xFF0F2A20)
                                  : Color(0xFFE6F7F0),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: (isDark
                                    ? const Color(0xFF1E4B39)
                                    : AppColors.successGreen.withValues(
                                        alpha: 0.3,
                                      )),
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.circle, size: 8, color: greenAccent),
                                SizedBox(width: 6),
                                Text(
                                  l10n.yearsLowercaseActive,
                                  style: CustomTextStyles.inter(
                                    color: greenAccent,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 12),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: isDark
                                  ? AppColors.darkSurface
                                  : AppColors.surfaceVerySoftPurple,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: borderColor),
                            ),
                            child: Icon(
                              Icons.keyboard_arrow_up,
                              color: textSecondary,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 24),

                  // Date range and tags
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runSpacing: 8,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: isDark
                              ? AppColors.darkSurface
                              : AppColors.surfaceVerySoftPurple,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.calendar_today_outlined,
                              size: 14,
                              color: cyanAccent,
                            ),
                            SizedBox(width: 8),
                            Text(
                              l10n.years01Jan2026,
                              style: CustomTextStyles.inter(
                                color: textSecondary,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.arrow_forward,
                              size: 14,
                              color: textSecondary,
                            ),
                            SizedBox(width: 8),
                            Text(
                              l10n.years31Dec2026,
                              style: CustomTextStyles.inter(
                                color: textSecondary,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16),
                      Icon(Icons.circle, size: 6, color: greenAccent),
                      SizedBox(width: 6),
                      Text(
                        l10n.yearsCurrentYear,
                        style: CustomTextStyles.inter(
                          color: greenAccent,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Action buttons
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: cyanAccent.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: cyanAccent.withValues(alpha: 0.3),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add, size: 18, color: cyanAccent),
                              SizedBox(width: 4),
                              Text(
                                l10n.yearsSessionSingle,
                                style: CustomTextStyles.inter(
                                  color: cyanAccent,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: borderColor),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.edit_outlined,
                                size: 18,
                                color: textSecondary,
                              ),
                              SizedBox(width: 4),
                              Text(
                                l10n.yearsEdit,
                                style: CustomTextStyles.inter(
                                  color: textPrimary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.redAccent.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.redAccent.withValues(alpha: 0.3),
                          ),
                        ),
                        child: Icon(
                          Icons.delete_outline,
                          size: 20,
                          color: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32),

                  // Associated Sessions
                  Row(
                    children: [
                      Text(
                        l10n.yearsAssociatedSessions,
                        style: CustomTextStyles.inter(
                          color: textSecondary,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.circle, size: 6, color: cyanAccent),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: isDark
                              ? AppColors.darkSurface
                              : AppColors.surfaceVerySoftPurple,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: borderColor),
                        ),
                        child: Text(
                          l10n.years1Total,
                          style: CustomTextStyles.inter(
                            color: cyanAccent,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),

                  // Session Card
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: (isDark
                          ? const Color(0xFF111820)
                          : Theme.of(context).scaffoldBackgroundColor),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: borderColor),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.circle, size: 8, color: cyanAccent),
                                SizedBox(width: 12),
                                Text(
                                  l10n.yearsSession2026,
                                  style: CustomTextStyles.inter(
                                    color: textPrimary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  l10n.yearsSession2026Bn,
                                  style: CustomTextStyles.bengali(
                                    color: textSecondary,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: isDark
                                    ? Color(0xFF0F2A20)
                                    : Color(0xFFE6F7F0),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: greenAccent.withValues(alpha: 0.5),
                                ),
                              ),
                              child: Text(
                                l10n.yearsActive,
                                style: CustomTextStyles.inter(
                                  color: greenAccent,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Text(
                                l10n.years01Jan2026,
                                style: CustomTextStyles.inter(
                                  color: textSecondary,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.arrow_forward,
                                size: 12,
                                color: textSecondary,
                              ),
                              SizedBox(width: 8),
                              Text(
                                l10n.years31Dec2026,
                                style: CustomTextStyles.inter(
                                  color: textSecondary,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.people_outline,
                                  size: 16,
                                  color: textSecondary,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  l10n.yearsEnrolledStats,
                                  style: CustomTextStyles.inter(
                                    color: textSecondary,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: isDark
                                        ? AppColors.darkSurface
                                        : AppColors.surfaceVerySoftPurple,
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(color: borderColor),
                                  ),
                                  child: Icon(
                                    Icons.edit_outlined,
                                    size: 16,
                                    color: textSecondary,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.redAccent.withValues(
                                      alpha: 0.1,
                                    ),
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                      color: Colors.redAccent.withValues(
                                        alpha: 0.3,
                                      ),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.delete_outline,
                                    size: 16,
                                    color: Colors.redAccent,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),

                  // Add another session button (dashed border style)
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                      // Since dashed border requires extra package, we use a solid thin border for now.
                      border: Border.all(color: borderColor, width: 1.5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, size: 18, color: textSecondary),
                        SizedBox(width: 8),
                        Text(
                          l10n.yearsAddAnotherSession,
                          style: CustomTextStyles.inter(
                            color: textSecondary,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),

            // 2025 Card (Archived)
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: borderColor),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: isDark
                          ? AppColors.darkSurface
                          : AppColors.surfaceVerySoftPurple,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: borderColor),
                    ),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: textSecondary,
                      size: 20,
                    ),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            l10n.years2025,
                            style: CustomTextStyles.inter(
                              color: textPrimary,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            l10n.years2025Bn,
                            style: CustomTextStyles.bengali(
                              color: textSecondary,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        l10n.years2025Duration,
                        style: CustomTextStyles.inter(
                          color: textSecondary,
                          fontSize: 12,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        l10n.years3,
                        style: CustomTextStyles.inter(
                          color: textSecondary,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        l10n.yearsSessions,
                        style: CustomTextStyles.inter(
                          color: textSecondary,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 16),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: isDark
                          ? AppColors.darkSurface
                          : AppColors.surfaceVerySoftPurple,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: borderColor),
                    ),
                    child: Text(
                      l10n.yearsArchived,
                      style: CustomTextStyles.inter(
                        color: textSecondary,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
