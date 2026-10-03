import 'package:equatable/equatable.dart';
import 'package:schoolmate/core/file_path.dart';

class AppState extends Equatable {
  final Locale locale;

  const AppState({
    required this.locale,
  });

  factory AppState.initial() {
    return const AppState(locale: Locale('bn')); // Default is Bengali based on design
  }

  AppState copyWith({
    Locale? locale,
  }) {
    return AppState(
      locale: locale ?? this.locale,
    );
  }

  @override
  List<Object?> get props => [locale];
}
