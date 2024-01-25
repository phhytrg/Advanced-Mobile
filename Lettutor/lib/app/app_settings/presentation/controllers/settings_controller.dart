

import 'package:lettutor/app/app_settings/presentation/controllers/language_controller.dart';
import 'package:lettutor/app/app_settings/presentation/controllers/theme_mode_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_controller.g.dart';

@Riverpod(keepAlive: true)
class SettingsController extends _$SettingsController {
  // @override
  // Future<Map<String, dynamic>> build() async {
  //   final language = await ref.read(languageControllerProvider);
  // }
  @override
  Future<Map<String, dynamic>> build() async {
    final language = ref.watch(languageControllerProvider);
    final themeMode = ref.watch(themeModeControllerProvider);
    state = AsyncData({
      'language': language.valueOrNull,
      'themeMode': themeMode.valueOrNull,
    });
    return state.valueOrNull ?? {
      'language': 'en',
      'themeMode': false,
    };
  }

  Future<Map<String, dynamic>> changeLanguage(String language) async {
    final languageController = ref.watch(languageControllerProvider.notifier);
    final result = await languageController.changeLanguage(language);
    if (result == language) {
      state = AsyncData({
        'language': result,
        'themeMode': state.valueOrNull?['themeMode'],
      });
      return state.valueOrNull ?? {
        'language': 'en',
        'themeMode': false,
      };
    } else {
      return {
        'language': 'en',
        'themeMode': false,
      };
    }
  }

  Future<Map<String, dynamic>> changeThemeMode(bool isDarkMode) async {
    final themeModeController = ref.watch(themeModeControllerProvider.notifier);
    final result = await themeModeController.changeThemeMode(isDarkMode);
    if (result == isDarkMode) {
      state = AsyncData({
        'language': state.valueOrNull?['language'],
        'themeMode': result,
      });
      return state.valueOrNull ?? {
        'language': 'en',
        'themeMode': false,
      };
    } else {
      return {
        'language': 'en',
        'themeMode': false,
      };
    }
  }

  Future<Map<String, dynamic>> getSettings() async {
    final language = ref.watch(languageControllerProvider);
    final themeMode = ref.watch(themeModeControllerProvider);
    state = AsyncData({
      'language': language,
      'themeMode': themeMode,
    });
    return state.valueOrNull ?? {
      'language': 'en',
      'themeMode': false,
    };
  }

  Future<Map<String, dynamic>> resetSettings() async {
    final languageController = ref.watch(languageControllerProvider.notifier);
    final themeModeController = ref.watch(themeModeControllerProvider.notifier);
    final language = await languageController.getLanguage();
    final themeMode = await themeModeController.getThemeMode();
    state = AsyncData({
      'language': language,
      'themeMode': themeMode,
    });
    return state.valueOrNull ?? {
      'language': 'en',
      'themeMode': false,
    };
  }

}