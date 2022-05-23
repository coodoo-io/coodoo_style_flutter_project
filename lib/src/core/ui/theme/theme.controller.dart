import 'package:coodoo_style_flutter_project/src/core/ui/theme/app.theme.dart';
import 'package:coodoo_style_flutter_project/src/core/ui/theme/theme.state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider
final themeControllerProvider =
    StateNotifierProvider<ThemeController, ThemeState>((ref) {
  var themeState =
      ThemeState(lightTheme: AppTheme.light, darkTheme: AppTheme.dark);
  return ThemeController(state: themeState);
});

/// Controller
class ThemeController extends StateNotifier<ThemeState> {
  ThemeController({required ThemeState state}) : super(state);

  void reset() {
    state =
        state.copyWith(lightTheme: AppTheme.light, darkTheme: AppTheme.dark);
  }
}
