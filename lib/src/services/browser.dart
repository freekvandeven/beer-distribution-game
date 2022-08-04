import 'package:beer_distribution_game/src/models/gameinfo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class GameBrowserService extends StateNotifier<List<GameInfo>> {
  GameBrowserService._() : super([]);
}

class BeerGameBrowserService extends StateNotifier<List<GameInfo>>
    implements GameBrowserService {
  BeerGameBrowserService() : super([]);
}
