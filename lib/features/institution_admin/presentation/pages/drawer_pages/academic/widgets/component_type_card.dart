import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class ComponentTypeCard extends StatelessWidget {
  final Map<String, dynamic> comp;
  final bool isDark;
  final VoidCallback onLongPress;

  const ComponentTypeCard({
    super.key,
    required this.comp,
    required this.isDark,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final primary = Theme.of(context).colorScheme.primary;
    final mutedTextColor = isDark ? AppColors.darkTextSecondary : Theme.of(context).colorScheme.onSurfaceVariant;
    final borderColor = isDark ? AppColors.darkBorder : AppColors.divider;
    final cardBg = isDark ? AppColors.darkSurface : AppColors.white;

    return GestureDetector(
      onLongPress: onLongPress,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: cardBg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor),
          boxShadow: isDark
              ? null
              : [
                  BoxShadow(
                    color: const Color(0xFF141B2D).withValues(alpha: 0.03),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Left Side: Drag Handle
              Container(
                width: 32,
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF1C2533) : const Color(0xFFF8F9FA),
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(16),
                  ),
                  border: Border(
                    right: BorderSide(color: borderColor),
                  ),
                ),
                child: Icon(
                  Icons.drag_indicator,
                  color: isDark ? AppColors.darkTextMuted : const Color(0xFFADB5BD),
                  size: 20,
                ),
              ),
              // Code Box
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            comp['code'] as String,
                            style: CustomTextStyles.inter(
                              color: primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            l10n.componentTypesCodeLabel,
                            style: CustomTextStyles.inter(
                              color: primary.withValues(alpha: 0.7),
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Content
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            spacing: 6,
                            runSpacing: 4,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                comp['titleEn'] as String,
                                style: CustomTextStyles.inter(
                                  color: isDark ? AppColors.white : AppColors.textPrimary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              if (comp['isActive'] as bool)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isDark ? const Color(0xFF132B20) : const Color(0xFFE6F4EA),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: isDark ? const Color(0xFF1B4231) : const Color(0xFFC3E6CB),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 6,
                                        height: 6,
                                        decoration: const BoxDecoration(
                                          color: AppColors.successGreen,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        l10n.componentTypesActiveBadge,
                                        style: CustomTextStyles.inter(
                                          color: AppColors.successGreen,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            comp['titleBn'] as String,
                            style: CustomTextStyles.inter(
                              color: isDark ? AppColors.white : AppColors.textPrimary,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 8,
                            runSpacing: 4,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: isDark ? AppColors.darkSurface : const Color(0xFFF1F3F5),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  comp['category'] as String,
                                  style: CustomTextStyles.inter(
                                    color: mutedTextColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Container(
                                width: 4,
                                height: 4,
                                decoration: BoxDecoration(
                                  color: mutedTextColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Text(
                                comp['weight'] as String,
                                style: CustomTextStyles.inter(
                                  color: mutedTextColor,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
