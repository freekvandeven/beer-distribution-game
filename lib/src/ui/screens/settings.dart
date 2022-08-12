import 'package:beer_distribution_game/src/config/language.dart';
import 'package:beer_distribution_game/src/models/models.dart';
import 'package:beer_distribution_game/src/providers.dart';
import 'package:beer_distribution_game/src/services/services.dart';
import 'package:beer_distribution_game/src/ui/screens/base.dart';
import 'package:beer_distribution_game/src/ui/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
    var translate = AppLocalizations.of(context)!;
    return BaseScreen(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFe8e9eb),
              Color(0xFFc5cad6),
            ],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100.0, bottom: 10),
              child: Text(
                translate.settings_title,
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Text(
              translate.settings_language,
              style: Theme.of(context).textTheme.headline5,
            ),
            DropdownButton(
              value: lang,
              onChanged: (Locale? val) {
                if (val != null) {
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: PrimaryButton(
                onPressed: () async {
                  // show a confirmation dialog
                  if (await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(translate.settings_clear_confirm),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: Text(translate.buttonCancel),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: Text(translate.buttonConfirm),
                        ),
                      ],
                    ),
                  )) {
                    var prefs = await SharedPreferences.getInstance();
                    await prefs.clear();
                    await ref
                        .read(applicationConfigProvider.notifier)
                        .saveApplicationSettings(
                          ApplicationConfiguration.defaultConfiguration(),
                        );
                    // show a success message
                  }
                },
                child: Text(
                  translate.settings_clear,
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
            PrimaryButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.arrow_back_rounded,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    translate.home_back,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
