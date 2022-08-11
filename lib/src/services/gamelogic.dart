import 'package:beer_distribution_game/src/models/models.dart';

abstract class GameLogicService {
  BeerGame processRound(BeerGame game, List<Move> moves);
  BeerGame initializeInventories(BeerGame game);
}

class MitGameRulesLogicService implements GameLogicService {
  static const int inventoryMax = 10;
  static const int inventoryMin = 1;

  @override
  BeerGame processRound(BeerGame game, List<Move> moves) {
    return game;
  }

  @override
  BeerGame initializeInventories(BeerGame game) {
    return game;
  }
}
