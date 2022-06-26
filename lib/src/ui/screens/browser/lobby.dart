import 'package:beer_distribution_game/src/ui/screens/base.dart';
import 'package:flutter/material.dart';

class GameLobbyScreen extends StatelessWidget {
  const GameLobbyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Game Lobby'),
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
