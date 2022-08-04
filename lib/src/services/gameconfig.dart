import 'package:beer_distribution_game/src/models/models.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class GameConfigService extends StateNotifier<GameConfiguration> {
  GameConfigService._()
      : super(GameConfiguration(configName: 'unknown', maxAmountPlayers: 0));
}

class BeerGameConfigService extends StateNotifier<GameConfiguration>
    implements GameConfigService {
  BeerGameConfigService()
      : super(GameConfiguration(configName: 'unknown', maxAmountPlayers: 0));
}
