import 'package:equatable/equatable.dart';
import 'package:schoolmate/core/file_path.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object?> get props => [];
}

class ChangeLocaleEvent extends AppEvent {
  final Locale locale;

  const ChangeLocaleEvent(this.locale);

  @override
  List<Object?> get props => [locale];
}
