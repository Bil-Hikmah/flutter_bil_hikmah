part of 'theme_mode_cubit.dart';

enum ThemeModeStateStatus { initial, loading, success, failure }

class ThemeModeState extends Equatable {
  const ThemeModeState({
    this.status = ThemeModeStateStatus.initial,
    this.themeMode = ThemeMode.light,
  });

  final ThemeModeStateStatus status;
  final ThemeMode themeMode;

  ThemeModeState copyWith({
    ThemeModeStateStatus? status,
    ThemeMode? themeMode,
  }) {
    return ThemeModeState(
      status: status ?? this.status,
      themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  List<Object> get props => [
        status,
        themeMode,
      ];
}
