import 'dart:convert';

import 'package:beer_distribution_game/src/models/models.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class GameReplayService extends StateNotifier<List<GameReplay>> {
  GameReplayService._() : super([]);
  Future<void> getAllReplays();
  Future<void> saveReplay(BeerGame game);
}

class LocalGameStorageReplayService extends StateNotifier<List<GameReplay>>
    implements GameReplayService {
  LocalGameStorageReplayService() : super([]);

  @override
  Future<void> getAllReplays() async {
    // check in shared preferences if there are any saved replays

    // then update the state
  }

  @override
  Future<void> saveReplay(BeerGame game) async {
    // save the game to shared preferences, update existing game if any
    var replay = GameReplay(
      config: game.config,
      moves: [],
      lobbyName: game.gameName,
      started: DateTime.now(),
      finished: DateTime.now(),
    );
    // TODO(anyone): add mapping table between replayname and actual replay
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString(game.gameName, jsonEncode(replay));
  }
}
