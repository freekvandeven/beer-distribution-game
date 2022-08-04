import 'package:beer_distribution_game/src/models/models.dart';
import 'package:flutter/material.dart';

@immutable
class GameInfo {
  const GameInfo({
    required this.lobbyName,
    required this.configName,
    required this.connectionInfo,
    required this.connectedPlayers,
    required this.maxPlayers,
  });
  final String lobbyName;
  final String configName;
  final int connectedPlayers; // could be removed
  final int maxPlayers; // could be removed
  final List<ConnectionInfo> connectionInfo;
}
