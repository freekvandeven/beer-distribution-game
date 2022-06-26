import 'package:beer_distribution_game/src/config/beerroutes.dart';
import 'package:beer_distribution_game/src/ui/screens/agent.dart';
import 'package:beer_distribution_game/src/ui/screens/browser/browser.dart';
import 'package:beer_distribution_game/src/ui/screens/browser/configuration_overview.dart';
import 'package:beer_distribution_game/src/ui/screens/browser/lobby.dart';
import 'package:beer_distribution_game/src/ui/screens/browser/replay_overview.dart';
import 'package:beer_distribution_game/src/ui/screens/browser/selection.dart';
import 'package:beer_distribution_game/src/ui/screens/credits.dart';
import 'package:beer_distribution_game/src/ui/screens/game/configure.dart';
import 'package:beer_distribution_game/src/ui/screens/game/gameover.dart';
import 'package:beer_distribution_game/src/ui/screens/game/play.dart';
import 'package:beer_distribution_game/src/ui/screens/game/replay.dart';
import 'package:beer_distribution_game/src/ui/screens/home.dart';
import 'package:beer_distribution_game/src/ui/screens/introduction.dart';
import 'package:beer_distribution_game/src/ui/screens/settings.dart';
import 'package:beer_distribution_game/src/ui/screens/splash.dart';
import 'package:flutter/widgets.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <
      BeerRoute,
      Widget Function(
    BuildContext,
  )>{
    BeerRoute.splashScreen: (context) => SplashScreen(),
    BeerRoute.introductionScreen: (context) => IntroductionScreen(),
    BeerRoute.homeScreen: (context) => HomeScreen(),
    BeerRoute.settingScreen: (context) => SettingScreen(),
    BeerRoute.creditsScreen: (context) => CreditScreen(),
    BeerRoute.agentConfiguration: (context) => AgentConfigurationScreen(),
    BeerRoute.gameSelectionScreen: (context) => GameSelectionScreen(),
    BeerRoute.gameConfigurationOverviewScreen: (context) =>
        GameConfigurationOverviewScreen(),
    BeerRoute.replaysOverviewScreen: (context) => ReplayOverviewScreen(),
    BeerRoute.lobbyBrowserScreen: (context) => GameBrowserScreen(),
    BeerRoute.lobbyScreen: (context) => GameLobbyScreen(),
    BeerRoute.gameScreen: (context) => PlayGameScreen(),
    BeerRoute.gameOverScreen: (context) => GameEndedScreen(),
    BeerRoute.gameConfigurationScreen: (context) => ConfigureGameScreen(),
    BeerRoute.gameReplayScreen: (context) => GameReplayScreen(),
  }.map((key, value) => MapEntry(key.route, value));
}
