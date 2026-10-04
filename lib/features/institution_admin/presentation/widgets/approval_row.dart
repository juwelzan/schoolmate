import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:schoolmate/core/file_path.dart';








class ApprovalRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final String count;
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final bool showDivider;

  ApprovalRow({
    super.key,
    required this.title,
    required this.subtitle,
    required this.count,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: iconBgColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 20, color: iconColor),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: CustomTextStyles.bengali(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: CustomTextStyles.bengali(
                        fontSize: 12,
                        color: (Theme.of(context).brightness == Brightness.dark ? AppColors.darkTextMuted : AppColors.textMuted),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: (Theme.of(context).brightness == Brightness.dark ? AppColors.darkBadgePurpleBg : AppColors.surfaceVerySoftPurple),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  count,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryPurple,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (showDivider) Divider(color: (Theme.of(context).brightness == Brightness.dark ? AppColors.darkBorder : AppColors.divider), height: 1),
      ],
    );
  }
}
