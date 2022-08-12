import 'package:beer_distribution_game/src/config/beerroutes.dart';
import 'package:beer_distribution_game/src/ui/screens/base.dart';
import 'package:flutter/material.dart';

class GameConfigurationOverviewScreen extends StatelessWidget {
  const GameConfigurationOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      escapeTrigger: () => Navigator.of(context).pop(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('All games that you can configure'),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  BeerRoute.gameConfigurationScreen.route,
                );
              },
              child: Text('Edit Game 1'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacementNamed(
                  BeerRoute.gameSelectionScreen.route,
                );
              },
              child: Text('Play a game'),
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
