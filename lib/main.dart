import 'package:beer_distribution_game/src/app.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  EquatableConfig.stringify = true;
  runApp(ProviderScope(child: BeerDistributionGame()));
}
