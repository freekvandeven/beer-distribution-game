import 'package:beer_distribution_game/src/ui/screens/base.dart';
import 'package:flutter/material.dart';

class GameReplayScreen extends StatelessWidget {
  const GameReplayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Replaying a Previous game'),
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
