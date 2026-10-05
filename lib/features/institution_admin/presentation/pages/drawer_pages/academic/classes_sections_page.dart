import 'package:schoolmate/core/file_path.dart';

// Data Models
class _SectionModel {
  final String nameEn;
  final String nameBn;
  final String shift;
  final int students;
  final String teacher;
  final Color dotColor;

  _SectionModel({
    required this.nameEn,
    required this.nameBn,
    required this.shift,
    required this.students,
    required this.teacher,
    required this.dotColor,
  });
}

class _ClassModel {
  final String id;
  final String nameEn;
  final String nameBn;
  final String grade;
  final String? tag;
  final List<_SectionModel> sections;
  bool isExpanded;

  _ClassModel({
    required this.id,
    required this.nameEn,
    required this.nameBn,
    required this.grade,
    this.tag,
    required this.sections,
    this.isExpanded = false,
  });
}

class ClassesSectionsPage extends StatefulWidget {
  static const String routeName = '/classes-sections';

  const ClassesSectionsPage({super.key});

  @override
  State<ClassesSectionsPage> createState() => _ClassesSectionsPageState();
}

class _ClassesSectionsPageState extends State<ClassesSectionsPage> {
  late List<_ClassModel> _classes;

  @override
  void initState() {
    super.initState();
    _classes = [
      _ClassModel(
        id: '1',
        nameEn: 'Baby Class',
        nameBn: 'বেবি ক্লাস',
        grade: 'Grade 0',
        tag: 'Pre-Primary',
        isExpanded: true,
        sections: [
          _SectionModel(
            nameEn: 'Section A',
            nameBn: '(পদ্ম - Padma)',
            shift: 'প্রভাতী শিফট',
            students: 32,
            teacher: 'নুসরাত জাহান',
            dotColor: const Color(0xFFF59F00),
          ),
          _SectionModel(
            nameEn: 'Section B',
            nameBn: '(শাপলা - Shapla)',
            shift: 'দিবা শিফট',
            students: 30,
            teacher: 'ফারহানা আহমেদ',
            dotColor: const Color(0xFF339AF0),
          ),
        ],
      ),
      _ClassModel(
        id: '2',
        nameEn: 'Nursery',
        nameBn: 'নার্সারি',
        grade: 'Grade 0',
        tag: 'Pre-Primary',
        sections: [],
      ),
      _ClassModel(
        id: '3',
        nameEn: 'KG-1',
        nameBn: 'কেজি-১',
        grade: 'Grade 0',
        tag: 'Pre-Primary',
        sections: [],
      ),
      _ClassModel(
        id: '4',
        nameEn: 'Class One',
        nameBn: 'প্রথম শ্রেণি',
        grade: 'Grade 1',
        tag: null,
        sections: [],
      ),
    ];
  }

