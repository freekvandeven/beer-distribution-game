import 'package:beer_distribution_game/src/models/models.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class GameService extends StateNotifier<BeerGame> {
  GameService._()
      : super(
          BeerGame(
            gameName: 'Beer Distribution Game',
            config:
                GameConfiguration(configName: 'unknown', maxAmountPlayers: 0),
          ),
        );
}

class BeerGameService extends StateNotifier<BeerGame> implements GameService {
  BeerGameService()
      : super(
          BeerGame(
            gameName: 'Beer Distribution Game',
            config:
                GameConfiguration(configName: 'unknown', maxAmountPlayers: 0),
          ),
        );
}
