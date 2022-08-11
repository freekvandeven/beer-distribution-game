import 'package:beer_distribution_game/src/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Player extends Equatable {
  const Player({
    required this.playerNumber,
    required this.inventory,
    required this.backlog,
    required this.agent,
    this.connectionInfo,
  });

  final int playerNumber;
  final PlayerInventory inventory;
  final Map<int, int> backlog;
  final String agent;
  final ConnectionInfo? connectionInfo;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        playerNumber,
        inventory,
        backlog,
        agent,
        connectionInfo,
      ];

  Player copyWith({
    int? playerNumber,
    PlayerInventory? inventory,
    Map<int, int>? backlog,
    String? agent,
    ConnectionInfo? connectionInfo,
  }) =>
      Player(
        playerNumber: playerNumber ?? this.playerNumber,
        inventory: inventory ?? this.inventory,
        backlog: backlog ?? this.backlog,
        agent: agent ?? this.agent,
        connectionInfo: connectionInfo ?? this.connectionInfo,
      );
}
