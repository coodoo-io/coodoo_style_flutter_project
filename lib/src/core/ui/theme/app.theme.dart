import 'dart:io';

import 'package:coodoo_style_flutter_project/src/core/utils/color.util.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const _primaryColorHex = 0xff1e9cd7;
  static const _primaryColor = Color(_primaryColorHex);
  static const Color _backgroundColor = Color(0xFFF5F5F5);
  static final _materialColor =
      ColorUtil.generateMaterialColor(_primaryColorHex);

  static ThemeData get light {
    return _getTheme(_materialColor, isAndroid: Platform.isAndroid);
  }

  static ThemeData get dark {
    return _getTheme(_materialColor,
        isLight: false, isAndroid: Platform.isAndroid);
  }

  static ThemeData _getTheme(MaterialColor materialColor,
      {bool isLight = true, bool isAndroid = false}) {
    final _theme = isLight ? ThemeData.light() : ThemeData.dark();
    return ThemeData(
        brightness: isLight ? Brightness.light : Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: materialColor,
        primaryColor: materialColor,
        splashColor: isAndroid ? _theme.splashColor : Colors.transparent,
        highlightColor: isAndroid ? _theme.highlightColor : Colors.transparent,
        backgroundColor: isLight ? Colors.white : Colors.grey[900],
        scaffoldBackgroundColor: isLight ? _backgroundColor : Colors.grey[900],
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: _primaryColor));
  }
}
