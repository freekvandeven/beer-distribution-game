import 'package:beer_distribution_game/src/models/models.dart';
import 'package:flutter/material.dart';

@immutable
class BeerGame {
  const BeerGame({
    required this.gameName,
    required this.config,
    required this.players,
    required this.moves,
    required this.gameHash,
    this.started,
    this.finished,
  });

  factory BeerGame.defaultGame() => BeerGame(
        gameName: '',
        config: GameConfiguration.defaultConfiguration(),
        players: [],
        moves: [],
        gameHash: '',
      );

  final String gameName;
  final GameConfiguration config;
  final List<Player> players;
  final List<Move> moves;
  final String gameHash;
  final DateTime? started;
  final DateTime? finished;
}
