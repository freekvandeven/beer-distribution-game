import 'package:beer_distribution_game/src/config/beerroutes.dart';
import 'package:beer_distribution_game/src/ui/screens/home.dart';
import 'package:flutter/widgets.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <
      BeerRoute,
      Widget Function(
    BuildContext,
  )>{
    BeerRoute.splashScreen: (context) => HomeScreen(),
    BeerRoute.introductionScreen: (context) => HomeScreen(),
    BeerRoute.homeScreen: (context) => HomeScreen(),
    BeerRoute.settingScreen: (context) => HomeScreen(),
    BeerRoute.creditsScreen: (context) => HomeScreen(),
    BeerRoute.agentConfiguration: (context) => HomeScreen(),
    BeerRoute.gameSelectionScreen: (context) => HomeScreen(),
    BeerRoute.gameConfigurationOverviewScreen: (context) => HomeScreen(),
    BeerRoute.replaysOverviewScreen: (context) => HomeScreen(),
    BeerRoute.lobbyBrowserScreen: (context) => HomeScreen(),
    BeerRoute.lobbyScreen: (context) => HomeScreen(),
    BeerRoute.gameScreen: (context) => HomeScreen(),
    BeerRoute.gameOverScreen: (context) => HomeScreen(),
    BeerRoute.gameConfigurationScreen: (context) => HomeScreen(),
    BeerRoute.gameReplayScreen: (context) => HomeScreen(),
  }.map((key, value) => MapEntry(key.route, value));
}
