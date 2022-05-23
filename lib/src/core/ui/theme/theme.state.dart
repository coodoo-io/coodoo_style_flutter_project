import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme.state.freezed.dart';

@freezed
class ThemeState with _$ThemeState {
  factory ThemeState({
    @Default(ThemeMode.system) ThemeMode? themeMode,
    required ThemeData lightTheme,
    required ThemeData darkTheme,
  }) = _ThemeState;
}
