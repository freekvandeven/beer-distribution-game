import 'package:beer_distribution_game/src/config/beerroutes.dart';
import 'package:beer_distribution_game/src/ui/screens/base.dart';
import 'package:flutter/material.dart';

class GameBrowserScreen extends StatelessWidget {
  const GameBrowserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      escapeTrigger: () => Navigator.of(context).pop(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Browse for games'),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacementNamed(
                  BeerRoute.lobbyScreen.route,
                );
              },
              child: Text('Join Game 1'),
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
