import 'package:beer_distribution_game/src/config/beerroutes.dart';
import 'package:beer_distribution_game/src/providers.dart';
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

Map<String, ConsumerBuilder> getRoutes() {
  return <
      BeerRoute,
      Widget Function(
    BuildContext,
    WidgetRef,
    Widget?,
  )>{
    BeerRoute.splashScreen: (context, ref, ___) => SplashScreen(),
    BeerRoute.introductionScreen: (context, ref, ___) => IntroductionScreen(),
    BeerRoute.homeScreen: (context, ref, ___) => HomeScreen(),
    BeerRoute.settingScreen: (context, ref, ___) => SettingScreen(
          configService: ref.read(
            applicationConfigProvider.notifier,
          ),
        ),
    BeerRoute.creditsScreen: (context, ref, ___) => CreditScreen(),
    BeerRoute.agentConfiguration: (context, ref, ___) =>
        AgentConfigurationScreen(),
    BeerRoute.gameSelectionScreen: (context, ref, ___) => GameSelectionScreen(),
    BeerRoute.gameConfigurationOverviewScreen: (context, ref, ___) =>
        GameConfigurationOverviewScreen(),
    BeerRoute.replaysOverviewScreen: (context, ref, ___) =>
        ReplayOverviewScreen(),
    BeerRoute.lobbyBrowserScreen: (context, ref, ___) => GameBrowserScreen(),
    BeerRoute.lobbyScreen: (context, ref, ___) => GameLobbyScreen(),
    BeerRoute.gameScreen: (context, ref, ___) => PlayGameScreen(),
    BeerRoute.gameOverScreen: (context, ref, ___) => GameEndedScreen(),
    BeerRoute.gameConfigurationScreen: (context, ref, ___) =>
        ConfigureGameScreen(),
    BeerRoute.gameReplayScreen: (context, ref, ___) => GameReplayScreen(),
  }.map((key, value) => MapEntry(key.route, value));
}
