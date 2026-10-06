import 'package:flutter/material.dart';

class CalendarEvent {
  final DateTime start;
  final DateTime end;
  final String title;
  final String type;
  final Color color;

  CalendarEvent({
    required this.start,
    required this.end,
    required this.title,
    required this.type,
    required this.color,
  });
}
