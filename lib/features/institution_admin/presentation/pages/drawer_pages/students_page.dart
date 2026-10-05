import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';
import 'package:schoolmate/features/institution_admin/presentation/widgets/school_mate_app_bar.dart';
import 'package:schoolmate/features/institution_admin/presentation/widgets/app_drawer.dart';

class StudentsPage extends StatelessWidget {
  static const String routeName = '/students';

  const StudentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: SchoolMateAppBar(
        title: l10n.studentsTitle,
        subtitle: l10n.studentsSubtitle,
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Action Buttons
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildOutlinedButton(
                    context,
                    Icons.school_outlined,
                    l10n.studentsBtnPromotion,
                  ),
                  const SizedBox(width: 8),
                  _buildOutlinedButton(
                    context,
                    Icons.badge_outlined,
                    l10n.studentsBtnPrintID,
                  ),
                  const SizedBox(width: 8),
                  _buildOutlinedButton(
                    context,
                    Icons.request_page_outlined,
                    l10n.studentsBtnStipend,
                  ),
                  const SizedBox(width: 8),
                  _buildOutlinedButton(
                    context,
                    Icons.file_upload_outlined,
                    l10n.studentsBtnImport,
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      size: 18,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    label: Text(
                      l10n.studentsBtnAdmit,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryPurple,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            Text(
              l10n.studentsDesc,
              style: TextStyle(
                fontSize: 14,
                color:
                    Theme.of(context).textTheme.bodyMedium?.color ??
                    AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 24),

            // Filter Bar
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    width: 300,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: l10n.studentsSearchHint,
                        hintStyle: TextStyle(
                          color: AppColors.inactiveIcon,
                          fontSize: 13,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: AppColors.inactiveIcon,
                          size: 18,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  _buildDropdown(context, l10n.studentsFilterClasses),
                  const SizedBox(width: 12),
                  _buildDropdown(context, l10n.studentsFilterSections),
                  const SizedBox(width: 12),
                  _buildDropdown(context, l10n.studentsFilterStatuses),
                  const SizedBox(width: 12),
                  _buildDropdown(context, l10n.studentsFilterNSID),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Data Table
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.darkSurface
                      : Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
                ),
                child: SizedBox(
                  width: 1200,
                  child: Column(
                    children: [
                      // Header
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                l10n.studentsTableStudent,
                                style: _headerStyle(context),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                l10n.studentsTableBRC,
                                style: _headerStyle(context),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                l10n.studentsTableClassSec,
                                style: _headerStyle(context),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                l10n.studentsTableGuardian,
                                style: _headerStyle(context),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                l10n.studentsTableStatus,
                                style: _headerStyle(context),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                l10n.studentsTableActions,
                                style: _headerStyle(context),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Data Row 1
                      _buildDataRow(context, l10n),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle _headerStyle(BuildContext context) => TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color:
        Theme.of(context).textTheme.bodyMedium?.color ??
        AppColors.textSecondary,
  );

  Widget _buildOutlinedButton(BuildContext context, IconData icon, String label) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 16, color: Theme.of(context).colorScheme.onSurfaceVariant),
      label: Text(
        label,
        style: TextStyle(fontSize: 13, color: Theme.of(context).colorScheme.onSurfaceVariant),
      ),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        side: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Widget _buildDropdown(BuildContext context, String hint) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: Text(
            hint,
            style: TextStyle(fontSize: 13, color: Theme.of(context).colorScheme.onSurface),
          ),
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.inactiveIcon,
            size: 16,
          ),
          items: const [],
          onChanged: (val) {},
        ),
      ),
    );
  }

  Widget _buildDataRow(BuildContext context, AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: AppColors.surfaceVerySoftPurple,
                  child: const Icon(
                    Icons.person,
                    size: 18,
                    color: AppColors.primaryPurple,
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mamun",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      "মামুন",
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    "12345678964654645",
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.warmGold),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    l10n.statusNsidPending,
                    style: TextStyle(
                      fontSize: 11,
                      color: AppColors.warmGold,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              "Baby Class / A",
              style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              "01755300722",
              style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.successGreen,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  l10n.statusActive,
                  style: TextStyle(
                    fontSize: 11,
                      color: Theme.of(context).colorScheme.surface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildActionBtn(context, l10n.actionView, isRed: false),
                const SizedBox(width: 8),
                _buildActionBtn(context, l10n.actionEdit, isRed: false),
                const SizedBox(width: 8),
                _buildActionBtn(context, l10n.actionDelete, isRed: true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionBtn(BuildContext context, String label, {required bool isRed}) {
    return Container(
      decoration: BoxDecoration(
        color: isRed ? Colors.redAccent : Colors.transparent,
        border: Border.all(color: isRed ? Colors.redAccent : Theme.of(context).colorScheme.outlineVariant),
        borderRadius: BorderRadius.circular(6),
      ),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(6),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: isRed ? AppColors.white : Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ),
    );
  }
}
