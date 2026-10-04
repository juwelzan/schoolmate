import 'package:flutter/material.dart';
import 'package:schoolmate/core/widgets/custom_text_field.dart';
import 'package:schoolmate/core/file_path.dart';

class AccountSecurityPage extends StatefulWidget {
  static const String routeName = '/account-security';

  const AccountSecurityPage({super.key});

  @override
  State<AccountSecurityPage> createState() => _AccountSecurityPageState();
}

class _AccountSecurityPageState extends State<AccountSecurityPage> {
  int _selectedTabIndex = 0;

  final List<Map<String, dynamic>> _tabs = [
    {'title': 'Two-Factor Auth', 'icon': Icons.security_outlined},
    {'title': 'Sessions', 'icon': Icons.desktop_windows_outlined},
    {'title': 'Audit Log', 'icon': Icons.receipt_long_outlined},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.onSurface,
        ),
        title: Text(
          "Account Security",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Custom Tab Bar
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryPurple.withOpacity(0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: List.generate(_tabs.length, (index) {
                    final isSelected = _selectedTabIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedTabIndex = index;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Theme.of(context).scaffoldBackgroundColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              _tabs[index]['icon'],
                              size: 16,
                              color: isSelected
                                  ? Theme.of(context).colorScheme.onSurface
                                  : (Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.color ??
                                        AppColors.textSecondary),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              _tabs[index]['title'],
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: isSelected
                                    ? FontWeight.w600
                                    : FontWeight.w500,
                                color: isSelected
                                    ? Theme.of(context).colorScheme.onSurface
                                    : (Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.color ??
                                          AppColors.textSecondary),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),

          // Content Area
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryPurple.withOpacity(0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: _buildSelectedTabContent(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectedTabContent() {
    switch (_selectedTabIndex) {
      case 0:
        return _buildTwoFactorAuthTab();
      case 1:
        return _buildSessionsTab();
      case 2:
        return _buildAuditLogTab();
      default:
        return const SizedBox.shrink();
    }
  }

  // === TAB 1: PASSWORD ===
  Widget _buildPasswordTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Change Password",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          "Your current password is required to set a new one.",
          style: TextStyle(
            fontSize: 14,
            color:
                (Theme.of(context).textTheme.bodyMedium?.color ??
                AppColors.textSecondary),
          ),
        ),
        const SizedBox(height: 24),
        CustomTextField(label: "Current Password", obscureText: true),
        const SizedBox(height: 16),
        CustomTextField(label: "New Password", obscureText: true),
        const SizedBox(height: 16),
        CustomTextField(label: "Confirm New Password", obscureText: true),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1F2228), // Dark color from image
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 0,
          ),
          child: const Text(
            "Update Password",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
        ),
      ],
    );
  }

  // === TAB 2: TWO-FACTOR AUTH ===
  Widget _buildTwoFactorAuthTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Two-Factor Authentication",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          "Add an extra layer of security to your account using a TOTP authenticator app.",
          style: TextStyle(
            fontSize: 14,
            color:
                (Theme.of(context).textTheme.bodyMedium?.color ??
                AppColors.textSecondary),
          ),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Icon(
              Icons.cancel_outlined,
              color: Colors.blueGrey.shade400,
              size: 22,
            ),
            const SizedBox(width: 12),
            const Text(
              "2FA is not enabled",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Color(0xFF475467),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1F2228),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 0,
          ),
          child: const Text(
            "Enable Two-Factor Authentication",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
        ),
      ],
    );
  }

  // === TAB 3: SESSIONS ===
  Widget _buildSessionsTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Active Sessions",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Devices where your account is currently signed in.",
                    style: TextStyle(
                      fontSize: 14,
                      color:
                          (Theme.of(context).textTheme.bodyMedium?.color ??
                          AppColors.textSecondary),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF6B6B),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: const Text(
                "Revoke All Others",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Chrome on Windows",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "172.69.78.132 · Last seen 23 Sept 2026, 04:38 am",
                    style: TextStyle(
                      fontSize: 13,
                      color:
                          (Theme.of(context).textTheme.bodyMedium?.color ??
                          AppColors.textSecondary),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Color(0xFFFF6B6B)),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }

  // === TAB 4: AUDIT LOG ===
  Widget _buildAuditLogTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Auth Audit Log",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          "Immutable record of security-relevant events on your account.",
          style: TextStyle(
            fontSize: 14,
            color:
                (Theme.of(context).textTheme.bodyMedium?.color ??
                AppColors.textSecondary),
          ),
        ),
        const SizedBox(height: 24),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowColor: MaterialStateProperty.all(Colors.transparent),
            dividerThickness: 0.5,
            horizontalMargin: 0,
            columnSpacing: 32,
            columns: [
              DataColumn(
                label: Text(
                  "Event",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color:
                        (Theme.of(context).textTheme.bodyMedium?.color ??
                        AppColors.textSecondary),
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  "IP Address",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color:
                        (Theme.of(context).textTheme.bodyMedium?.color ??
                        AppColors.textSecondary),
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  "Browser / Device",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color:
                        (Theme.of(context).textTheme.bodyMedium?.color ??
                        AppColors.textSecondary),
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  "Time",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color:
                        (Theme.of(context).textTheme.bodyMedium?.color ??
                        AppColors.textSecondary),
                  ),
                ),
              ),
            ],
            rows: [
              _buildAuditRow(
                "Login",
                "172.69.78.132",
                "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/53...",
                "23 Sept 2026, 04:38 am",
              ),
              _buildAuditRow(
                "Logout",
                "172.69.78.132",
                "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/53...",
                "23 Sept 2026, 04:37 am",
              ),
            ],
          ),
        ),
      ],
    );
  }

  DataRow _buildAuditRow(String event, String ip, String device, String time) {
    return DataRow(
      cells: [
        DataCell(
          Text(
            event,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
        DataCell(
          Text(
            ip,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color:
                  (Theme.of(context).textTheme.bodyMedium?.color ??
                  AppColors.textSecondary),
            ),
          ),
        ),
        DataCell(
          Text(
            device,
            style: TextStyle(
              fontSize: 14,
              color:
                  (Theme.of(context).textTheme.bodyMedium?.color ??
                  AppColors.textSecondary),
            ),
          ),
        ),
        DataCell(
          Text(
            time,
            style: TextStyle(
              fontSize: 14,
              color:
                  (Theme.of(context).textTheme.bodyMedium?.color ??
                  AppColors.textSecondary),
            ),
          ),
        ),
      ],
    );
  }
}
