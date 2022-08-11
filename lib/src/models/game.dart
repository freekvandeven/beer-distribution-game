import 'package:beer_distribution_game/src/models/models.dart';
import 'package:flutter/material.dart';

@immutable
class BeerGame {
  const BeerGame({
    required this.gameName,
    required this.config,
  });
  final String gameName;
  final GameConfiguration config;
}
