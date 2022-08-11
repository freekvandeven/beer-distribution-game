import 'package:flutter/material.dart';

@immutable
class Move {
  const Move({
    required this.playerNumber,
    required this.amount,
  });

  factory Move.fromJson(Map<String, dynamic> json) {
    return Move(
      playerNumber: json['playerNumber'] as int,
      amount: json['amount'] as int,
    );
  }

  final int playerNumber;
  final int amount;

  Map<String, dynamic> toJson() => {
        'playerNumber': playerNumber,
        'amount': amount,
      };
}
