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

class SchoolMateBottomNav extends StatelessWidget {
  const SchoolMateBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF141B2D).withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: Container(
          height: 68,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(context, "হোম", Icons.home, true, '/dashboard'),
              _buildNavItem(
                context,
                "শিক্ষার্থী",
                Icons.school_outlined,
                false,
                '/students',
              ),
              _buildNavItem(
                context,
                "হাজিরা",
                Icons.fact_check_outlined,
                false,
                '/attendance',
              ),
              _buildNavItem(
                context,
                "ফি",
                Icons.account_balance_wallet_outlined,
                false,
                '/fees',
              ),
              _buildNavItem(
                context,
                "আরও",
                Icons.grid_view_rounded,
                false,
                '/more',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    String label,
    IconData icon,
    bool isActive,
    String route,
  ) {
    final color = isActive ? AppColors.primaryPurple : AppColors.inactiveIcon;
    return GestureDetector(
      onTap: () {
        // Handle navigation safely later
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isActive
                  ? AppColors.surfaceVerySoftPurple
                  : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: _bengaliStyle(
              fontSize: 11,
              color: color,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
