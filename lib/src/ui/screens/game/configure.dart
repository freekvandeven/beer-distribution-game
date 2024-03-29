import 'package:beer_distribution_game/src/ui/screens/base.dart';
import 'package:flutter/material.dart';

class ConfigureGameScreen extends StatelessWidget {
  const ConfigureGameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      escapeTrigger: () => Navigator.of(context).pop(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Configure a new Game'),
            Text('Or edit existing one'),
            GestureDetector(
              onTap: () {
                debugPrint('Saving game');
              },
              child: Text('Save'),
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
