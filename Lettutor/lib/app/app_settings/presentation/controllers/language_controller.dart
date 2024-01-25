import 'package:lettutor/app/app_settings/presentation/setting_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'language_controller.g.dart';

@Riverpod(keepAlive: true)
class LanguageController extends _$LanguageController {
  @override
  Future<String> build() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    state = AsyncData(prefs.getString('language') == 'vi' ? Language.vietnamese.value : Language.english.value);
    return state.valueOrNull ?? Language.english.value;
  }

  Future<String> changeLanguage(String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    state = AsyncLoading();
    final result = await prefs.setString('language', language.toString());
    if (result) {
      state = AsyncData(language);
      return state.valueOrNull ?? Language.english.value;
    } else {
      return Language.english.value;
    }
  }

  Future<String> getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    state = AsyncData(prefs.getString('language') == 'vi' ? Language.vietnamese.value : Language.english.value);
    return state.valueOrNull ?? Language.english.value;
  }
}
