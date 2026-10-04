import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolmate/core/file_path.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final SharedPreferences _prefs;

  AppBloc(this._prefs) : super(_loadInitialState(_prefs)) {
    on<ChangeLocaleEvent>(_onChangeLocale);
    on<ChangeThemeEvent>(_onChangeTheme);
  }

  static AppState _loadInitialState(SharedPreferences prefs) {
    final languageCode = prefs.getString('language_code') ?? 'en';
    final themeModeStr = prefs.getString('theme_mode') ?? 'system';
    
    ThemeMode themeMode = ThemeMode.system;
    if (themeModeStr == 'light') themeMode = ThemeMode.light;
    else if (themeModeStr == 'dark') themeMode = ThemeMode.dark;
    
    return AppState(
      locale: Locale(languageCode),
      themeMode: themeMode,
    );
  }

  void _onChangeLocale(ChangeLocaleEvent event, Emitter<AppState> emit) {
    if (state.locale != event.locale) {
      _prefs.setString('language_code', event.locale.languageCode);
      emit(state.copyWith(locale: event.locale));
    }
  }

  void _onChangeTheme(ChangeThemeEvent event, Emitter<AppState> emit) {
    if (state.themeMode != event.themeMode) {
      _prefs.setString('theme_mode', event.themeMode.name);
      emit(state.copyWith(themeMode: event.themeMode));
    }
  }
}
