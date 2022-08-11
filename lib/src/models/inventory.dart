import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

@immutable
class PlayerInventory extends Equatable {
  const PlayerInventory({
    required this.amount,
    required this.transit,
  });

  final int amount;
  final int transit;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        amount,
        transit,
      ];

  PlayerInventory copyWith({
    int? amount,
    int? transit,
  }) =>
      PlayerInventory(
        amount: amount ?? this.amount,
        transit: transit ?? this.transit,
      );
}
