import 'package:flutter/material.dart';

@immutable
class GameConfiguration {
  const GameConfiguration({
    required this.configName,
    required this.maxAmountPlayers,
  });

  factory GameConfiguration.fromJson(Map<String, dynamic> json) {
    return GameConfiguration(
      configName: json['configName'] as String,
      maxAmountPlayers: json['maxAmountPlayers'] as int,
    );
  }

  final String configName;
  final int maxAmountPlayers;

  Map<String, dynamic> toJson() => {
        'configName': configName,
        'maxAmountPlayers': maxAmountPlayers,
      };
}
