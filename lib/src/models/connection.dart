import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

@immutable
class ConnectionInfo {
  const ConnectionInfo({
    required this.playerUUID,
    required this.ip,
    required this.port,
  });

  final Uuid playerUUID;
  final String ip;
  final int port;
}
