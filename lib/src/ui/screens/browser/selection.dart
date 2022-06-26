import 'package:beer_distribution_game/src/ui/screens/base.dart';
import 'package:flutter/material.dart';

class GameSelectionScreen extends StatelessWidget {
  const GameSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Game Selection'),
            Text('Click the item you want to do'),
            Text('Join a game from code'),
            Text('Connect to game server'),
            Text('Search for games'),
            Text('Configure new game'),
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
