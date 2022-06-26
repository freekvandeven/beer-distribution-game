import 'package:beer_distribution_game/src/config/beerroutes.dart';
import 'package:beer_distribution_game/src/ui/screens/base.dart';
import 'package:flutter/material.dart';

class GameEndedScreen extends StatelessWidget {
  const GameEndedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Game Ended'),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacementNamed(
                  BeerRoute.homeScreen.route,
                );
              },
              child: Text('Go to home'),
            ),
          ],
        ),
      ),
    );
  }
}
