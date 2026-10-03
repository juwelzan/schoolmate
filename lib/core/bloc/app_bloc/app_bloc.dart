import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolmate/core/file_path.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState.initial()) {
    on<ChangeLocaleEvent>(_onChangeLocale);
  }

  void _onChangeLocale(ChangeLocaleEvent event, Emitter<AppState> emit) {
    if (state.locale != event.locale) {
      emit(state.copyWith(locale: event.locale));
    }
  }
}
