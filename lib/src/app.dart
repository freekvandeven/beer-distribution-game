import 'package:beer_distribution_game/src/config/beerroutes.dart';
import 'package:beer_distribution_game/src/config/routes.dart';
import 'package:beer_distribution_game/src/config/theme.dart';
import 'package:flutter/material.dart';

class BeerDistributionGame extends StatelessWidget {
  const BeerDistributionGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getTheme(),
      initialRoute: BeerRoute.splashScreen.route,
      onGenerateRoute: (settings) {
        var routes = getRoutes();
        if (routes.containsKey(settings.name)) {
          return PageRouteBuilder(
            pageBuilder: (_, __, ___) => routes[settings.name]!(context),
            settings: settings,
          );
        } else {
          return PageRouteBuilder(
            pageBuilder: (_, __, ___) => Text(
              'Page not Found',
            ),
          );
        }
      },
    );
  }
}
