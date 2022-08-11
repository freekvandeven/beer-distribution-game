import 'package:beer_distribution_game/src/models/models.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class GameService extends StateNotifier<BeerGame> {
  GameService._()
      : super(
          BeerGame.defaultGame(),
        );
}

class BeerGameService extends StateNotifier<BeerGame> implements GameService {
  BeerGameService()
      : super(
          BeerGame.defaultGame(),
        );
}
