import 'dart:io';

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Beer Distribution Game',
              style: Theme.of(context).textTheme.headline3,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  BeerRoute.gameSelectionScreen.route,
                );
              },
              child: Text('Play game'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  BeerRoute.gameConfigurationOverviewScreen.route,
                );
              },
              child: Text('go to game configuration'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  BeerRoute.agentConfiguration.route,
                );
              },
              child: Text('Configure agents'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  BeerRoute.replaysOverviewScreen.route,
                );
              },
              child: Text('Previous played games'),
            ),
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
            GestureDetector(
              onTap: () {
                // exit the app
                exit(0);
              },
              child: Text('Exit game'),
            ),
          ],
        ),
      ),
    );
  }
}
