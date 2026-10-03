import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class WebsitePage extends StatefulWidget {
  static const String routeName = '/website';

  const WebsitePage({super.key});

  @override
  State<WebsitePage> createState() => _WebsitePageState();
}

class _WebsitePageState extends State<WebsitePage> {
  final List<String> _tabs = [
    "Settings", "Hero", "About", "Principal's Message", "Notices", 
    "Gallery", "Contact", "Mission & Vision", "Why Choose Us", 
    "Classes", "Events", "Testimonials", "Videos", "FAQ", 
    "Teachers", "Committee", "Admissions", "Results", "Inbox"
  ];
  
  String _selectedTab = "Hero"; // Default selected as per image

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Website",
        subtitle: "Manage Public Website",
      ),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            // Top Actions
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.open_in_new, size: 16, color: AppColors.primaryPurple),
                    label: const Text("View live site", style: TextStyle(color: AppColors.primaryPurple, fontWeight: FontWeight.w600)),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.textPrimary,
                      side: const BorderSide(color: AppColors.divider),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    child: const Text("Unpublish"),
                  ),
                ],
              ),
            ),
            
            // Tabs
            SizedBox(
              height: 48,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: _tabs.length,
                itemBuilder: (context, index) {
                  final tab = _tabs[index];
                  final isSelected = _selectedTab == tab;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
                    child: ChoiceChip(
                      label: Text(tab),
                      selected: isSelected,
                      onSelected: (selected) {
                        setState(() {
                          _selectedTab = tab;
                        });
                      },
                      labelStyle: TextStyle(
                        color: isSelected ? AppColors.textPrimary : AppColors.textSecondary,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                      ),
                      backgroundColor: AppColors.white,
                      selectedColor: AppColors.white,
                      side: BorderSide(
                        color: isSelected ? AppColors.primaryPurple : AppColors.divider,
                        width: isSelected ? 1.5 : 1.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  );
                },
              ),
            ),
            
            // Main Content Area
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.divider),
                  ),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(32.0),
                    child: _selectedTab == "Hero" ? _buildHeroForm() : _buildComingSoon(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildComingSoon() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(64.0),
        child: Column(
          children: [
            const Icon(Icons.build_circle_outlined, size: 64, color: AppColors.inactiveIcon),
            const SizedBox(height: 16),
            Text("$_selectedTab settings coming soon.", style: const TextStyle(color: AppColors.textSecondary, fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Hero",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
        ),
        const SizedBox(height: 4),
        const Text(
          "The first thing visitors see.",
          style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
        ),
        const SizedBox(height: 32),
        
        _buildTextFieldLabel("Headline"),
        const SizedBox(height: 8),
        _buildTextField(hint: "Your institution's name or slogan"),
        const SizedBox(height: 24),
        
        _buildTextFieldLabel("Subheadline"),
        const SizedBox(height: 8),
        _buildTextField(maxLines: 4),
        const SizedBox(height: 24),
        
        _buildTextFieldLabel("Call-to-Action Button Text"),
        const SizedBox(height: 8),
        _buildTextField(hint: "Admission Open"),
        const SizedBox(height: 24),
        
        _buildTextFieldLabel("Background Image"),
        const SizedBox(height: 8),
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.upload_outlined, size: 18),
          label: const Text("Upload"),
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.textPrimary,
            side: const BorderSide(color: AppColors.divider),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
        const SizedBox(height: 24),
        
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkbox(
              value: true,
              onChanged: (val) {},
              activeColor: AppColors.primaryPurple,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            ),
            const Expanded(
              child: Text("Show this section on the public site", style: TextStyle(color: AppColors.textPrimary, fontSize: 14)),
            ),
          ],
        ),
        const SizedBox(height: 24),
        
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF17212B), // Dark filled button like in image
            foregroundColor: AppColors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: const Text("Save Section", style: TextStyle(fontWeight: FontWeight.w600)),
        ),
      ],
    );
  }

  Widget _buildTextFieldLabel(String label) {
    return Text(
      label,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
    );
  }

  Widget _buildTextField({String? hint, int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.textMuted, fontSize: 14),
        filled: true,
        fillColor: const Color(0xFFF9FAFB),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.divider),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.divider),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.primaryPurple),
        ),
      ),
    );
  }
}
