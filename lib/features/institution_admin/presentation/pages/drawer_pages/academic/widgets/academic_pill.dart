import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class AcademicPill extends StatelessWidget {
  final String text;
  final bool isDark;
  final bool isPrimary;
  final bool highlight;

  const AcademicPill(
    this.text,
    this.isDark,
    this.isPrimary, {
    super.key,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
