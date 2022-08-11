import 'package:beer_distribution_game/src/config/language.dart';
import 'package:beer_distribution_game/src/models/models.dart';
import 'package:beer_distribution_game/src/providers.dart';
import 'package:beer_distribution_game/src/services/services.dart';
import 'package:beer_distribution_game/src/ui/screens/base.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({
    required ApplicationConfigurationService configService,
    Key? key,
  })  : _configService = configService,
        super(key: key);

  final ApplicationConfigurationService _configService;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = Localizations.localeOf(context);
    return BaseScreen(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Application Settings',
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(
              'Language',
              style: Theme.of(context).textTheme.headline5,
            ),
            DropdownButton(
              value: lang,
              onChanged: (Locale? val) {
                if (val != null) {
                  debugPrint('Selected language: $val');
                  _configService.saveApplicationSettings(
                    ref.read(applicationConfigProvider).copyWith(
                          language: val.languageCode,
                        ),
                  );
                }
              },
              items: getSupportedLanguages()
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(getLanguageTitle(e)),
                    ),
                  )
                  .toList(),
            ),
            GestureDetector(
              onTap: () async {
                var prefs = await SharedPreferences.getInstance();
                await prefs.clear();
                await ref
                    .read(applicationConfigProvider.notifier)
                    .saveApplicationSettings(
                      ApplicationConfiguration.defaultConfiguration(),
                    );
                // show a success message
                await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Success'),
                    content: Text('Settings cleared'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('OK'),
                      )
                    ],
                  ),
                );
              },
              child: Text(
                'Clear application settings',
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Text('go back'),
            ),
          ],
        ),
      ),
    );
  }
}
