import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';
import '../models/academic_year_data.dart';
import 'add_session_dialog.dart';
import 'add_year_dialog.dart';

class AcademicYearCard extends StatefulWidget {
  final AcademicYearData yearData;
  final VoidCallback onDelete;
  final ValueChanged<AcademicYearData> onEdit;

  const AcademicYearCard({
    super.key,
    required this.yearData,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  State<AcademicYearCard> createState() => _AcademicYearCardState();
}

class _AcademicYearCardState extends State<AcademicYearCard> {
  @override
  Widget build(BuildContext context) {
    final yearData = widget.yearData;
    final l10n = AppLocalizations.of(context)!;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    final cardColor = Theme.of(context).colorScheme.surface;
    final cyanAccent = Theme.of(context).colorScheme.primary;
    final textPrimary = Theme.of(context).colorScheme.onSurface;
    final textSecondary =
        Theme.of(context).textTheme.bodyMedium?.color ??
        Theme.of(context).colorScheme.onSurfaceVariant;
    final borderColor = Theme.of(context).colorScheme.outlineVariant;
    final greenAccent = AppColors.successGreen;
    final bool isActive = yearData.status == 'Active';

    // Format dates simply for now
    String formatDate(DateTime date) {
      return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
    }

    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 24),
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
                    yearData.nameEn,
                    style: CustomTextStyles.inter(
                      color: textPrimary,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 12),
                  Text(
                    yearData.nameBn,
                    style: CustomTextStyles.bengali(
                      color: textSecondary,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(width: 12),
                  if (isActive) Icon(Icons.verified, color: cyanAccent, size: 18),
                ],
              ),
              Row(
                children: [
                  if (isActive)
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: isDark ? Color(0xFF0F2A20) : Color(0xFFE6F7F0),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: (isDark
                              ? const Color(0xFF1E4B39)
                              : AppColors.successGreen.withValues(alpha: 0.3)),
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
                    )
                  else
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
                      isActive ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
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
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: isDark
                      ? AppColors.darkSurface
                      : AppColors.surfaceVerySoftPurple,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 14,
                      color: cyanAccent,
                    ),
                    SizedBox(width: 8),
                    Text(
                      formatDate(yearData.startDate),
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
                      formatDate(yearData.endDate),
                      style: CustomTextStyles.inter(
                        color: textSecondary,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              if (isActive) ...[
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
              ]
            ],
          ),
          
          if (isActive) ...[
            SizedBox(height: 20),
            // Action buttons (Only show if expanded/active)
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
                  child: InkWell(
                    onTap: () async {
                      final updatedYear = await showDialog<AcademicYearData>(
                        context: context,
                        builder: (context) => AddYearDialog(initialData: yearData),
                      );
                      if (updatedYear != null) {
                        widget.onEdit(updatedYear);
                      }
                    },
                    borderRadius: BorderRadius.circular(8),
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
                ),
                SizedBox(width: 12),
                InkWell(
                  onTap: widget.onDelete,
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
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
                    "${yearData.sessions.length} ${l10n.yearsLowercaseActive}", // Just mock count
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

            // Render Session Cards
            ...yearData.sessions.asMap().entries.map((entry) {
              final index = entry.key;
              final session = entry.value;
              return Container(
                margin: EdgeInsets.only(bottom: 16),
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
                              session.nameEn,
                              style: CustomTextStyles.inter(
                                color: textPrimary,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              session.nameBn,
                              style: CustomTextStyles.bengali(
                                color: textSecondary,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        if (session.status == 'Active')
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
                            formatDate(session.startDate),
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
                            formatDate(session.endDate),
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
                            InkWell(
                              onTap: () async {
                                final updatedSession = await showDialog<AcademicSessionData>(
                                  context: context,
                                  builder: (context) => AddSessionDialog(
                                    yearName: yearData.nameEn,
                                    initialData: session,
                                  ),
                                );
                                if (updatedSession != null) {
                                  setState(() {
                                    yearData.sessions[index] = updatedSession;
                                  });
                                }
                              },
                              borderRadius: BorderRadius.circular(6),
                              child: Container(
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
                            ),
                            SizedBox(width: 8),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  yearData.sessions.removeAt(index);
                                });
                              },
                              borderRadius: BorderRadius.circular(6),
                              child: Container(
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
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),

            // Add another session button
            InkWell(
              onTap: () async {
                final newSession = await showDialog<AcademicSessionData>(
                  context: context,
                  builder: (context) => AddSessionDialog(yearName: yearData.nameEn),
                );
                if (newSession != null) {
                  setState(() {
                    yearData.sessions.add(newSession);
                  });
                }
              },
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
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
            ),
          ]
        ],
      ),
    );
  }
}
