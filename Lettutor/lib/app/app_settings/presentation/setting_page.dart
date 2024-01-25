import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lettutor/app/app_settings/presentation/controllers/language_controller.dart';
import 'package:lettutor/app/app_settings/presentation/controllers/settings_controller.dart';
import 'package:lettutor/app/app_settings/presentation/controllers/theme_mode_controller.dart';
import 'package:lettutor/core/common-widgets/async_value_widget.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum Language {
  english("en"),
  vietnamese("vi");

  final String value;

  const Language(this.value);
}

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final txt = AppLocalizations.of(context)!;
    final settings = ref.watch(settingsControllerProvider);
    return AsyncValueWidget(
      value: settings,
      data: (settings) {
        return SettingsList(
          sections: [
            SettingsSection(tiles: [
              SettingsTile.switchTile(
                title: Text(txt.darkMode),
                leading: const Icon(Icons.lightbulb_outline),
                onToggle: (bool value) {
                  ref.watch(themeModeControllerProvider.notifier).changeThemeMode(value);
                },
                initialValue: settings['themeMode'],
              ),
              SettingsTile.navigation(
                title: Text(txt.language),
                leading: const Icon(Icons.language),
                description: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RadioListTile<String>(
                        value: Language.english.value,
                        title: Text(txt.english),
                        groupValue: settings['language'],
                        onChanged: (value) {
                          if (value == null) return;
                          ref.watch(languageControllerProvider.notifier).changeLanguage(value);
                        }),
                    RadioListTile<String>(
                        value: Language.vietnamese.value,
                        title: Text(txt.vietnamese),
                        groupValue: settings['language'],
                        onChanged: (value) {
                          if (value == null) return;
                          ref.watch(languageControllerProvider.notifier).changeLanguage(value);
                        }),
                  ],
                ),
              ),
            ]),
          ],
        );
      },
    );
  }
}
