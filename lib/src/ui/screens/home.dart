import 'package:beer_distribution_game/src/config/beerroutes.dart';
import 'package:beer_distribution_game/src/ui/screens/base.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Center(
        child: Column(
          children: [
            Text('homeScreen'),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  BeerRoute.settingScreen.route,
                );
              },
              child: Text('go to setting screen'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  BeerRoute.creditsScreen.route,
                );
              },
              child: Text('go to credits screen'),
            ),
          ],
        ),
      ),
    );
  }
}
