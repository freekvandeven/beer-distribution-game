import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Move extends Equatable {
  const Move({
    required this.sender,
    required this.orders,
    required this.delivers,
    required this.gameHash,
  });

  factory Move.fromJson(Map<String, dynamic> json) {
    return Move(
      sender: json['sender'] as int,
      orders: json['order'] as Map<int, int>,
      delivers: json['deliver'] as Map<int, int>,
      gameHash: json['hash'] as String,
    );
  }

  final int sender;
  final Map<int, int> orders;
  final Map<int, int> delivers;
  final String gameHash;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [sender, orders, delivers, gameHash];

  Map<String, dynamic> toJson() => {
        'sender': sender,
        'orders': orders,
        'delivers': delivers,
        'hash': gameHash,
      };
}
