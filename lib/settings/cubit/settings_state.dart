// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'settings_cubit.dart';

class SettingsState {
  const SettingsState({
    required this.darkMode,
  });

  final bool darkMode;

  factory SettingsState.initial() => const SettingsState(
        darkMode: false,
      );

  SettingsState copyWith({
    bool? darkMode,
  }) {
    return SettingsState(
      darkMode: darkMode ?? this.darkMode,
    );
  }
}
