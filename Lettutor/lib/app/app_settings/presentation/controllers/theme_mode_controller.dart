

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_mode_controller.g.dart';

@Riverpod(keepAlive: true)
class ThemeModeController extends _$ThemeModeController {
  @override
  Future<bool> build() async {
    state = const AsyncLoading();
    final sharePrefs = await SharedPreferences.getInstance();
    final isDarkMode = sharePrefs.getBool('isDarkMode');
    state = AsyncData(isDarkMode ?? false);
    return state.valueOrNull ?? false;
  }

  Future<bool> changeThemeMode(bool isDarkMode) async {
    state = AsyncLoading();
    final sharePrefs = await SharedPreferences.getInstance();
    final result = await sharePrefs.setBool('isDarkMode', isDarkMode);
    if (result) {
      state = AsyncData(isDarkMode);
      return state.valueOrNull ?? false;
    } else {
      return false;
    }
  }

  Future<bool> getThemeMode() async {
    state = const AsyncLoading();
    final sharePrefs = await SharedPreferences.getInstance();
    final isDarkMode = sharePrefs.getBool('isDarkMode');
    state = AsyncData(isDarkMode ?? false);
    return state.valueOrNull ?? false;
  }
}