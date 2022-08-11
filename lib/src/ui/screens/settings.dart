import 'package:beer_distribution_game/src/models/models.dart';
import 'package:beer_distribution_game/src/providers.dart';
import 'package:beer_distribution_game/src/ui/screens/base.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseScreen(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Application Settings'),
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
