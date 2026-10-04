import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:schoolmate/core/file_path.dart';

class AppState extends Equatable {
  final Locale locale;
  final ThemeMode themeMode;

  const AppState({required this.locale, required this.themeMode});

  factory AppState.initial() {
    return const AppState(
      locale: Locale('bn'),
      themeMode: ThemeMode.system,
    ); // Default is Bengali based on design
  }

  AppState copyWith({Locale? locale, ThemeMode? themeMode}) {
    return AppState(
      locale: locale ?? this.locale,
      themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  List<Object?> get props => [locale, themeMode];
}
