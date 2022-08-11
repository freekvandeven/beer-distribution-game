import 'package:beer_distribution_game/src/models/gameinfo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class GameBrowserService extends StateNotifier<List<GameInfo>> {
  GameBrowserService._() : super([]);

  Future<void> getAllActiveGames();
}

class FirebaseGameBrowserService extends StateNotifier<List<GameInfo>>
    implements GameBrowserService {
  FirebaseGameBrowserService() : super([]);

  @override
  Future<void> getAllActiveGames() async {
    // do a call to firebase to get all active games

    // then update the state
  }
}
