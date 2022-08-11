import 'package:beer_distribution_game/src/models/models.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class GameConfigService extends StateNotifier<GameConfiguration> {
  GameConfigService._() : super(GameConfiguration.defaultConfiguration());
  Future<void> saveGame();
  Future<void> listGames();
  Future<void> loadGame(String configName);
}

class BeerGameConfigService extends StateNotifier<GameConfiguration>
    implements GameConfigService {
  BeerGameConfigService() : super(GameConfiguration.defaultConfiguration());

  @override
  Future<void> listGames() async {}

  @override
  Future<void> loadGame(String configName) async {}

  @override
  Future<void> saveGame() async {}
}
