import 'dart:io';

import 'package:beer_distribution_game/src/config/beerroutes.dart';
import 'package:beer_distribution_game/src/ui/screens/base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var translate = AppLocalizations.of(context)!;
    return BaseScreen(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              translate.appTitle,
              style: Theme.of(context).textTheme.headline3,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  BeerRoute.gameSelectionScreen.route,
                );
              },
              child: Text(
                translate.home_play,
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
                translate.home_configure_game,
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
                translate.home_configure_agents,
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
                translate.home_replay,
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
                translate.home_settings,
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
                translate.home_credits,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            GestureDetector(
              onTap: () {
                // exit the app
                exit(0);
              },
              child: Text(
                translate.home_exit,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
