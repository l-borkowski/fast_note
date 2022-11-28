import 'package:bloc/bloc.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsState.initial());

  // ignore: avoid_positional_boolean_parameters
  void changeTheme(bool darkMode) {
    emit(state.copyWith(darkMode: darkMode));
  }
}
