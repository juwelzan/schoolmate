import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class OnlineAdmissionPage extends StatelessWidget {
  static const String routeName = '/online-admission';

  const OnlineAdmissionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: SchoolMateAppBar(
        title: l10n.onlineAdmissionTitle,
        subtitle: l10n.onlineAdmissionSubtitle,
      ),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: constraints.maxWidth > 600
                            ? 450
                            : constraints.maxWidth,
                        child: Text(
                          l10n.onlineAdmissionDesc,
                          style: TextStyle(
                            fontSize: 14,
                            color:
                                Theme.of(context).textTheme.bodyMedium?.color ??
                                AppColors.textSecondary,
                            height: 1.4,
                          ),
                        ),
                      ),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          _buildOutlinedBtn(
                            context,
                            Icons.grid_view_outlined,
                            l10n.dashboard,
                          ),
                          _buildOutlinedBtn(
                            context,
                            Icons.shield_outlined,
                            l10n.onlineAdmissionBtnQuota,
                          ),
                          _buildPrimaryBtn(
                            context,
                            Icons.add,
                            l10n.onlineAdmissionBtnNewCycle,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.assignment_outlined,
                            size: 64,
                            color: AppColors.inactiveIcon,
                          ),
                          SizedBox(height: 16),
                          Text(
                            "No admission cycles configured yet.",
                            style: TextStyle(
                              fontSize: 15,
                              color:
                                  Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.color ??
                                  AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildOutlinedBtn(BuildContext context, IconData icon, String label) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 16, color: AppColors.textSecondary),
      label: Text(
        label,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color:
              Theme.of(context).textTheme.bodyMedium?.color ??
              AppColors.textSecondary,
        ),
      ),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        side: const BorderSide(color: AppColors.divider),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Widget _buildPrimaryBtn(BuildContext context, IconData icon, String label) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 18, color: AppColors.white),
      label: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryPurple,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 0,
      ),
    );
  }
}
