part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  const SettingsState({
    required this.darkMode,
  });

  factory SettingsState.initial() => const SettingsState(
        darkMode: false,
      );

  final bool darkMode;

  SettingsState copyWith({
    bool? darkMode,
  }) {
    return SettingsState(
      darkMode: darkMode ?? this.darkMode,
    );
  }

  @override
  List<Object> get props => [darkMode];
}
