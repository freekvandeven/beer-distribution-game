import 'package:flutter/material.dart';

@immutable
class GameConfiguration {
  const GameConfiguration({
    required this.configName,
    required this.maxAmountPlayers,
  });
  final String configName;
  final int maxAmountPlayers;
}
