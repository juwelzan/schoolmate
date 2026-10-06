import 'package:flutter/material.dart';

class SectionModel {
  final String nameEn;
  final String nameBn;
  final String shift;
  final int students;
  final String teacher;
  final Color dotColor;

  SectionModel({
    required this.nameEn,
    required this.nameBn,
    required this.shift,
    required this.students,
    required this.teacher,
    required this.dotColor,
  });
}
