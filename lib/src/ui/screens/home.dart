import 'package:beer_distribution_game/src/config/beerroutes.dart';
import 'package:beer_distribution_game/src/ui/screens/base.dart';
import 'package:beer_distribution_game/src/ui/widgets/buttons/primary_button.dart';
import 'package:beer_distribution_game/src/ui/widgets/dialogs/exit_app.dart';
import 'package:beer_distribution_game/src/ui/widgets/game_explainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainMenuItem {
  const MainMenuItem({
    required this.title,
    required this.icon,
    required this.action,
  });

  final String title;
  final IconData icon;
  final Function(BuildContext) action;
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var translate = AppLocalizations.of(context)!;
    var menuItems = [
      MainMenuItem(
        title: translate.home_play,
        icon: Icons.play_arrow_outlined,
        action: (context) => Navigator.of(context).pushNamed(
          BeerRoute.gameSelectionScreen.route,
        ),
      ),
      MainMenuItem(
        title: translate.home_configure_game,
        icon: Icons.add_box_rounded,
        action: (context) => Navigator.of(context).pushNamed(
          BeerRoute.gameConfigurationScreen.route,
        ),
      ),
      MainMenuItem(
        title: translate.home_configure_agents,
        icon: Icons.support_agent_sharp,
        action: (context) => Navigator.of(context).pushNamed(
          BeerRoute.agentConfiguration.route,
        ),
      ),
      MainMenuItem(
        title: translate.home_replay,
        icon: Icons.replay,
        action: (context) => Navigator.of(context).pushNamed(
          BeerRoute.replaysOverviewScreen.route,
        ),
      ),
      MainMenuItem(
        title: translate.home_settings,
        icon: Icons.settings,
        action: (context) => Navigator.of(context).pushNamed(
          BeerRoute.settingScreen.route,
        ),
      ),
      MainMenuItem(
        title: translate.home_credits,
        icon: Icons.info_outlined,
        action: (context) => Navigator.of(context).pushNamed(
          BeerRoute.creditsScreen.route,
        ),
      ),
      MainMenuItem(
        title: translate.home_exit,
        icon: Icons.exit_to_app,
        action: _exitConfirmationDialog,
      ),
    ];
    return BaseScreen(
      escapeTrigger: () {
        _exitConfirmationDialog(context);
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFe8e9eb),
                    Color(0xFFc5cad6),
                  ],
                ),
              ),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100.0, bottom: 10),
                    child: Text(
                      translate.appTitle,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  Text(
                    translate.appTitleSubtext,
                    style: Theme.of(context).textTheme.headline4,
                    textAlign: TextAlign.center,
                  ),
                  for (var item in menuItems) ...[
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                      child: PrimaryButton(
                        onPressed: () => item.action(context),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(item.icon),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              item.title,
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            GameExplainerWidget(),
          ],
        ),
      ),
    );
  }

  void _exitConfirmationDialog(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (context) => QuitAppDialog(),
    );
  }
}
