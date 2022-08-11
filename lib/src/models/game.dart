import 'package:beer_distribution_game/src/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class BeerGame extends Equatable {
  const BeerGame({
    required this.gameName,
    required this.config,
    required this.players,
    required this.moves,
    required this.currentRound,
    required this.gameHash,
    this.started,
    this.finished,
  });

  factory BeerGame.defaultGame() => BeerGame(
        gameName: '',
        config: GameConfiguration.defaultConfiguration(),
        players: [],
        moves: [],
        currentRound: 0,
        gameHash: '',
      );

  final String gameName;
  final GameConfiguration config;
  final List<Player> players;
  final List<Move> moves;
  final int currentRound;
  final String gameHash;
  final DateTime? started;
  final DateTime? finished;

  @override
  List<Object?> get props => [
        gameName,
        config,
        players,
        moves,
        currentRound,
        gameHash,
        started,
        finished,
      ];

  @override
  bool? get stringify => true;

  BeerGame copyWith({
    String? gameName,
    GameConfiguration? config,
    List<Player>? players,
    List<Move>? moves,
    int? currentRound,
    String? gameHash,
    DateTime? started,
    DateTime? finished,
  }) =>
      BeerGame(
        gameName: gameName ?? this.gameName,
        config: config ?? this.config,
        players: players ?? this.players,
        moves: moves ?? this.moves,
        currentRound: currentRound ?? this.currentRound,
        gameHash: gameHash ?? this.gameHash,
        started: started ?? this.started,
        finished: finished ?? this.finished,
      );
}
