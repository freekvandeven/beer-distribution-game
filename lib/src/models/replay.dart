import 'package:beer_distribution_game/src/models/models.dart';
import 'package:flutter/material.dart';

@immutable
class GameReplay {
  const GameReplay({
    required this.config,
    required this.moves,
    required this.lobbyName,
    required this.started,
    required this.finished,
  });

  factory GameReplay.fromJson(Map<String, dynamic> json) => GameReplay(
        config:
            GameConfiguration.fromJson(json['config'] as Map<String, dynamic>),
        moves: (json['moves'] as List)
            .map((e) => Move.fromJson(e as Map<String, dynamic>))
            .toList(),
        lobbyName: json['lobbyName'] as String,
        started: json['started'] as DateTime,
        finished: json['finished'] as DateTime,
      );

  final GameConfiguration config;
  final List<Move> moves;
  final String lobbyName;
  final DateTime started;
  final DateTime finished;

  Map<String, dynamic> toJson() => {
        'config': config.toJson(),
        'moves': moves.map((m) => m.toJson()).toList(),
        'lobbyName': lobbyName,
        'started': started.toIso8601String(),
        'finished': finished.toIso8601String(),
      };
}
