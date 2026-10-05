import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:schoolmate/core/theme/app_colors.dart';
import 'package:schoolmate/core/widgets/custom_text_style.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String? actionLabel;

  const SectionHeader({super.key, required this.title, this.actionLabel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: CustomTextStyles.bengali(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          if (actionLabel != null)
            Text(
              actionLabel!,
              style: CustomTextStyles.bengali(
                fontSize: 13,
                color: AppColors.primaryPurple,
                fontWeight: FontWeight.w600,
              ),
            ),
        ],
      ),
    );
  }
}
