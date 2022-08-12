import 'package:beer_distribution_game/src/config/beerroutes.dart';
import 'package:beer_distribution_game/src/services/services.dart';
import 'package:beer_distribution_game/src/ui/screens/base.dart';
import 'package:beer_distribution_game/src/ui/screens/home.dart';
import 'package:beer_distribution_game/src/ui/widgets/buttons/primary_button.dart';
import 'package:beer_distribution_game/src/ui/widgets/dialogs/game_code.dart';
import 'package:flutter/material.dart';

class GameSelectionScreen extends StatelessWidget {
  const GameSelectionScreen({
    required GameService gameService,
    Key? key,
  })  : _gameService = gameService,
        super(key: key);

  final GameService _gameService;

  @override
  Widget build(BuildContext context) {
    var menuActions = <MainMenuItem>[
      MainMenuItem(
        title: 'Host a new game',
        icon: Icons.add,
        action: (context) => Navigator.of(context).pushReplacementNamed(
          BeerRoute.gameConfigurationOverviewScreen.route,
        ),
      ),
      MainMenuItem(
        title: 'Join a game from code',
        icon: Icons.keyboard,
        action: _handleGameCodeInput,
      ),
      MainMenuItem(
        title: 'Join a game from browser',
        icon: Icons.search,
        action: (context) => Navigator.of(context).pushReplacementNamed(
          BeerRoute.lobbyBrowserScreen.route,
        ),
      ),
      MainMenuItem(
        title: 'Configure a new game',
        icon: Icons.build_outlined,
        action: (context) => Navigator.of(context).pushReplacementNamed(
          BeerRoute.gameConfigurationOverviewScreen.route,
        ),
      ),
      MainMenuItem(
        title: 'Go back',
        icon: Icons.arrow_back,
        action: (context) => Navigator.of(context).pop(),
      ),
    ];
    var size = MediaQuery.of(context).size;
    return BaseScreen(
      escapeTrigger: () => Navigator.of(context).pop(),
      child: Container(
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
                'Game Selection',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            for (var item in menuActions) ...[
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.015),
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
    );
  }

  Future<void> _handleGameCodeInput(BuildContext context) async {
    var navigator = Navigator.of(context);
    var messenger = ScaffoldMessenger.of(context);
    var result = await showDialog(
      context: context,
      builder: (context) => GameCodeDialog(),
    );
    if (result is String && result.isNotEmpty) {
      debugPrint(result);
      // try to connect to the corresponding game
      var join = await _gameService.connectToLobby(result);
      // if successful, navigate to the lobby screen
      if (join) {
        await navigator.pushReplacementNamed(
          BeerRoute.lobbyScreen.route,
        );
      } else {
        // otherwise, show an error message
        messenger.showSnackBar(
          SnackBar(
            content: Text('Could not join game'),
          ),
        );
      }
      // if not, show an error message

    }
  }
}
