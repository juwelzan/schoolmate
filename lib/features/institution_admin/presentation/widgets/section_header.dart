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
            style: _bengaliStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          if (actionLabel != null)
            Text(
              actionLabel!,
              style: _bengaliStyle(
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
