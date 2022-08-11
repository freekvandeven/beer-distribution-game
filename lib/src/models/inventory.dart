import 'package:flutter/widgets.dart';

@immutable
class PlayerInventory {
  const PlayerInventory({
    required this.amount,
    required this.transit,
  });

  final int amount;
  final int transit;

  PlayerInventory copyWith({
    int? amount,
    int? transit,
  }) =>
      PlayerInventory(
        amount: amount ?? this.amount,
        transit: transit ?? this.transit,
      );
}
