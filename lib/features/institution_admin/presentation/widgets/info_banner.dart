import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:schoolmate/core/theme/app_colors.dart';
import 'package:schoolmate/core/widgets/custom_text_style.dart';

class InfoBanner extends StatelessWidget {
  const InfoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: (Theme.of(context).brightness == Brightness.dark
            ? AppColors.darkSurface
            : AppColors.infoBlueBg),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.darkBorder
              : Colors.transparent,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: AppColors.primaryPurple,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.info_outline,
                  color: Theme.of(context).colorScheme.onPrimary,
                  size: 14,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  "আপনি Md Rakib Molla হিসেবে প্রতিষ্ঠানে প্রবেশ করেছেন। এখানে করা পরিবর্তন প্রতিষ্ঠানের আসল ডাটায় প্রয়োগ হবে।",
                  style: CustomTextStyles.bengali(
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.w500,
                  ).copyWith(height: 1.4),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Super Admin-এ ফিরুন",
              style: CustomTextStyles.bengali(
                fontSize: 12,
                color: AppColors.primaryPurple,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
