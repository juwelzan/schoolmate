import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class MultiTrackPage extends StatelessWidget {
  static const String routeName = '/multi-track';

  const MultiTrackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const SchoolMateAppBar(
        title: "Multi-Track",
        subtitle: "Manage Institution Tracks",
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Top Row: Institution Name & Add Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Dhaka Public School",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textSecondary,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add, size: 18, color: AppColors.white),
                  label: const Text(
                    "Add Track",
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
            const SizedBox(height: 32),

            // Dashed Empty State Container
            CustomPaint(
              painter: DashedBorderPainter(
                color: AppColors.primaryPurple.withOpacity(0.3),
                strokeWidth: 1.5,
                dashLength: 8.0,
                dashGap: 6.0,
                radius: 12.0,
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 24.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceVerySoftPurple,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.account_tree_outlined,
                        size: 32,
                        color: AppColors.primaryPurple,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "No tracks configured.",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Add a track if your institution runs multiple programs under different boards.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

