class BeerRoute {
  const BeerRoute(this.route);

  static const splashScreen = BeerRoute('/splash');
  static const introductionScreen = BeerRoute('/introduction');
  static const homeScreen = BeerRoute('/home');
  //home screen actions
  static const settingScreen = BeerRoute('/setting');
  static const creditsScreen = BeerRoute('/credits');
  static const agentConfiguration = BeerRoute('/agentConfiguration');
  static const gameSelectionScreen = BeerRoute('/gameSelection');
  static const gameConfigurationOverviewScreen =
      BeerRoute('/gameConfigurationOverview');
  static const replaysOverviewScreen = BeerRoute('/replaysOverview');
  // normal gameflow screens
  static const lobbyBrowserScreen = BeerRoute('/lobbyBrowser');
  static const lobbyScreen = BeerRoute('/lobby');
  static const gameScreen = BeerRoute('/game');
  static const gameOverScreen = BeerRoute('/gameOver');

  // other actions
  static const gameConfigurationScreen = BeerRoute('/gameConfiguration');
  static const gameReplayScreen = BeerRoute('/gameReplay');

  final String route;

  @override
  String toString() {
    return route;
  }
}
