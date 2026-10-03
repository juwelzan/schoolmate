import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class StudentsPage extends StatelessWidget {
  static const String routeName = '/students';

  const StudentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Students",
        subtitle: "Student Management",
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
                  _buildOutlinedButton(Icons.school_outlined, "Promotion"),
                  const SizedBox(width: 8),
                  _buildOutlinedButton(Icons.badge_outlined, "Print ID Cards"),
                  const SizedBox(width: 8),
                  _buildOutlinedButton(Icons.request_page_outlined, "Stipend Roll"),
                  const SizedBox(width: 8),
                  _buildOutlinedButton(Icons.file_upload_outlined, "Import from Excel"),
                  const SizedBox(width: 16),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add, size: 18, color: AppColors.white),
                    label: const Text(
                      "Admit Student",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryPurple,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
            
            const Text(
              "Search, filter, and manage enrolled students",
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
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
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.divider),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: "Search by name, BRC, or phone...",
                        hintStyle: TextStyle(color: AppColors.inactiveIcon, fontSize: 13),
                        prefixIcon: Icon(Icons.search, color: AppColors.inactiveIcon, size: 18),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  _buildDropdown("All classes"),
                  const SizedBox(width: 12),
                  _buildDropdown("All sections"),
                  const SizedBox(width: 12),
                  _buildDropdown("All statuses"),
                  const SizedBox(width: 12),
                  _buildDropdown("NSID: All"),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Data Table
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.divider),
                ),
                child: SizedBox(
                  width: 1200,
                  child: Column(
                    children: [
                      // Header
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: const BoxDecoration(
                          border: Border(bottom: BorderSide(color: AppColors.divider)),
                        ),
                        child: const Row(
                          children: [
                            Expanded(flex: 2, child: Text("Student", style: _headerStyle)),
                            Expanded(flex: 3, child: Text("BRC", style: _headerStyle)),
                            Expanded(flex: 2, child: Text("Class / Section", style: _headerStyle)),
                            Expanded(flex: 2, child: Text("Guardian Mobile", style: _headerStyle)),
                            Expanded(flex: 1, child: Text("Status", style: _headerStyle)),
                            Expanded(flex: 2, child: Text("Actions", style: _headerStyle, textAlign: TextAlign.right)),
                          ],
                        ),
                      ),
                      // Data Row 1
                      _buildDataRow(),
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

  static const TextStyle _headerStyle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.textSecondary,
  );

  Widget _buildOutlinedButton(IconData icon, String label) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 16, color: AppColors.textSecondary),
      label: Text(
        label,
        style: const TextStyle(fontSize: 13, color: AppColors.textSecondary),
      ),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        side: const BorderSide(color: AppColors.divider),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Widget _buildDropdown(String hint) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.divider),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: Text(hint, style: const TextStyle(fontSize: 13, color: AppColors.textPrimary)),
          icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.inactiveIcon, size: 16),
          items: const [],
          onChanged: (val) {},
        ),
      ),
    );
  }

  Widget _buildDataRow() {
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
                  child: const Icon(Icons.person, size: 18, color: AppColors.primaryPurple),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Mamun",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
                    ),
                    Text(
                      "মামুন",
                      style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
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
                const Flexible(
                  child: Text(
                    "12345678964654645",
                    style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.warmGold),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    "NSID Pending",
                    style: TextStyle(fontSize: 11, color: AppColors.warmGold, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            flex: 2,
            child: Text(
              "Baby Class / A",
              style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
            ),
          ),
          const Expanded(
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
                child: const Text(
                  "active",
                  style: TextStyle(fontSize: 11, color: AppColors.white, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildActionBtn("View", isRed: false),
                const SizedBox(width: 8),
                _buildActionBtn("Edit", isRed: false),
                const SizedBox(width: 8),
                _buildActionBtn("Delete", isRed: true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionBtn(String label, {required bool isRed}) {
    return Container(
      decoration: BoxDecoration(
        color: isRed ? Colors.redAccent : Colors.transparent,
        border: Border.all(color: isRed ? Colors.redAccent : AppColors.divider),
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
              color: isRed ? AppColors.white : AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}
