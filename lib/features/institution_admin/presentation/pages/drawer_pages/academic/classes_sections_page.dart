import 'package:schoolmate/core/file_path.dart';
import 'package:schoolmate/features/institution_admin/presentation/pages/drawer_pages/academic/widgets/academic_header_card.dart';

import 'models/class_model.dart';
import 'models/section_model.dart';

// Data Models

class ClassesSectionsPage extends StatefulWidget {
  static const String routeName = '/classes-sections';

  const ClassesSectionsPage({super.key});

  @override
  State<ClassesSectionsPage> createState() => _ClassesSectionsPageState();
}

class _ClassesSectionsPageState extends State<ClassesSectionsPage> {
  late List<ClassModel> _classes;

  @override
  void initState() {
    super.initState();
    _classes = [
      ClassModel(
        id: '1',
        nameEn: 'Baby Class',
        nameBn: 'বেবি ক্লাস',
        grade: 'Grade 0',
        tag: 'Pre-Primary',
        isExpanded: true,
        sections: [
          SectionModel(
            nameEn: 'Section A',
            nameBn: '(পদ্ম - Padma)',
            shift: 'প্রভাতী শিফট',
            students: 32,
            teacher: 'নুসরাত জাহান',
            dotColor: const Color(0xFFF59F00),
          ),
          SectionModel(
            nameEn: 'Section B',
            nameBn: '(শাপলা - Shapla)',
            shift: 'দিবা শিফট',
            students: 30,
            teacher: 'ফারহানা আহমেদ',
            dotColor: const Color(0xFF339AF0),
          ),
        ],
      ),
      ClassModel(
        id: '2',
        nameEn: 'Nursery',
        nameBn: 'নার্সারি',
        grade: 'Grade 0',
        tag: 'Pre-Primary',
        sections: [],
      ),
      ClassModel(
        id: '3',
        nameEn: 'KG-1',
        nameBn: 'কেজি-১',
        grade: 'Grade 0',
        tag: 'Pre-Primary',
        sections: [],
      ),
      ClassModel(
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
    final Color primaryColor = Theme.of(context).colorScheme.primary;

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
            AcademicHeaderCard(
              title: l10n.classesSectionsTitle,
              description: l10n.classesSectionsSubtitle,
              action: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: Text(l10n.classesSectionsAddClass),
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
                ..._classes.map((cls) => _buildClassCard(cls, isDark)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClassCard(ClassModel cls, bool isDark) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              cls.isExpanded
                  ? Icons.keyboard_arrow_down
                  : Icons.keyboard_arrow_right,
            ),
            title: Text(cls.nameEn),
            subtitle: Text('${cls.nameBn} · ${cls.grade}'),
            trailing: cls.tag == null
                ? null
                : _buildPill(cls.tag!, isDark: isDark),
            onTap: () => setState(() => cls.isExpanded = !cls.isExpanded),
          ),
          if (cls.isExpanded)
            ...cls.sections.map(
              (section) => ListTile(
                leading: CircleAvatar(
                  radius: 5,
                  backgroundColor: section.dotColor,
                ),
                title: Text('${section.nameEn} ${section.nameBn}'),
                subtitle: Text(
                  '${section.shift} · ${section.students} students · ${section.teacher}',
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPill(
    String text, {
    required bool isDark,
    bool isPrimary = false,
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
