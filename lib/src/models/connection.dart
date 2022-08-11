import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

@immutable
class ConnectionInfo extends Equatable {
  const ConnectionInfo({
    required this.playerUUID,
    required this.ip,
    required this.port,
  });

  final Uuid playerUUID;
  final String ip;
  final int port;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        playerUUID,
        ip,
        port,
      ];
}
