import 'section_model.dart';

class ClassModel {
  final String id;
  final String nameEn;
  final String nameBn;
  final String grade;
  final String? tag;
  final List<SectionModel> sections;
  bool isExpanded;

  ClassModel({
    required this.id,
    required this.nameEn,
    required this.nameBn,
    required this.grade,
    this.tag,
    required this.sections,
    this.isExpanded = false,
  });
}