  void _toggleExpandAll() {
    setState(() {
      bool anyExpanded = _classes.any((c) => c.isExpanded);
      for (var c in _classes) {
        c.isExpanded = !anyExpanded;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color bgColor = Theme.of(context).scaffoldBackgroundColor;
    final Color surfaceColor = Theme.of(context).colorScheme.surface;
    final Color primaryColor = Theme.of(context).colorScheme.primary;
    final Color borderColor = isDark ? AppColors.darkBorder : AppColors.divider;

    bool anyExpanded = _classes.any((c) => c.isExpanded);
    final Color primary = primaryColor;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: SchoolMateAppBar(
        title: l10n.classesSectionsTitle,
        subtitle: l10n.classesSectionsSubtitle,
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: isDark
                    ? AppColors.darkSurfaceHighlight
                    : primary.withValues(alpha: 0.04),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isDark
                      ? AppColors.darkBorder
                      : primary.withValues(alpha: 0.1),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          l10n.componentTypesHeaderBadge,
                          style: CustomTextStyles.inter(
                            color: primary,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Description
                  Text(
                    l10n.componentTypesHeaderDesc,
                    style: CustomTextStyles.inter(
                      color: isDark ? AppColors.white : AppColors.textPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Stats & Button Row
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      // Total Pill
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: surfaceColor,
                          border: Border.all(color: borderColor),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          l10n.componentTypesTotalCount(6),
                          style: CustomTextStyles.inter(
                            color: isDark
                                ? AppColors.white
                                : AppColors.textPrimary,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      // Active Pill
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: isDark
                              ? const Color(0xFF123A2C)
                              : const Color(0xFFE6F4EA),
                          border: Border.all(
                            color: isDark
                                ? const Color(0xFF1D6044)
                                : const Color(0xFFC3E6CB),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          l10n.componentTypesActiveCountValue(6),
                          style: CustomTextStyles.inter(
                            color: AppColors.successGreen,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      // Spacer (will push button to end if on wide screen)
                      const SizedBox(width: 24),
                      // New Component Button
                      InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: primary.withValues(alpha: 0.3),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.add,
                                color: AppColors.white,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                l10n.classesSectionsAddClass,
                                style: CustomTextStyles.inter(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Top Action Row

            const SizedBox(height: 24),

            // Class Tree Container
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tree Header
                Row(
                  children: [
                    Container(
                      width: 4,
                      height: 20,
                      decoration: BoxDecoration(
                        color: isDark
                            ? AppColors.darkSurfaceHighlight
                            : primary.withValues(alpha: 0.04),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isDark
                              ? AppColors.darkBorder
                              : primary.withValues(alpha: 0.1),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        l10n.classesSectionsTree,
                        style: CustomTextStyles.inter(
                          color: isDark
                              ? AppColors.white
                              : AppColors.textPrimary,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: _toggleExpandAll,
                      borderRadius: BorderRadius.circular(4),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              anyExpanded
                                  ? l10n.classesSectionsCollapseAll
                                  : l10n.classesSectionsExpandAll,
                              style: CustomTextStyles.inter(
                                color: primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Icon(
                              anyExpanded
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: primaryColor,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // The Tree List
                ..._classes.map((cls) => _buildClassCard(cls, isDark, l10n)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClassCard(_ClassModel cls, bool isDark, AppLocalizations l10n) {
    final Color mutedTextColor = isDark
        ? AppColors.darkTextSecondary
        : Theme.of(context).colorScheme.onSurfaceVariant;
    final Color borderColor = isDark ? AppColors.darkBorder : AppColors.divider;
    final Color activeColor = Theme.of(context).colorScheme.primary;
    final Color activeBorder = activeColor.withValues(alpha: 0.5);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.darkSurfaceHighlight
            : Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark
              ? AppColors.darkBorder
              : Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        children: [
          // Header Row (Always visible)
          InkWell(
            onTap: () {
              setState(() {
                cls.isExpanded = !cls.isExpanded;
              });
            },
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Expand Button
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: cls.isExpanded
                          ? activeColor.withValues(alpha: 0.1)
                          : Colors.transparent,
                      border: Border.all(
                        color: cls.isExpanded ? activeBorder : borderColor,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      cls.isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: cls.isExpanded ? activeColor : mutedTextColor,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 16),

                  // Class Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 8,
                          runSpacing: 4,
                          children: [
                            Icon(
                              Icons.account_balance,
                              color: activeColor,
                              size: 20,
                            ),
                            Text(
                              cls.nameEn,
                              style: CustomTextStyles.inter(
                                color: isDark
                                    ? AppColors.white
                                    : AppColors.textPrimary,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              cls.nameBn,
                              style: CustomTextStyles.inter(
                                color: mutedTextColor,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            _buildPill(cls.grade, isDark, false),
                            if (cls.tag != null)
                              _buildPill(cls.tag!, isDark, true),
                            _buildPill(
                              '${cls.sections.length}টি সেকশন',
                              isDark,
                              false,
                              highlight: true,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),

                  // Actions
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          border: Border.all(color: borderColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.edit_outlined,
                            size: 18,
                            color: isDark
                                ? AppColors.darkTextPrimary
                                : Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                          padding: EdgeInsets.zero,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          border: Border.all(color: borderColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.delete_outline,
                            size: 18,
                            color: Color(0xFFF03E3E),
                          ),
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Expanded Sections Area
          if (cls.isExpanded) ...[
            Divider(height: 1, color: borderColor),
            Stack(
              children: [
                // Vertical Tree Line
                Positioned(
                  left: 31, // Align with the center of the 32px expand button (16 + 16 padding - 1 for line thickness)
                  top: 0,
                  bottom: 32, // don't go all the way to the bottom
                  child: Container(
                    width: 2,
                    color: activeColor.withValues(alpha: 0.3),
                  ),
                ),

                // The Sections List
                Padding(
                  padding: const EdgeInsets.only(
                    left: 64,
                    right: 16,
                    top: 24,
                    bottom: 24,
                  ),
                  child: Column(
                    children: [
                      ...cls.sections.map(
                        (s) => _buildSectionCard(
                          s,
                          isDark,
                          activeColor,
                          borderColor,
                          mutedTextColor,
                          l10n,
                        ),
                      ),

                      // Add Section Button (Dashed style but using border for simplicity if dashed isn't native)
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            left: -33,
                            top: 24,
                            child: Container(
                              width: 33,
                              height: 2,
                              color: activeColor.withValues(alpha: 0.3),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(
                              color: activeColor.withValues(alpha: 0.05),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: activeBorder,
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: InkWell(
                              onTap: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add, color: activeColor, size: 18),
                                  const SizedBox(width: 8),
                                  Text(
                                    '+ সেকশন যোগ করুন',
                                    style: CustomTextStyles.inter(
                                      color: activeColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSectionCard(
    _SectionModel section,
    bool isDark,
    Color activeColor,
    Color borderColor,
    Color mutedTextColor,
    AppLocalizations l10n,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Horizontal Tree Line to connect this card
          Positioned(
            left: -33,
            top: 24,
            child: Container(
              width: 33,
              height: 2,
              color: activeColor.withValues(alpha: 0.3),
            ),
          ),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: borderColor),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Row
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: section.dotColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 8,
                        runSpacing: 4,
                        children: [
                          Text(
                            section.nameEn,
                            style: CustomTextStyles.inter(
                              color: isDark
                                  ? AppColors.white
                                  : AppColors.textPrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            section.nameBn,
                            style: CustomTextStyles.inter(
                              color: mutedTextColor,
                              fontSize: 14,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: isDark
                                  ? const Color(0xFF3B2B1C)
                                  : const Color(0xFFFFF4E6),
                              border: Border.all(
                                color: isDark
                                    ? const Color(0xFF674923)
                                    : const Color(0xFFFFD8A8),
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              section.shift,
                              style: CustomTextStyles.inter(
                                color: isDark
                                    ? const Color(0xFFFFB36B)
                                    : const Color(0xFFD9480F),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit_outlined,
                        size: 18,
                        color: mutedTextColor,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Bottom Info Row
                Wrap(
                  spacing: 24,
                  runSpacing: 8,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.people_outline,
                          size: 18,
                          color: activeColor,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${section.students} জন ${l10n.classesSectionsStudents}',
                          style: CustomTextStyles.inter(
                            color: isDark
                                ? AppColors.darkTextPrimary
                                : AppColors.textPrimary,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.person_outline,
                          size: 18,
                          color: mutedTextColor,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${l10n.classesSectionsTeacher}: ${section.teacher}',
                          style: CustomTextStyles.inter(
                            color: mutedTextColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPill(
    String text,
    bool isDark,
    bool isPrimary, {
    bool highlight = false,
  }) {
    Color bg;
    Color border;
    Color textCol;

    if (isPrimary) {
      bg = isDark ? const Color(0xFF4A152B) : const Color(0xFFFFDEEB);
      border = bg;
      textCol = isDark ? const Color(0xFFFF87AB) : const Color(0xFFD6336C);
    } else if (highlight) {
      final primaryColor = Theme.of(context).colorScheme.primary;
      bg = primaryColor.withValues(alpha: 0.14);
      border = primaryColor.withValues(alpha: 0.35);
      textCol = primaryColor;
    } else {
      bg = isDark ? AppColors.darkSurfaceHighlight : const Color(0xFFF1F3F5);
      border = isDark ? AppColors.darkBorder : const Color(0xFFDEE2E6);
      textCol = isDark ? AppColors.darkTextPrimary : AppColors.textPrimary;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        border: Border.all(color: border),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: CustomTextStyles.inter(
          color: textCol,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
