import 'package:flutter/material.dart';

@immutable
class Move {
  const Move({
    required this.sender,
    required this.receiver,
    required this.order,
    required this.deliver,
    required this.gameHash,
  });

  factory Move.fromJson(Map<String, dynamic> json) {
    return Move(
      sender: json['sender'] as int,
      receiver: json['receiver'] as int,
      order: json['order'] as int,
      deliver: json['deliver'] as int,
      gameHash: json['hash'] as String,
    );
  }

  final int sender;
  final int receiver;
  final int order;
  final int deliver;
  final String gameHash;

  Map<String, dynamic> toJson() => {
        'sender': sender,
        'receiver': receiver,
        'order': order,
        'deliver': deliver,
        'hash': gameHash,
      };
}
