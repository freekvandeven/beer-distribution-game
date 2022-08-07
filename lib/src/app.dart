import 'package:beer_distribution_game/src/config/beerroutes.dart';
import 'package:beer_distribution_game/src/config/routes.dart';
import 'package:beer_distribution_game/src/config/scroll.dart';
import 'package:beer_distribution_game/src/config/theme.dart';
import 'package:beer_distribution_game/src/providers.dart';
import 'package:flutter/material.dart';

class BeerDistributionGame extends ConsumerStatefulWidget {
  const BeerDistributionGame({Key? key}) : super(key: key);

  @override
  ConsumerState<BeerDistributionGame> createState() =>
      _BeerDistributionGameState();
}

class _BeerDistributionGameState extends ConsumerState<BeerDistributionGame> {
  @override
  void initState() {
    super.initState();
    ref.read(applicationConfigProvider.notifier).loadApplicationSettings();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: AppScrollBehavior(),
      theme: getTheme(),
      initialRoute: BeerRoute.splashScreen.route,
      onGenerateRoute: (settings) {
        var routes = getRoutes();
        if (routes.containsKey(settings.name)) {
          return PageRouteBuilder(
            pageBuilder: (_, __, ___) =>
                routes[settings.name]!(context, ref, null),
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
