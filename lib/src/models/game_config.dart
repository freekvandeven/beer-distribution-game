import 'package:beer_distribution_game/src/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum GameRoundTransition {
  timer,
  playersready,
  combination,
}

@immutable
class GameConfiguration extends Equatable {
  const GameConfiguration({
    required this.configName,
    required this.transition,
    required this.amountRounds,
    required this.roundTime,
    required this.autoStartTime,
    required this.gameSeed,
    required this.maxAmountPlayers,
    required this.playerNodes,
    required this.defaultAgents,
  });

  factory GameConfiguration.fromJson(Map<String, dynamic> json) {
    return GameConfiguration(
      configName: json['configName'] as String,
      transition: GameRoundTransition.values[json['transition'] as int],
      amountRounds: json['amountRounds'] as int,
      roundTime: json['roundTime'] as int,
      autoStartTime: json['autoStartTime'] as DateTime,
      gameSeed: json['gameSeed'] as int,
      maxAmountPlayers: json['maxAmountPlayers'] as int,
      playerNodes: (json['playerNodes'] as List)
          .map((e) => PlayerNode.fromJson(e as Map<String, dynamic>))
          .toList(),
      defaultAgents: json['defaultAgents'] as Map<String, String>,
    );
  }

  factory GameConfiguration.defaultConfiguration() => GameConfiguration(
        configName: '',
        transition: GameRoundTransition.timer,
        amountRounds: 1,
        roundTime: 1,
        autoStartTime: DateTime.now(),
        gameSeed: 0,
        maxAmountPlayers: 1,
        playerNodes: [],
        defaultAgents: {},
      );

  final String configName;
  final GameRoundTransition transition;
  final int amountRounds;
  final int roundTime;
  final DateTime autoStartTime;
  final int gameSeed;
  final int maxAmountPlayers;
  final List<PlayerNode> playerNodes;
  final Map<String, String> defaultAgents;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        configName,
        transition,
        amountRounds,
        roundTime,
        autoStartTime,
        gameSeed,
        maxAmountPlayers,
        playerNodes,
        defaultAgents,
      ];

  Map<String, dynamic> toJson() => {
        'configName': configName,
        'transition': transition.index,
        'amountRounds': amountRounds,
        // roundTime is a datetime
        'roundTime': roundTime,
        'autoStartTime': autoStartTime.toIso8601String(),
        'gameSeed': gameSeed,
        'maxAmountPlayers': maxAmountPlayers,
        'playerNodes': playerNodes.map((e) => e.toJson()).toList(),
        'defaultAgents': defaultAgents,
      };
}
