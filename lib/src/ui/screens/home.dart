import 'dart:io';

import 'package:beer_distribution_game/src/config/beerroutes.dart';
import 'package:beer_distribution_game/src/ui/screens/base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              AppLocalizations.of(context)!.appTitle,
              style: Theme.of(context).textTheme.headline3,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  BeerRoute.gameSelectionScreen.route,
                );
              },
              child: Text(
                'Play game',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  BeerRoute.gameConfigurationOverviewScreen.route,
                );
              },
              child: Text(
                'Configure a game',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  BeerRoute.agentConfiguration.route,
                );
              },
              child: Text(
                'Configure agents',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  BeerRoute.replaysOverviewScreen.route,
                );
              },
              child: Text(
                'Previous played games',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  BeerRoute.settingScreen.route,
                );
              },
              child: Text(
                'Settings',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  BeerRoute.creditsScreen.route,
                );
              },
              child: Text(
                'Credits',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            GestureDetector(
              onTap: () {
                // exit the app
                exit(0);
              },
              child: Text(
                'Exit game',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
