import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolmate/core/file_path.dart';




TextStyle _bengaliStyle({
  double fontSize = 14,
  FontWeight fontWeight = FontWeight.normal,
  Color color = AppColors.textPrimary,
}) {
  return TextStyle(
    fontFamily: 'Noto Sans Bengali',
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

class InfoBanner extends StatelessWidget {
  const InfoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.infoBlueBg,
        borderRadius: BorderRadius.circular(16),
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
                child: const Icon(
                  Icons.info_outline,
                  color: AppColors.white,
                  size: 14,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  "আপনি Md Rakib Molla হিসেবে প্রতিষ্ঠানে প্রবেশ করেছেন। এখানে করা পরিবর্তন প্রতিষ্ঠানের আসল ডাটায় প্রয়োগ হবে।",
                  style: _bengaliStyle(
                    fontSize: 12,
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w500,
                  ).copyWith(height: 1.4),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Super Admin-এ ফিরুন",
              style: _bengaliStyle(
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
