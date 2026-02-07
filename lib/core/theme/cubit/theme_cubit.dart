import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ChangedThemeState> {
  ThemeCubit() : super(ChangedThemeState(themeMode: ThemeMode.light));

  ThemeMode themeMode = ThemeMode.light;

  void toggleTheme() {
    themeMode = themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    emit(ChangedThemeState(themeMode: themeMode));
  }
}
