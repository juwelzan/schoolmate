import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:schoolmate/core/file_path.dart';








class SchoolMateBottomNav extends StatelessWidget {
  const SchoolMateBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: (Theme.of(context).brightness == Brightness.dark ? AppColors.darkSurface : AppColors.white),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF141B2D).withValues(alpha: 0.08),
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
    final color = isActive ? Theme.of(context).primaryColor : (Theme.of(context).brightness == Brightness.dark ? AppColors.darkTextMuted : AppColors.inactiveIcon);
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
                  ? (Theme.of(context).brightness == Brightness.dark ? AppColors.darkBadgePurpleBg : AppColors.surfaceVerySoftPurple)
                  : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          SizedBox(height: 2),
          Text(
            label,
            style: CustomTextStyles.bengali(
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
