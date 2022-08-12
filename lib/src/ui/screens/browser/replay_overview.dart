import 'package:beer_distribution_game/src/config/beerroutes.dart';
import 'package:beer_distribution_game/src/ui/screens/base.dart';
import 'package:flutter/material.dart';

class ReplayOverviewScreen extends StatelessWidget {
  const ReplayOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      escapeTrigger: () => Navigator.of(context).pop(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('All Game Replays'),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  BeerRoute.gameReplayScreen.route,
                );
              },
              child: Text('Replay Game 1'),
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
