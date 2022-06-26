import 'package:beer_distribution_game/src/ui/screens/base.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Center(
        child: Column(
          children: [
            Text('settingScreen'),
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
