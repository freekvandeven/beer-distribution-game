import 'package:beer_distribution_game/src/models/models.dart';
import 'package:flutter/material.dart';

@immutable
class Player {
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
}
