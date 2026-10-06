import 'package:schoolmate/core/file_path.dart';
import 'package:schoolmate/features/institution_admin/presentation/pages/drawer_pages/academic/widgets/academic_header_card.dart';
import 'widgets/component_type_card.dart';


class ComponentTypesPage extends StatefulWidget {
  static const String routeName = '/component-types';

  const ComponentTypesPage({super.key});

  @override
  State<ComponentTypesPage> createState() => _ComponentTypesPageState();
}

class _ComponentTypesPageState extends State<ComponentTypesPage> {
  int _selectedFilterIndex = 0;

  void _showComponentActions(BuildContext context, String title, String code) {
    final l10n = AppLocalizations.of(context)!;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color primary = Theme.of(context).colorScheme.primary;
    final Color cardBg = Theme.of(context).colorScheme.surface;
    final Color borderColor = isDark ? AppColors.darkBorder : AppColors.divider;

    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return const SizedBox.shrink();
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutBack,
        );

        return ScaleTransition(
          scale: Tween<double>(begin: 0.8, end: 1.0).animate(curvedAnimation),
          child: FadeTransition(
            opacity: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(curvedAnimation),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(maxWidth: 320),
                    decoration: BoxDecoration(
                      color: cardBg,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: borderColor),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.15),
                          blurRadius: 30,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 28),
                        // Code Badge
                        Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            color: primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Center(
                            child: Text(
                              code,
                              style: CustomTextStyles.inter(
                                color: primary,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Title
                        Text(
                          title,
                          style: CustomTextStyles.inter(
                            color: isDark
                                ? AppColors.white
                                : AppColors.textPrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 28),
                        // Divider
                        Divider(height: 1, color: borderColor),
                        // Edit Option
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            // TODO: Handle edit action
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 16,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: primary.withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Icon(
                                    Icons.edit_outlined,
                                    color: primary,
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    l10n.actionEdit,
                                    style: CustomTextStyles.inter(
                                      color: isDark
                                          ? AppColors.white
                                          : AppColors.textPrimary,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right,
                                  color: isDark
                                      ? AppColors.darkTextSecondary
                                      : Theme.of(context)
                                            .colorScheme
                                            .onSurfaceVariant,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: 1,
                          color: borderColor,
                          indent: 24,
                          endIndent: 24,
                        ),
                        // Delete Option
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            // TODO: Handle delete action
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 16,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF03E3E)
                                        .withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Icon(
                                    Icons.delete_outline,
                                    color: Color(0xFFF03E3E),
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    l10n.actionDelete,
                                    style: CustomTextStyles.inter(
                                      color: const Color(0xFFF03E3E),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                const Icon(
                                  Icons.chevron_right,
                                  color: Color(0xFFF03E3E),
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    final Color bgColor = Theme.of(context).scaffoldBackgroundColor;
    final Color mutedTextColor = isDark
        ? AppColors.darkTextSecondary
        : Theme.of(context).colorScheme.onSurfaceVariant;
    final Color borderColor = isDark ? AppColors.darkBorder : AppColors.divider;
    final Color cardBg = isDark ? AppColors.darkSurface : AppColors.white;
    final Color primary = Theme.of(context).colorScheme.primary;

    final List<String> filtersEn = [
      l10n.componentTypesFilterAllCount(6),
      l10n.componentTypesFilterTheory,
      l10n.componentTypesFilterObjective,
      l10n.componentTypesFilterPractical,
    ];

    final List<Map<String, dynamic>> dummyComponents = [
      {
        'code': 'WR',
        'titleEn': 'Written / CQ',
        'titleBn': 'লিখিত / সৃজনশীল',
        'category': l10n.componentTypesTheoryBucket,
        'weight': l10n.componentTypesWeightText(70),
        'isActive': true,
      },
      {
        'code': 'MCQ',
        'titleEn': 'MCQ',
        'titleBn': 'বহুনির্বাচনি প্রশ্ন',
        'category': l10n.componentTypesFilterObjective,
        'weight': l10n.componentTypesOmrText(30),
        'isActive': true,
      },
    ];

    return Scaffold(
      backgroundColor: bgColor,
      appBar: SchoolMateAppBar(
        title: l10n.componentTypesTitle,
        subtitle: l10n.componentTypesSubtitle,
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AcademicHeaderCard(
              title: l10n.componentTypesTitle,
              description: l10n.componentTypesHeaderDesc,
              badge: l10n.componentTypesHeaderBadge,
              details: [
                AcademicHeaderMetric(label: l10n.componentTypesTotalCount(6)),
                AcademicHeaderMetric(
                  label: l10n.componentTypesActiveCountValue(6),
                  isPositive: true,
                ),
              ],
              action: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: Text(l10n.componentTypesNew),
              ),
            ),
            const SizedBox(height: 24),

            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: l10n.componentTypesSearchHint,
                hintStyle: CustomTextStyles.inter(color: mutedTextColor),
                prefixIcon: Icon(Icons.search, color: mutedTextColor),
                suffixIcon: Icon(Icons.close, color: mutedTextColor, size: 20),
                filled: true,
                fillColor: cardBg,
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: borderColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: primary, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Filter Chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(filtersEn.length, (index) {
                  final isSelected = index == _selectedFilterIndex;
                  return Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedFilterIndex = index;
                        });
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? primary
                              : (isDark
                                    ? AppColors.darkSurface
                                    : AppColors.white),
                          border: Border.all(
                            color: isSelected ? primary : borderColor,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          filtersEn[index],
                          style: CustomTextStyles.inter(
                            color: isSelected
                                ? AppColors.white
                                : (isDark
                                      ? AppColors.white
                                      : AppColors.textPrimary),
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 32),

            // List Header
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 16,
              runSpacing: 8,
              children: [
                Text(
                  l10n.componentTypesListTitleCount(6),
                  style: CustomTextStyles.inter(
                    color: mutedTextColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.swap_vert, size: 18, color: primary),
                      const SizedBox(width: 4),
                      Text(
                        l10n.componentTypesSortOrder,
                        style: CustomTextStyles.inter(
                          color: primary,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Component Cards
            ...dummyComponents.map((comp) {
                return ComponentTypeCard(
                  comp: comp,
                  isDark: isDark,
                  onLongPress: () => _showComponentActions(
                    context,
                    comp['titleEn'] as String,
                    comp['code'] as String,
                  ),
                );
              }),
          ],
        ),
      ),
    );
  }
}
