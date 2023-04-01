import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_mode_state.dart';

class ThemeModeCubit extends Cubit<ThemeModeState> {
  ThemeModeCubit() : super(const ThemeModeState());

  void setThemeMode(ThemeMode themeMode) {
    emit(state.copyWith(status: ThemeModeStateStatus.loading));
    emit(state.copyWith(
      themeMode: themeMode,
      status: ThemeModeStateStatus.success,
    ));
  }
}
